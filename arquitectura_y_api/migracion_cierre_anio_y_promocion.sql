-- =============================================================================
-- MIGRACIÓN: CIERRE DE AÑO LECTIVO Y ASISTENTE DE PROMOCIÓN DE CURSOS
-- =============================================================================
-- SIGA Escolar - Escuela Coeducacional N° 1 El Salvador
-- Sprint 7 / Cierre de Año Lectivo
-- =============================================================================

-- 1. MODIFICAR TABLA CURSOS (Agregar profesor_jefe_id y asegurar constraint única)
ALTER TABLE cursos 
ADD COLUMN IF NOT EXISTS profesor_jefe_id UUID REFERENCES usuarios(id) ON DELETE SET NULL;

CREATE INDEX IF NOT EXISTS idx_cursos_profesor_jefe ON cursos(profesor_jefe_id);

-- Asegurar constraints requeridas para ON CONFLICT
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'unique_periodo_tenant'
    ) THEN
        ALTER TABLE periodos_academicos ADD CONSTRAINT unique_periodo_tenant UNIQUE (tenant_id, anio);
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'unique_curso_periodo'
    ) THEN
        ALTER TABLE cursos ADD CONSTRAINT unique_curso_periodo UNIQUE (tenant_id, nombre, periodo_id);
    END IF;
END $$;

-- 2. MODIFICAR TABLA ESTUDIANTES (Agregar estado_matricula normativo)
ALTER TABLE estudiantes 
ADD COLUMN IF NOT EXISTS estado_matricula VARCHAR(20) NOT NULL DEFAULT 'Regular'
CHECK (estado_matricula IN ('Regular', 'Egresado', 'Retirado', 'Suspendido'));

CREATE INDEX IF NOT EXISTS idx_estudiantes_estado_matricula ON estudiantes(tenant_id, estado_matricula);

-- 3. CREAR TABLA MATRICULAS (Historial cronológico de cursos por período académico)
CREATE TABLE IF NOT EXISTS matriculas (
    id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id       UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    estudiante_id   UUID NOT NULL REFERENCES estudiantes(id) ON DELETE CASCADE,
    curso_id        UUID REFERENCES cursos(id) ON DELETE SET NULL,
    periodo_id      UUID NOT NULL REFERENCES periodos_academicos(id) ON DELETE CASCADE,
    anio            INT NOT NULL,
    estado_final    VARCHAR(20) NOT NULL DEFAULT 'En Curso' 
                    CHECK (estado_final IN ('En Curso', 'Promovido', 'Repitente', 'Egresado', 'Retirado')),
    fecha_matricula DATE NOT NULL DEFAULT CURRENT_DATE,
    created_at      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_matricula_estudiante_periodo UNIQUE (tenant_id, estudiante_id, periodo_id)
);

-- RLS para matriculas
ALTER TABLE matriculas ENABLE ROW LEVEL SECURITY;

DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies WHERE tablename = 'matriculas' AND policyname = 'tenant_isolation_matriculas'
    ) THEN
        CREATE POLICY tenant_isolation_matriculas ON matriculas
            USING (tenant_id = current_setting('app.tenant_id', true)::uuid);
    END IF;
END $$;

-- Índices de matriculas
CREATE INDEX IF NOT EXISTS idx_matriculas_tenant ON matriculas(tenant_id);
CREATE INDEX IF NOT EXISTS idx_matriculas_estudiante ON matriculas(estudiante_id);
CREATE INDEX IF NOT EXISTS idx_matriculas_curso ON matriculas(curso_id);
CREATE INDEX IF NOT EXISTS idx_matriculas_periodo ON matriculas(periodo_id);
CREATE INDEX IF NOT EXISTS idx_matriculas_anio ON matriculas(tenant_id, anio);

-- 4. BACKFILL INICIAL (Poblar matriculas con cursos actuales para retrocompatibilidad)
INSERT INTO matriculas (tenant_id, estudiante_id, curso_id, periodo_id, anio, estado_final)
SELECT 
    e.tenant_id,
    e.id AS estudiante_id,
    e.curso_id,
    c.periodo_id,
    COALESCE(c.anio_academico, p.anio, EXTRACT(YEAR FROM CURRENT_DATE)::INT) AS anio,
    'En Curso' AS estado_final
FROM estudiantes e
INNER JOIN cursos c ON e.curso_id = c.id
LEFT JOIN periodos_academicos p ON c.periodo_id = p.id
WHERE e.curso_id IS NOT NULL AND c.periodo_id IS NOT NULL
ON CONFLICT (tenant_id, estudiante_id, periodo_id) DO NOTHING;

