# Especificaciones de Rediseño UI/UX en Figma — Sprint 7 (Ampliadas: 7 Pantallas)
**Proyecto:** SIGA Escolar (Sistema Integral de Gestión y Acompañamiento Escolar)  
**Institución Beneficiaria:** Escuela Coeducacional N° 1 El Salvador  
**Responsable de Diseño UI/UX:** Claudia Infante Soto  
**Líder Técnico / Backend:** Marcelo Acevedo Silva  
**Frontend Lead:** Daniel Flores Jaime  
**Versión:** 2.0 (Catálogo Completo de Pantallas Críticas)  

---

## 1. GUÍA DE ESTILO Y SISTEMA DE DISEÑO (Design System SIGA)
* **Tipografía:** Plus Jakarta Sans o Inter (escalas tipográficas estándar: H1 28px, H2 22px, H3 18px, Body 14px, Caption 12px).
* **Paleta de Colores Institucional:**
  * Primario: Azul Institucional `#1E40AF` (Blue 800) / `#2563EB` (Blue 600).
  * Fondo: Blanco `#FFFFFF` / Gris `#F9FAFB` (Gray 50) para Desktop; Dark Mode `#111827` (Gray 900).
  * Semáforo Normativo RICE:
    * 🔴 Crítico / Vencido / Gravísimo: `#E11D48` (Rose 600) / Fondo `#FFE4E6` (Rose 100).
    * 🟡 Alerta / Urgente (< 48 hrs) / Grave: `#D97706` (Amber 600) / Fondo `#FEF3C7` (Amber 100).
    * 🟢 En plazo / Estable / Leve: `#059669` (Emerald 600) / Fondo `#D1FAE5` (Emerald 100).
  * Programa PIE: Violeta Institucional `#7C3AED` (Violet 600) / Fondo `#EDE9FE` (Violet 100).
* **Iconografía:** Lucide React (trazos de 2px, bordes redondeados).

---

## 2. CATÁLOGO DETALLADO DE PANTALLAS A PROTOTIPAR EN FIGMA

---

### PANTALLA 1: Bandeja de Acciones Pendientes (Centro de Plazos y Tareas)
* **Objetivo:** Proporcionar al Inspector General y al Coordinador de Convivencia una vista de control operativa donde ningún plazo legal de la Superintendencia quede desatendido.
* **Componentes Requeridos en Figma:**
  1. `ContadorUrgenciasBar`: Barra superior con chips métricos (*"3 vencidas"*, *"2 urgentes < 48 hrs"*, *"5 en plazo"*).
  2. `TabsFiltroEstado`: Selector de pestañas: *Todas*, *Vencidas (🔴)*, *Críticas (🟡)*, *En Plazo (🟢)*.
  3. `FiltrosAvanzadosBar`: Dropdowns de filtro por Curso (Kínder a 8°), Tipo de Protocolo y Funcionario Asignado.
  4. `AccionPendienteCard`:
     * Badge lateral de estado con pulso animado.
     * Nombre y curso del alumno con link a su expediente.
     * Chip normativo del protocolo (ej. *Maltrato entre pares*).
     * Texto destacado de la acción fatal exigida (ej. *Citar apoderado titular*, *Notificar a Fiscalía*).
     * `CountdownTimerBadge`: Contador regresivo en días hábiles / horas restantes.
     * `BotonAccionRapida`: Botón primario *"Completar Acción"* y botón secundario *"Ver Protocolo"*.
  5. `ModalCompletarAccion`: Modal interactivo para registrar la fecha de cumplimiento, anexar observaciones y cerrar la tarea pendiente.

---

### PANTALLA 2: Listado de Estudiantes del Curso Seleccionado (Post-click en Curso)
* **Objetivo:** Rediseñar la pantalla que visualiza la nómina de alumnos perteneciente a un curso específico (ej. 5° Básico A) tras hacer clic en su tarjeta. **Nota importante:** Se mantiene intacta la vista previa de cuadrícula/selección de cursos; el rediseño se enfoca exclusivamente en la experiencia dentro del curso.
* **Componentes Requeridos en Figma:**
  1. `BotonVolverACursos`: Botón *"← Volver a Cursos"* en la esquina superior izquierda para regresar al selector general.
  2. `CabeceraCursoActivoCard`: Tarjeta del curso en consulta con fotografía real del Profesor Jefe, su correo institucional, sala asignada, contador de matriculados activos y total de estudiantes con apoyo PIE.
  3. `OmniboxBuscadorEstudiantes`: Barra de búsqueda interna con debounce para filtrar en tiempo real por Nombre, Apellido o RUT con formateo automático (Módulo 11).
  4. `ToggleFiltrosRapidos`: Chips conmutables: `[ Solo PIE ]`, `[ Con Alerta Conductual ]`, `[ Inactivos / Retirados ]`.
  5. `VistaToggleControl`: Conmutador para alternar entre *Vista Lista / Tabla* y *Vista Cuadrícula / Tarjetas*.
  6. `EstudianteFilaItem` (en vista lista) y `EstudianteCard` (en vista cuadrícula):
     * `AvatarUsuario`: Fotografía circular con iniciales de respaldo coloreadas por rol.
     * RUT y nombre completo legible con jerarquía visual clara.
     * `BadgePIE`: Distintivo violeta del Programa de Integración Escolar.
     * `BadgeRiesgoConductual`: Semáforo de recurrencia (Verde: 0 incidentes; Amarillo: 1-2 leves; Rojo: $\ge 3$ o caso RICE).
     * Menú contextual de 3 puntos (*Ver Ficha Completa*, *Registrar Incidente*, *Descargar Historial PDF*).
  7. `BarraAccionesNomina`: Botón *"Exportar Nómina Excel/PDF"* y botón *"Registrar Incidente Grupal"*.

