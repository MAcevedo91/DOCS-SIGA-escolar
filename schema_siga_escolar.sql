-- =============================================================================
-- SCRIPT DDL & SEED OFICIAL - SIGA ESCOLAR (ARQUITECTURA MULTI-TENANT)
-- =============================================================================
-- Proyecto: Sistema de Gestión y Acompañamiento Escolar (SIGA Escolar)
-- Cliente:  Escuela Coeducacional N°1 El Salvador, Atacama, Chile
-- Equipo:   Marcelo Acevedo Silva (Backend/PM) | Daniel Flores Jaime (Frontend/UI)
-- Motor:    PostgreSQL 15+ / Supabase
-- Versión:  v4.0 (Actualizado con Sprints 1, 2, 3 y 4)
-- Ubicación: DOCS/schema_siga_escolar.sql
-- =============================================================================

-- -----------------------------------------------------------------------------
-- EXTENSIONES NECESARIAS
-- -----------------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "unaccent";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- -----------------------------------------------------------------------------
-- FUNCIÓN HELPER DE MULTI-TENANCY Y AISLAMIENTO DE SESIÓN (RLS)
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION set_tenant(p_tenant_id UUID)
RETURNS void AS $$
BEGIN
    PERFORM set_config('app.tenant_id', p_tenant_id::text, false);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =============================================================================