-- 5. FUNCIÓN RPC TRANSACCIONAL: EJECUTAR CIERRE DE AÑO Y PROMOCIÓN
CREATE OR REPLACE FUNCTION ejecutar_cierre_anio_y_promocion(
    p_tenant_id            UUID,
    p_usuario_id           UUID DEFAULT NULL,
    p_periodo_anterior_id  UUID DEFAULT NULL,
    p_nuevo_anio           INT DEFAULT EXTRACT(YEAR FROM CURRENT_DATE)::INT + 1,
    p_fecha_inicio         DATE DEFAULT CURRENT_DATE,
    p_fecha_fin            DATE DEFAULT (CURRENT_DATE + INTERVAL '10 months')::DATE,
    p_cursos_config        JSONB DEFAULT '[]'::jsonb,
    p_promociones          JSONB DEFAULT '[]'::jsonb
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_nuevo_periodo_id     UUID;
    v_curso_elem           JSONB;
    v_promo_elem           JSONB;
    v_nuevo_curso_id       UUID;
    v_estudiante_id        UUID;
    v_curso_ant_id         UUID;
    v_estado_final         VARCHAR(20);
    v_nuevo_curso_nombre   VARCHAR(50);
    v_total_promovidos     INT := 0;
    v_total_repitentes     INT := 0;
    v_total_egresados      INT := 0;
    v_total_retirados      INT := 0;
    v_map_cursos           JSONB := '{}'::jsonb;
BEGIN
    -- 1. Cerrar período anterior si se especificó
    IF p_periodo_anterior_id IS NOT NULL THEN
        UPDATE periodos_academicos
        SET activo = FALSE
        WHERE id = p_periodo_anterior_id AND tenant_id = p_tenant_id;
    END IF;

    -- 2. Desactivar cualquier otro período activo del tenant
    UPDATE periodos_academicos
    SET activo = FALSE
    WHERE tenant_id = p_tenant_id;

    -- 3. Crear o actualizar el nuevo período académico activo (Seguro sin ON CONFLICT)
    SELECT id INTO v_nuevo_periodo_id
    FROM periodos_academicos
    WHERE tenant_id = p_tenant_id AND anio = p_nuevo_anio;

    IF v_nuevo_periodo_id IS NOT NULL THEN
        UPDATE periodos_academicos
        SET fecha_inicio = p_fecha_inicio,
            fecha_fin    = p_fecha_fin,
            activo       = TRUE
        WHERE id = v_nuevo_periodo_id;
    ELSE
        INSERT INTO periodos_academicos (tenant_id, anio, fecha_inicio, fecha_fin, activo)
        VALUES (p_tenant_id, p_nuevo_anio, p_fecha_inicio, p_fecha_fin, TRUE)
        RETURNING id INTO v_nuevo_periodo_id;
    END IF;

    -- 4. Crear o actualizar los cursos del nuevo período académico (Seguro sin ON CONFLICT)
    FOR v_curso_elem IN SELECT * FROM jsonb_array_elements(p_cursos_config)
    LOOP
        SELECT id INTO v_nuevo_curso_id
        FROM cursos
        WHERE tenant_id = p_tenant_id
          AND periodo_id = v_nuevo_periodo_id
          AND nombre = (v_curso_elem->>'nombre')::VARCHAR;

        IF v_nuevo_curso_id IS NOT NULL THEN
            UPDATE cursos
            SET profesor_jefe_id = NULLIF(v_curso_elem->>'profesor_jefe_id', '')::UUID,
                nivel            = (v_curso_elem->>'nivel')::VARCHAR,
                letra            = (v_curso_elem->>'letra')::VARCHAR,
                anio_academico   = p_nuevo_anio
            WHERE id = v_nuevo_curso_id;
        ELSE
            INSERT INTO cursos (
                tenant_id,
                nombre,
                nivel,
                letra,
                periodo_id,
                anio_academico,
                profesor_jefe_id
            )
            VALUES (
                p_tenant_id,
                (v_curso_elem->>'nombre')::VARCHAR,
                (v_curso_elem->>'nivel')::VARCHAR,
                (v_curso_elem->>'letra')::VARCHAR,
                v_nuevo_periodo_id,
                p_nuevo_anio,
                NULLIF(v_curso_elem->>'profesor_jefe_id', '')::UUID
            )
            RETURNING id INTO v_nuevo_curso_id;
        END IF;

        v_map_cursos := jsonb_set(
            v_map_cursos,
            ARRAY[v_curso_elem->>'nombre'],
            to_jsonb(v_nuevo_curso_id::text)
        );
    END LOOP;

    -- 5. Procesar cada estudiante en la nómina de promoción
    FOR v_promo_elem IN SELECT * FROM jsonb_array_elements(p_promociones)
    LOOP
        v_estudiante_id      := (v_promo_elem->>'estudiante_id')::UUID;
        v_curso_ant_id       := NULLIF(v_promo_elem->>'curso_anterior_id', '')::UUID;
        v_estado_final       := (v_promo_elem->>'estado_final')::VARCHAR;
        v_nuevo_curso_nombre := v_promo_elem->>'nuevo_curso_nombre';

        -- A. Registrar/actualizar estado en matriculas del año anterior
        IF p_periodo_anterior_id IS NOT NULL THEN
            UPDATE matriculas
            SET estado_final = v_estado_final
            WHERE tenant_id = p_tenant_id
              AND estudiante_id = v_estudiante_id
              AND periodo_id = p_periodo_anterior_id;

            IF NOT FOUND THEN
                INSERT INTO matriculas (tenant_id, estudiante_id, curso_id, periodo_id, anio, estado_final)
                VALUES (
                    p_tenant_id, 
                    v_estudiante_id, 
                    v_curso_ant_id, 
                    p_periodo_anterior_id, 
                    (SELECT anio FROM periodos_academicos WHERE id = p_periodo_anterior_id),
                    v_estado_final
                );
            END IF;
        END IF;

        -- B. Aplicar resolución según estado_final
        IF v_estado_final = 'Egresado' THEN
            UPDATE estudiantes
            SET curso_id         = NULL,
                estado_matricula = 'Egresado',
                activo           = FALSE
            WHERE id = v_estudiante_id AND tenant_id = p_tenant_id;

            v_total_egresados := v_total_egresados + 1;

        ELSIF v_estado_final = 'Retirado' THEN
            UPDATE estudiantes
            SET curso_id         = NULL,
                estado_matricula = 'Retirado',
                activo           = FALSE
            WHERE id = v_estudiante_id AND tenant_id = p_tenant_id;

            v_total_retirados := v_total_retirados + 1;

        ELSE -- 'Promovido' o 'Repitente'
            v_nuevo_curso_id := (v_map_cursos->>v_nuevo_curso_nombre)::UUID;

            IF v_nuevo_curso_id IS NULL THEN
                -- Buscar el curso por nombre y periodo si no estuviera en el mapa en memoria
                SELECT id INTO v_nuevo_curso_id
                FROM cursos
                WHERE tenant_id = p_tenant_id
                  AND periodo_id = v_nuevo_periodo_id
                  AND nombre = v_nuevo_curso_nombre;
            END IF;

            UPDATE estudiantes
            SET curso_id         = v_nuevo_curso_id,
                estado_matricula = 'Regular',
                activo           = TRUE
            WHERE id = v_estudiante_id AND tenant_id = p_tenant_id;

            -- Crear o actualizar matrícula en el nuevo período
            IF v_nuevo_curso_id IS NOT NULL THEN
                UPDATE matriculas
                SET curso_id     = v_nuevo_curso_id,
                    estado_final = 'En Curso'
                WHERE tenant_id = p_tenant_id
                  AND estudiante_id = v_estudiante_id
                  AND periodo_id = v_nuevo_periodo_id;

                IF NOT FOUND THEN
                    INSERT INTO matriculas (tenant_id, estudiante_id, curso_id, periodo_id, anio, estado_final)
                    VALUES (
                        p_tenant_id,
                        v_estudiante_id,
                        v_nuevo_curso_id,
                        v_nuevo_periodo_id,
                        p_nuevo_anio,
                        'En Curso'
                    );
                END IF;
            END IF;

            IF v_estado_final = 'Promovido' THEN
                v_total_promovidos := v_total_promovidos + 1;
            ELSE
                v_total_repitentes := v_total_repitentes + 1;
            END IF;
        END IF;
    END LOOP;

    -- 6. Registrar en auditoría
    INSERT INTO auditoria (
        tenant_id,
        usuario_id,
        accion,
        tabla_afectada,
        registro_id,
        detalle
    )
    VALUES (
        p_tenant_id,
        p_usuario_id,
        'UPDATE',
        'periodos_academicos',
        v_nuevo_periodo_id,
        jsonb_build_object(
            'operacion', 'CIERRE_ANIO_Y_PROMOCION_CURSOS',
            'periodo_anterior_id', p_periodo_anterior_id,
            'nuevo_anio', p_nuevo_anio,
            'total_promovidos', v_total_promovidos,
            'total_repitentes', v_total_repitentes,
            'total_egresados', v_total_egresados,
            'total_retirados', v_total_retirados
        )
    );

    RETURN jsonb_build_object(
        'success', TRUE,
        'nuevo_periodo_id', v_nuevo_periodo_id,
        'nuevo_anio', p_nuevo_anio,
        'total_promovidos', v_total_promovidos,
        'total_repitentes', v_total_repitentes,
        'total_egresados', v_total_egresados,
        'total_retirados', v_total_retirados
    );
END;
$$;