---

### PANTALLA 3: Ficha y Detalles del Estudiante (`EstudiantePerfilPage`)
* **Objetivo:** Expediente digital único del alumno para entrevistas con apoderados, fiscalizaciones y seguimiento de la Dupla Psicosocial.
* **Componentes Requeridos en Figma:**
  1. `PerfilHeaderCard`:
     * Fotografía de perfil en alta resolución con badge de estado de matrícula (*Matriculado*, *Retirado*, *Egresado*).
     * Nombre completo, RUT, fecha de nacimiento, edad cronológica y curso actual.
     * Datos del apoderado titular (Nombre, Parentesco, Teléfono con botón de llamada/WhatsApp y Correo).
     * Distintivo `PIE` si corresponde.
  2. `BannerRiesgoConductual`: Alerta superior contextual que se activa si el alumno posee score de riesgo conductual $\ge 6$, alertando a la jefatura.
  3. `ResumenMetricasGrid`: 4 tarjetas KPI: *Total Incidentes*, *Faltas Graves*, *Protocolos RICE Activos* y *Entrevistas Realizadas*.
  4. `TabsExpediente`: Navegación por pestañas:
     * **Pestaña 1: Bitácora de Incidentes (`TimelineIncidentes`):** Línea de tiempo cronológica con tarjeta de cada situación, gravedad, relato resumido, medidas adoptadas y estado.
     * **Pestaña 2: Protocolos RICE (`ListaProtocolosAlumno`):** Casos donde el alumno figura como afectado o agresor, con estado y avances.
     * **Pestaña 3: Entrevistas y Acuerdos (`HistorialEntrevistas`):** Registro de citaciones a la familia, acuerdos formativos firmados y compromisos.
  5. `BarraAccionesPerfil`: Botón primario *"Descargar Historial Oficial PDF"* (con membrete de la Escuela El Salvador), botón *"Nuevo Incidente"* y botón *"Citar Apoderado"*.

---

### PANTALLA 4: Registro de Nuevo Incidente (`NuevoIncidentePage`)
* **Objetivo:** Registro ágil y normativo de situaciones conflictivas ocurridas en patios o aulas, con múltiples alumnos involucrados.
* **Componentes Requeridos en Figma:**
  1. `CabeceraFormularioIncidente`: Título, fecha y hora del suceso, y selector de lugar físico del colegio (*Patio central*, *Sala de clases*, *Comedor*, *Baños*, *Gimnasio*).
  2. `SelectorEstudiantesInvolucrados` (Multiselección N:M):
     * Componente en cascada: Nivel $\rightarrow$ Curso $\rightarrow$ Alumno.
     * Lista de alumnos agregados con tarjeta individual:
       * Nombre, RUT y curso.
       * `SelectorRolEstudiante`: Radio buttons o chips para definir el rol: *Afectado / Víctima*, *Involucrado / Agresor*, *Testigo*.
       * Campo de observación individualizada por alumno.
       * Botón para remover de la lista.
  3. `SelectorTipoAbordaje`: Catálogo de los 7 abordajes de convivencia escolar del establecimiento.
  4. `SelectorGravedad`: Radio cards interactivos con descripción: *Leve*, *Grave*, *Gravísima*.
  5. `ModalAlertaGrave` (`AlertaGrave.jsx`): Ventana emergente automática que se despliega si se selecciona *Grave* o *Gravísima*, advirtiendo la obligación de activar protocolo RICE y notificar a Dirección.
  6. `TextareaRelatoFactico`: Área de texto estructurada para el relato objetivo de los hechos (sin adjetivos subjetivos), con contador de caracteres.
  7. `TextareaMedidasInmediatas`: Campo para registrar las medidas de contención o primeros auxilios brindados en el momento.
  8. `FooterAccionesFormulario`: Botón *"Cancelar"*, botón *"Guardar Borrador"* y botón destacado *"Registrar y Activar Protocolo RICE"*.

---