-- 1. TENANTS (Establecimientos Educacionales / Colegios)
-- =============================================================================
CREATE TABLE IF NOT EXISTS tenants (
    id             UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nombre         VARCHAR(255) NOT NULL,
    rbd            VARCHAR(50)  UNIQUE NOT NULL,
    direccion      VARCHAR(255),
    activo         BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =============================================================================
-- 2. USUARIOS (Personal docente, directivo, convivencia con acceso al sistema)
-- =============================================================================
CREATE TABLE IF NOT EXISTS usuarios (
    id                UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id         UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    email             VARCHAR(255) NOT NULL,
    password          VARCHAR(255) NOT NULL,
    nombre            VARCHAR(100) NOT NULL,
    apellido          VARCHAR(100) NOT NULL,
    rol               VARCHAR(50)  NOT NULL CHECK (rol IN (
                          'Administrador',
                          'Directivo',
                          'Inspector',
                          'Docente',
                          'Equipo de Formación'
                      )),
    activo            BOOLEAN NOT NULL DEFAULT TRUE,
    intentos_fallidos INT     NOT NULL DEFAULT 0,
    bloqueado_hasta   TIMESTAMP WITH TIME ZONE,
    fecha_creacion    TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_email_per_tenant UNIQUE (tenant_id, email)
);

-- =============================================================================
-- 3. PERIODOS ACADÉMICOS (Años Lectivos Oficiales del Establecimiento)
-- =============================================================================
CREATE TABLE IF NOT EXISTS periodos_academicos (
    id             UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id      UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    anio           INT NOT NULL,
    fecha_inicio   DATE,
    fecha_fin      DATE,
    activo         BOOLEAN NOT NULL DEFAULT TRUE,
    created_at     TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_periodo_tenant UNIQUE (tenant_id, anio)
);

-- =============================================================================
-- 4. CURSOS (Estructura de Cursos por Nivel, Letra y Período Académico)
-- =============================================================================
CREATE TABLE IF NOT EXISTS cursos (
    id             UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id      UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    nombre         VARCHAR(50) NOT NULL,
    nivel          VARCHAR(50) NOT NULL,
    letra          VARCHAR(5),
    periodo_id     UUID REFERENCES periodos_academicos(id) ON DELETE RESTRICT,
    anio_academico INT,
    CONSTRAINT unique_curso_periodo UNIQUE (tenant_id, nombre, periodo_id)
);

-- =============================================================================
-- 4. ESTUDIANTES
-- =============================================================================
CREATE TABLE IF NOT EXISTS estudiantes (
    id               UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id        UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    rut              VARCHAR(12) NOT NULL,
    nombre           VARCHAR(100) NOT NULL,
    apellido         VARCHAR(100) NOT NULL,
    curso_id         UUID REFERENCES cursos(id) ON DELETE SET NULL,
    fecha_nacimiento DATE,
    es_pie           BOOLEAN NOT NULL DEFAULT FALSE,
    direccion        VARCHAR(255),
    activo           BOOLEAN NOT NULL DEFAULT TRUE,
    search_vector    TSVECTOR,
    CONSTRAINT unique_rut_per_tenant UNIQUE (tenant_id, rut)
);

-- =============================================================================
-- 5. APODERADOS
-- =============================================================================
CREATE TABLE IF NOT EXISTS apoderados (
    id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id     UUID NOT NULL REFERENCES tenants(id)      ON DELETE CASCADE,
    estudiante_id UUID NOT NULL REFERENCES estudiantes(id)  ON DELETE CASCADE,
    nombre        VARCHAR(100) NOT NULL,
    apellido      VARCHAR(100) NOT NULL,
    rut           VARCHAR(12),
    email         VARCHAR(255),
    telefono      VARCHAR(20),
    direccion     VARCHAR(255),
    es_titular    BOOLEAN NOT NULL DEFAULT TRUE
);

-- =============================================================================
-- 6. FUNCIONARIOS
-- =============================================================================
CREATE TABLE IF NOT EXISTS funcionarios (
    id                UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id         UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    rut               VARCHAR(12),
    nombre            VARCHAR(100) NOT NULL,
    apellido          VARCHAR(100) NOT NULL,
    rol_institucional VARCHAR(100),
    activo            BOOLEAN NOT NULL DEFAULT TRUE
);

-- =============================================================================
-- 7. TABLA PARAMÉTRICA: TIPOS DE ABORDAJE (Catálogo)
-- =============================================================================
CREATE TABLE IF NOT EXISTS tipos_abordaje (
    id     SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- =============================================================================
-- 8. TABLA PARAMÉTRICA: TIPOS DE PROTOCOLO RICE (10 Normativos Supereduc)
-- =============================================================================
CREATE TABLE IF NOT EXISTS tipos_protocolo (
    id     SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL UNIQUE
);

-- =============================================================================
-- 9. REGLAS DE PROTOCOLO Y PLAZOS NORMATIVOS (Sprint 4 - Motor de Reglas)
-- =============================================================================
CREATE TABLE IF NOT EXISTS reglas_protocolo (
    id                UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id         UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    tipo_protocolo_id INT NOT NULL REFERENCES tipos_protocolo(id) ON DELETE CASCADE,
    orden             SMALLINT NOT NULL,
    accion            TEXT NOT NULL,
    plazo_dias        SMALLINT NOT NULL,
    prorrogable       BOOLEAN NOT NULL DEFAULT TRUE,
    activo            BOOLEAN NOT NULL DEFAULT TRUE,
    created_at        TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_regla_orden UNIQUE (tenant_id, tipo_protocolo_id, orden)
);

-- =============================================================================
-- 10. INCIDENTES (Bitácora de Convivencia Escolar — RF-06)
-- =============================================================================
CREATE TABLE IF NOT EXISTS incidentes (
    id               UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id        UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    usuario_id       UUID NOT NULL REFERENCES usuarios(id),
    tipo_abordaje_id INT  REFERENCES tipos_abordaje(id),
    fecha            DATE NOT NULL,
    gravedad         VARCHAR(20) NOT NULL CHECK (gravedad IN ('Leve', 'Grave', 'Gravísima')),
    relato           TEXT NOT NULL,
    medidas          TEXT,
    estado           VARCHAR(30) NOT NULL DEFAULT 'En Investigación'
                     CHECK (estado IN ('En Investigación', 'Derivado', 'Cerrado')),
    fecha_creacion   TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    search_vector    TSVECTOR
);

-- =============================================================================
-- 11. INCIDENTE_ESTUDIANTES (Relación N:M involucrados por incidente)
-- =============================================================================
CREATE TABLE IF NOT EXISTS incidente_estudiantes (
    incidente_id  UUID NOT NULL REFERENCES incidentes(id)  ON DELETE CASCADE,
    estudiante_id UUID NOT NULL REFERENCES estudiantes(id) ON DELETE CASCADE,
    es_victima    BOOLEAN, -- TRUE = víctima, FALSE = agresor, NULL = testigo
    observacion   TEXT,
    PRIMARY KEY (incidente_id, estudiante_id)
);

-- =============================================================================
-- 12. ENTREVISTAS A FUNCIONARIOS
-- =============================================================================
CREATE TABLE IF NOT EXISTS entrevistas_funcionarios (
    id             UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id      UUID NOT NULL REFERENCES tenants(id)     ON DELETE CASCADE,
    funcionario_id UUID NOT NULL REFERENCES funcionarios(id),
    registrado_por UUID NOT NULL REFERENCES usuarios(id),
    incidente_id   UUID REFERENCES incidentes(id)           ON DELETE SET NULL,
    fecha          DATE NOT NULL,
    tipo           VARCHAR(100),
    descripcion    TEXT NOT NULL,
    fecha_creacion TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =============================================================================
-- 13. PROTOCOLOS RICE (Gestión de Protocolos Normativos — RF-08, RF-09)
-- =============================================================================
CREATE TABLE IF NOT EXISTS protocolos_rice (
    id                  UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id           UUID NOT NULL REFERENCES tenants(id)        ON DELETE CASCADE,
    estudiante_id       UUID NOT NULL REFERENCES estudiantes(id),
    incidente_id        UUID REFERENCES incidentes(id)              ON DELETE SET NULL,
    tipo_protocolo_id   INT  NOT NULL REFERENCES tipos_protocolo(id),
    estado              VARCHAR(30) NOT NULL DEFAULT 'En Investigación'
                        CHECK (estado IN ('En Investigación', 'Derivado', 'Cerrado')),
    registrado_por      UUID NOT NULL REFERENCES usuarios(id),
    fecha_apertura      DATE NOT NULL,
    fecha_cierre        DATE,
    observaciones       TEXT,
    fecha_creacion      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
);

-- =============================================================================
-- 13.1 PASOS DE PROTOCOLO RICE (Checklist Normativo y Certificación — Sprint 5)
-- =============================================================================
CREATE TABLE IF NOT EXISTS protocolo_pasos (
    id                UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id         UUID NOT NULL REFERENCES tenants(id)        ON DELETE CASCADE,
    protocolo_id      UUID NOT NULL REFERENCES protocolos_rice(id) ON DELETE CASCADE,
    regla_id          UUID REFERENCES reglas_protocolo(id)         ON DELETE SET NULL,
    orden             SMALLINT NOT NULL,
    accion            TEXT NOT NULL,
    plazo_dias        SMALLINT NOT NULL,
    completado        BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_completado  TIMESTAMP WITH TIME ZONE,
    responsable_id    UUID REFERENCES usuarios(id)                 ON DELETE SET NULL,
    observacion       TEXT,
    created_at        TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_protocolo_paso_orden UNIQUE (protocolo_id, orden)
);

-- =============================================================================
-- 14. NOTIFICACIONES (Alertas para Incidentes Graves/Gravísimos — RF-07)
-- =============================================================================
CREATE TABLE IF NOT EXISTS notificaciones (
    id             UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id      UUID NOT NULL REFERENCES tenants(id)     ON DELETE CASCADE,
    incidente_id   UUID NOT NULL REFERENCES incidentes(id)  ON DELETE CASCADE,
    destinatario   VARCHAR(255) NOT NULL,
    canal          VARCHAR(20) NOT NULL DEFAULT 'interno'
                   CHECK (canal IN ('email', 'interno')),
    mensaje        TEXT,
    enviada        BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_envio    TIMESTAMP WITH TIME ZONE,
    fecha_creacion TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =============================================================================
-- 15. AUDITORÍA (Bitácora de Eventos CRUD y Seguridad — RF-03)
-- =============================================================================
CREATE TABLE IF NOT EXISTS auditoria (
    id             UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id      UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    usuario_id     UUID REFERENCES usuarios(id) ON DELETE SET NULL,
    accion         VARCHAR(20) NOT NULL CHECK (accion IN (
                       'CREATE',
                       'UPDATE',
                       'DELETE',
                       'LOGIN',
                       'LOGOUT',
                       'LOGIN_FAILED'
                   )),
    tabla_afectada VARCHAR(100),
    registro_id    UUID,
    detalle        JSONB,
    datos_antes    JSONB,
    datos_despues  JSONB,
    cambios        JSONB,
    ip             VARCHAR(45),
    fecha_hora     TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =============================================================================
-- 16. CONFIGURACIÓN TENANT (Umbrales y Ventanas Temporales Dinámicas — HU 5.3)
-- =============================================================================
CREATE TABLE IF NOT EXISTS configuracion_tenant (
    id                         UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id                  UUID NOT NULL UNIQUE REFERENCES tenants(id) ON DELETE CASCADE,
    umbral_riesgo              INT NOT NULL DEFAULT 6 CHECK (umbral_riesgo > 0),
    ventana_dias_riesgo        INT NOT NULL DEFAULT 30 CHECK (ventana_dias_riesgo > 0),
    ventana_dias_reincidencia  INT NOT NULL DEFAULT 45 CHECK (ventana_dias_reincidencia > 0),
    ventana_dias_escalada      INT NOT NULL DEFAULT 15 CHECK (ventana_dias_escalada > 0),
    created_at                 TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at                 TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =============================================================================
-- ÍNDICES DE RENDIMIENTO (RNF-07: Optimización de consultas de alta frecuencia)
-- =============================================================================

CREATE INDEX IF NOT EXISTS idx_usuarios_tenant            ON usuarios(tenant_id);
CREATE INDEX IF NOT EXISTS idx_usuarios_email             ON usuarios(tenant_id, email);

CREATE INDEX IF NOT EXISTS idx_periodos_tenant_activo     ON periodos_academicos(tenant_id, activo);
CREATE INDEX IF NOT EXISTS idx_cursos_periodo_nivel       ON cursos(tenant_id, periodo_id, nivel);
CREATE INDEX IF NOT EXISTS idx_cursos_nivel_letra         ON cursos(tenant_id, nivel, letra);

CREATE INDEX IF NOT EXISTS idx_estudiantes_tenant         ON estudiantes(tenant_id);
CREATE INDEX IF NOT EXISTS idx_estudiantes_curso          ON estudiantes(curso_id);
CREATE INDEX IF NOT EXISTS idx_estudiantes_activo         ON estudiantes(tenant_id, activo);
CREATE INDEX IF NOT EXISTS idx_estudiantes_pie            ON estudiantes(tenant_id, es_pie);

CREATE INDEX IF NOT EXISTS idx_incidentes_tenant          ON incidentes(tenant_id);
CREATE INDEX IF NOT EXISTS idx_incidentes_fecha           ON incidentes(tenant_id, fecha);
CREATE INDEX IF NOT EXISTS idx_incidentes_estado          ON incidentes(tenant_id, estado);
CREATE INDEX IF NOT EXISTS idx_incidentes_gravedad        ON incidentes(tenant_id, gravedad);
CREATE INDEX IF NOT EXISTS idx_incidentes_usuario         ON incidentes(usuario_id);

CREATE INDEX IF NOT EXISTS idx_inc_est_estudiante         ON incidente_estudiantes(estudiante_id);
CREATE INDEX IF NOT EXISTS idx_inc_est_incidente          ON incidente_estudiantes(incidente_id);

CREATE INDEX IF NOT EXISTS idx_protocolos_tenant          ON protocolos_rice(tenant_id);
CREATE INDEX IF NOT EXISTS idx_protocolos_estado          ON protocolos_rice(tenant_id, estado);
CREATE INDEX IF NOT EXISTS idx_protocolos_estudiante      ON protocolos_rice(estudiante_id);

CREATE INDEX IF NOT EXISTS idx_protocolo_pasos_protocolo  ON protocolo_pasos(protocolo_id);
CREATE INDEX IF NOT EXISTS idx_protocolo_pasos_tenant     ON protocolo_pasos(tenant_id);
CREATE INDEX IF NOT EXISTS idx_protocolo_pasos_completado ON protocolo_pasos(protocolo_id, completado);

CREATE INDEX IF NOT EXISTS idx_reglas_tenant_tipo         ON reglas_protocolo(tenant_id, tipo_protocolo_id);

CREATE INDEX IF NOT EXISTS idx_notificaciones_incidente   ON notificaciones(incidente_id);
CREATE INDEX IF NOT EXISTS idx_notificaciones_enviada     ON notificaciones(tenant_id, enviada);

CREATE INDEX IF NOT EXISTS idx_auditoria_tenant           ON auditoria(tenant_id);
CREATE INDEX IF NOT EXISTS idx_auditoria_fecha            ON auditoria(tenant_id, fecha_hora);
CREATE INDEX IF NOT EXISTS idx_auditoria_usuario          ON auditoria(usuario_id);
CREATE INDEX IF NOT EXISTS idx_auditoria_tabla            ON auditoria(tabla_afectada);

-- =============================================================================
-- POLÍTICAS DE SEGURIDAD (ROW LEVEL SECURITY - RLS MULTI-TENANT)
-- =============================================================================
ALTER TABLE tenants ENABLE ROW LEVEL SECURITY;
ALTER TABLE periodos_academicos ENABLE ROW LEVEL SECURITY;
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE cursos ENABLE ROW LEVEL SECURITY;
ALTER TABLE estudiantes ENABLE ROW LEVEL SECURITY;
ALTER TABLE apoderados ENABLE ROW LEVEL SECURITY;
ALTER TABLE funcionarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE incidentes ENABLE ROW LEVEL SECURITY;
ALTER TABLE incidente_estudiantes ENABLE ROW LEVEL SECURITY;
ALTER TABLE entrevistas_funcionarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE protocolos_rice ENABLE ROW LEVEL SECURITY;
ALTER TABLE protocolo_pasos ENABLE ROW LEVEL SECURITY;
ALTER TABLE reglas_protocolo ENABLE ROW LEVEL SECURITY;
ALTER TABLE notificaciones ENABLE ROW LEVEL SECURITY;
ALTER TABLE configuracion_tenant ENABLE ROW LEVEL SECURITY;

CREATE POLICY tenant_isolation_periodos ON periodos_academicos

    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_usuarios ON usuarios
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_cursos ON cursos
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_estudiantes ON estudiantes
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_apoderados ON apoderados
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_funcionarios ON funcionarios
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_incidentes ON incidentes
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_protocolos ON protocolos_rice
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_protocolo_pasos ON protocolo_pasos
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_reglas ON reglas_protocolo
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_notificaciones ON notificaciones
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

CREATE POLICY tenant_isolation_configuracion_tenant ON configuracion_tenant
    USING (tenant_id = current_setting('app.tenant_id', true)::uuid);

-- =============================================================================

-- TRIGGERS DE INTEGRIDAD Y REGLAS DE NEGOCIO
-- =============================================================================

-- Valida que el estudiante en protocolos_rice pertenezca al incidente_estudiantes
CREATE OR REPLACE FUNCTION validar_estudiante_en_incidente()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.incidente_id IS NOT NULL THEN
        IF NOT EXISTS (
            SELECT 1 FROM incidente_estudiantes
            WHERE incidente_id  = NEW.incidente_id
            AND   estudiante_id = NEW.estudiante_id
        ) THEN
            RAISE EXCEPTION
                'Integridad violada: el estudiante % no está vinculado al incidente %',
                NEW.estudiante_id, NEW.incidente_id;
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_validar_protocolo_estudiante ON protocolos_rice;
CREATE TRIGGER trg_validar_protocolo_estudiante
BEFORE INSERT OR UPDATE ON protocolos_rice
FOR EACH ROW EXECUTE FUNCTION validar_estudiante_en_incidente();

-- =============================================================================
-- FUNCIONES RPC DE APOYO (ANALÍTICA, BÚSQUEDA Y PROTOCOLOS)
-- =============================================================================

-- 1. Cálculo de acciones pendientes con semáforo para el Dashboard (Sprint 4)
CREATE OR REPLACE FUNCTION calcular_acciones_pendientes()
RETURNS TABLE (
    protocolo_id uuid,
    estudiante_nombre text,
    tipo_protocolo text,
    accion_pendiente text,
    fecha_limite date,
    dias_restantes int,
    estado_semaforo text
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.id,
        (e.nombre || ' ' || e.apellido)::text,
        tp.nombre::text,
        r.accion::text,
        (p.fecha_apertura + (r.plazo_dias || ' days')::interval)::date,
        EXTRACT(DAY FROM (p.fecha_apertura + (r.plazo_dias || ' days')::interval) - NOW())::int,
        CASE
            WHEN (p.fecha_apertura + (r.plazo_dias || ' days')::interval) < NOW() THEN 'vencido'::text
            WHEN (p.fecha_apertura + (r.plazo_dias || ' days')::interval) < NOW() + INTERVAL '2 days' THEN 'urgente'::text
            ELSE 'ok'::text
        END
    FROM protocolos_rice p
    JOIN tipos_protocolo tp ON tp.id = p.tipo_protocolo_id
    JOIN reglas_protocolo r ON r.tipo_protocolo_id = p.tipo_protocolo_id AND r.tenant_id = p.tenant_id
    JOIN estudiantes e ON e.id = p.estudiante_id
    WHERE p.estado != 'Cerrado'
      AND p.tenant_id = current_setting('app.tenant_id', true)::uuid
    ORDER BY dias_restantes ASC;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =============================================================================
-- SEED DATA BASE OBLIGATORIO
-- =============================================================================

-- 1. Catálogo: 7 Tipos de Abordaje
INSERT INTO tipos_abordaje (id, nombre) VALUES
    (1, 'Entrevista'),
    (2, 'Indagación / Denuncia'),
    (3, 'Contención'),
    (4, 'Mediación'),
    (5, 'Conflicto / Incidente puntual'),
    (6, 'Proceso Administrativo'),
    (7, 'Derivación')
ON CONFLICT (id) DO UPDATE SET nombre = EXCLUDED.nombre;

-- 2. Catálogo: 10 Tipos de Protocolo RICE Normativos (Superintendencia de Educación)
INSERT INTO tipos_protocolo (id, nombre) VALUES
    (1, 'Maltrato entre estudiantes'),
    (2, 'Abuso sexual entre estudiantes'),
    (3, 'Abuso sexual por adulto'),
    (4, 'Maltrato de adulto a estudiante'),
    (5, 'Violencia intrafamiliar'),
    (6, 'Consumo de drogas o alcohol'),
    (7, 'Conducta suicida o autolesión'),
    (8, 'Accidente escolar'),
    (9, 'Denuncia por vulneración de derechos'),
    (10, 'Otro protocolo normativo')
ON CONFLICT (id) DO UPDATE SET nombre = EXCLUDED.nombre;

-- 3. Tenant Principal de Producción
INSERT INTO tenants (id, nombre, rbd, direccion) VALUES
    ('1ea5232c-3631-4271-990c-8b4bf4d93db6', 'Escuela Coeducacional N°1 El Salvador', '00000-0', 'El Salvador, Atacama, Chile')
ON CONFLICT (id) DO NOTHING;

-- 4. Período Académico 2026 Inicial
INSERT INTO periodos_academicos (id, tenant_id, anio, fecha_inicio, fecha_fin, activo) VALUES
    ('a0123456-7890-4abc-def0-1234567890ab', '1ea5232c-3631-4271-990c-8b4bf4d93db6', 2026, '2026-03-01', '2026-12-20', true)
ON CONFLICT (tenant_id, anio) DO NOTHING;

-- 5. Seed de Reglas de Protocolo por Defecto (4 reglas base × 10 protocolos = 40 reglas)
INSERT INTO reglas_protocolo (tenant_id, tipo_protocolo_id, orden, accion, plazo_dias, prorrogable)
SELECT 
    '1ea5232c-3631-4271-990c-8b4bf4d93db6'::uuid,
    tp.id,
    p.orden,
    p.accion,
    p.plazo_dias,
    p.prorrogable
FROM tipos_protocolo tp
CROSS JOIN (
    VALUES
        (1::smallint, 'Entrevista inicial con las partes involucradas', 2::smallint, false),
        (2::smallint, 'Citación y reunión con apoderados', 5::smallint, true),
        (3::smallint, 'Informe de situación a Dirección', 7::smallint, true),
        (4::smallint, 'Cierre, derivación externa o solicitud de prórroga', 10::smallint, true)
) AS p(orden, accion, plazo_dias, prorrogable)
ON CONFLICT (tenant_id, tipo_protocolo_id, orden) DO UPDATE 
SET accion = EXCLUDED.accion, plazo_dias = EXCLUDED.plazo_dias, prorrogable = EXCLUDED.prorrogable;