### PANTALLA 5: Tablero General de Protocolos RICE (`ProtocolosPage`)
* **Objetivo:** Visualización panorámica de todos los protocolos normativos abiertos en el establecimiento.
* **Componentes Requeridos en Figma:**
  1. `FiltrosProtocolosBar`: Filtros combinados por Estado (*En Investigación*, *Derivado*, *Cerrado*), Tipo de Protocolo (los 10 oficiales) y Año Lectivo.
  2. `PipelineFasesNormativas`: Vista de embudo o columnas que represente las 4 fases de la circular RICE:
     * *Columna 1: Detección y Resguardo Urgente (0 a 48 hrs).*
     * *Columna 2: Indagación y Notificación a Familias.*
     * *Columna 3: Descargos y Medidas Formativas.*
     * *Columna 4: Resolución y Plan de Apoyo.*
  3. `ProtocoloCard`:
     * Folio oficial (ej. `PROT-2026-0042`).
     * Icono temático del protocolo normativo.
     * Nombre del estudiante foco y curso.
     * `BadgeSemaforoPlazo`: Semáforo de días hábiles transcurridos vs días legales permitidos.
     * Barra de progreso porcentual del checklist normativo.
     * Avatar del profesional responsable asignado.
  4. `BotonNuevoProtocolo`: Botón superior destacado *"Aperturar Nuevo Protocolo RICE"*.

---

### PANTALLA 6: Apertura de Nuevo Protocolo RICE (`NuevoProtocoloPage`)
* **Objetivo:** Formalizar la activación de uno de los 10 protocolos normativos de la Superintendencia de Educación con rigurosidad jurídica.
* **Componentes Requeridos en Figma:**
  1. `SelectorEstudianteFoco`: Selector en cascada con búsqueda rápida de estudiante.
  2. `AlertaEscaladaBanner`: Banner automático que se activa si el alumno posee antecedentes recientes o incidentes en los últimos 45 días.
  3. `SelectorTipoProtocoloCards`: Cuadrícula con los 10 protocolos oficiales de la Superintendencia (Bullying, Ciberacoso, Agresión a docentes, Drogas, Vulneración de derechos, etc.) con tooltip explicativo de la normativa.
  4. `SelectorIncidenteOrigen`: Lista desplegable de los incidentes recientes del alumno para vincular el protocolo a un hecho fáctico registrado previamente.
  5. `CamposNormativos`:
     * Fecha y hora de activación.
     * Funcionario que oficializa la apertura.
     * `TextareaMedidasResguardoUrgentes`: Campo obligatorio de medidas inmediatas de protección (Circular N° 482).
  6. `FooterApertura`: Botón *"Cancelar"* y botón primario *"Activar Protocolo e Iniciar Checklist Normativo"*.

---

### PANTALLA 7: Detalle y Seguimiento de Protocolo RICE (`ProtocoloDetallePage`)
* **Objetivo:** Tramitación del expediente formal del protocolo, avance de etapas, cumplimiento de plazos y aplicación del checklist de la Superintendencia.
* **Componentes Requeridos en Figma:**
  1. `CabeceraExpediente`:
     * Folio único correlativo y tipo de protocolo en tipografía destacada.
     * Estado normativo actual (*En Investigación*, *Derivado*, *Cerrado*).
     * `SemaforoPlazosFatales`: Alerta visual de 48 hrs para denuncias obligatorias (Fiscalía/Tribunales) y 10 días para descargos.
  2. `StepperProgresoNormativo`: Barra horizontal interactiva que ilustra las fases del proceso escolar.
  3. `ChecklistSuperintendencia` (`ChecklistProtocolo.jsx`):
     * Lista de pasos obligatorios según la tipología del caso con checkboxes interactivos.
     * Cada paso incluye: Nombre de la acción legal, responsable asignado, fecha de completitud y campo para adjuntar evidencia o nota.
  4. `BitacoraObservaciones`: Historial inmutable de avances con marca de tiempo, usuario y comentarios formativos.
  5. `ModalAvanzarEstado`: Formulario de cambio de fase con campo obligatorio de fundamentación legal.
  6. `BarraAccionesProtocolo`:
     * Botón *"Asistente IA: Generar Acta/Informe"* (Gemini Flash).
     * Botón *"Descargar Expediente Completo en PDF"*.
     * Botón *"Derivar a Red Externa"* (CESFAM, OPD, Tribunales).
     * Botón *"Cerrar Protocolo"* (requiere checklist 100% completado).

---

## 3. ESPECIFICACIÓN DEL MÓDULO DE ANALÍTICA (MAPA DE CALOR POR CURSOS)
* **Objetivo:** Visualización estratégica para Consejos de Profesores y Reuniones Directivas.
* **Componentes en Figma:**
  1. `MatrizMapaCalor`: Cursos de Pre-Kínder a 8° Básico (filas) $\times$ Meses de Marzo a Diciembre (columnas).
  2. `GradienteCeldas`: Verde (0-1 leves), Amarillo (2-4 leves o 1 grave), Rojo ($\ge 5$ casos o gravísimas).
  3. `ModalDrillDown` (`DetalleCeldaModal.jsx`):
     * Cabecera: *Curso y Mes evaluado*.
     * Indicadores: Total casos, Leves, Graves, Gravísimas.
     * Gráfico de barras con tipologías frecuentes.
     * Tarjeta de orientación formativa de convivencia.
     * Leyenda legal de resguardo de privacidad (Ley N° 19.628).
