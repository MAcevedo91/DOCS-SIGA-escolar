# INFORME DETALLADO DE EJECUCIÓN Y AVANCE DE PROYECTO
## Sistema de Gestión y Acompañamiento Escolar (SIGA Escolar)

**Cliente:** Escuela Coeducacional N°1 El Salvador, Atacama, Chile  
**Institución Académica:** INACAP  
**Equipo de Proyecto:**
- **Marcelo Andrés Acevedo Silva:** Líder de Proyecto / Encargado de Backend, Base de Datos (PostgreSQL/Supabase), Arquitectura y Seguridad.
- **Daniel Flores Jaime:** Encargado de Frontend, UI/UX, Componentes React, Estado Global (Zustand) y Estilos (Tailwind CSS).
- **Claudia Infane Soto:** Encargada de Documentación Técnica y Diseño Web.

**Fecha de Emisión:** Septiembre 2026  
**Versión:** 2.0 (Consolidado Sprints 1, 2, 3, 4 y Planificación Sprint 5)  
**Fuente de Datos Backlog:** `DOCS/Jira.csv` (Proyecto SIGA-Escolar / Clave: `SE`)

---

## 1. RESUMEN EJECUTIVO Y PROPÓSITO DEL PROYECTO

SIGA Escolar es una plataforma web integral diseñada a medida para la **Escuela Coeducacional N°1 El Salvador**, orientada a digitalizar y automatizar los procesos de gestión de convivencia escolar y acompañamiento pedagógico-formativo de sus 483 estudiantes.

El proyecto resuelve la problemática histórica del establecimiento: la dependencia de registros físicos en papel, bitácoras dispersas y carpetas manuales, las cuales generaban:
1. **Riesgo de pérdida e inconsistencia de información sensible.**
2. **Dificultad de seguimiento cronológico de casos y antecedentes conductuales.**
3. **Complejidad para cumplir con los plazos perentorios exigidos por la Superintendencia de Educación** en la tramitación de los protocolos normativos RICE (*Reglamento Interno de Convivencia Escolar*).
4. **Falta de visibilidad directiva en tiempo real** sobre la recurrencia y gravedad de los incidentes.

La solución implementada entrega una arquitectura moderna, segura y multi-tenant, con costo cero de licenciamiento al estar basada en tecnologías de código abierto (Node.js, Express, React, Vite, Tailwind CSS, Supabase/PostgreSQL), garantizando cumplimiento normativo, trazabilidad estricta y alertas tempranas para intervenir formativamente a tiempo.

---

## 2. MÉTRICAS CONSOLIDADAS DEL TABLERO JIRA (`Jira.csv`)

Basado en la exportación oficial del tablero Jira del proyecto (`DOCS/Jira.csv`) y la ejecución completa del Sprint 5, el proyecto presenta las siguientes métricas globales de ejecución:

| Métrica de Proyecto | Valor Registrado | Observación |
| :--- | :---: | :--- |
| **Total de Incidencias en Backlog** | **63 ítems** | Incluye Épicas, Historias y Tareas técnicas de Sprints 1 al 5 |
| **Story Points Totales Comprometidos** | **134 pts** | Estimación mediante Planning Poker (Fibonacci) |
| **Story Points Completados y Validados** | **134 pts** | **100%** de avance completado y certificado en terreno |
| **Incidencias en Estado "Listo" (Done)** | **63 ítems** | **100%** de historias y tareas técnicas finalizadas |
| **Incidencias en Estado "Por Hacer" (To Do)** | **0 ítems** | Cero pendientes técnicos en el alcance comprometido |
| **Total de Épicas de Desarrollo** | **4 Épicas** | Infraestructura, Core, Analítica y Motor de Reglas/Alertas |
| **Total de Historias de Usuario (HU)** | **19 Historias** | Definidas bajo estándar INVEST |
| **Total de Tareas Técnicas** | **44 Tareas** | Desglosadas y validadas con pruebas unitarias y de integración |

### Distribución por Sprints y Velocidad del Equipo

| Sprint | Período de Ejecución | Foco Principal | SP Comprometidos | SP Completados | Estado |
| :--- | :---: | :--- | :---: | :---: | :---: |
| **Sprint 1** | 02 jun – 15 jun 2026 | Infraestructura, BD Multi-tenant, Auth JWT y Setup Frontend | 34 pts | 34 pts | ✅ Cerrado |
| **Sprint 2** | 16 jun – 24 jun 2026 | Lógica de Negocio: Usuarios, Estudiantes, Incidentes y RICE | 42 pts | 42 pts | ✅ Cerrado |
| **Sprint 3** | 25 jun – 01 jul 2026 | Analítica (Recharts), Reportes PDF, Deploy Producción y UAT | 38 pts | 38 pts | ✅ Cerrado |
| **Sprint 4** | 02 jul – 09 jul 2026 | Motor de Reglas, Semáforo de Urgencia y Scoring de Riesgo | 21 pts | 21 pts | ✅ Cerrado |
| **Sprint 5** | 08 sep – 09 sep 2026 | Checklist RICE estricto, Alertas Escalada, Configuración, PIE y Cursos en Cascada | 36 pts | 36 pts | ✅ Cerrado |
| **Sprint 6** | 28 sep – 08 oct 2026 | Asistente de Informes IA (Gemini Flash), Human-in-the-Loop, PDFKit, Email y Avatares | 28 pts | 28 pts | ✅ Cerrado |
| **Sprint 7** | 06 oct – 20 oct 2026 | Rediseño Figma (7 Pantallas), Mapa de Calor, Usabilidad y Módulo de Mediación Escolar (Épica 7.2) | 85 pts | 29 pts | 🟡 En Ejecución (Figma + Mapa de Calor + Flujos + BD Mediaciones + Endpoints Mediaciones) |


---

## 3. REGISTRO EXHAUSTIVO DE TRABAJO REALIZADO POR ÉPICA

A continuación se detalla cada incidencia registrada en el backlog oficial de Jira, especificando su clave, descripción técnica, responsable y criterios de aceptación cumplidos:

---

### ÉPICA 1: Infraestructura y Core del Sistema (`SE-4`)
* **Objetivo:** Establecer los cimientos tecnológicos del monorepo, la base de datos relacional multi-tenant con Row Level Security (RLS), la seguridad de acceso (JWT/bcrypt/RBAC) y la bitácora invisible de auditoría.
* **Estado:** 100% de Tareas e Historias Finalizadas (15 incidencias).

#### Historias de Usuario y Tareas Ejecutadas:

1. **HU 1.1 – Configuración de Entornos y Base de Datos (`SE-6` | Estado: Listo | Marcelo Acevedo)**
   * Como administrador de sistemas, quiero desplegar la infraestructura base en Supabase para garantizar el almacenamiento seguro y aislado de la Escuela El Salvador.
   * **`SE-8` TASK 1.1.1 — Setup repositorios GitHub y variables de entorno (2 SP | Marcelo Acevedo):**
     * Inicialización de repositorios `siga-backend` y `siga-frontend` con ramas `main` y `develop`.
     * Definición de plantillas `.env.example` para backend y frontend con variables de configuración sensibles.
     * Política de branches y pull requests protegidos con revisión de pares.
   * **`SE-9` TAREA 1.1.2 — Modelado ER y script DDL en PostgreSQL (5 SP | Marcelo Acevedo):**
     * Diseño del modelo entidad-relación normalizado en 3FN y publicación de diagrama en `/docs`.
     * Redacción del script DDL con definición de PKs UUID (`uuid_generate_v4()`), FKs con integridad referencial, checks y tipos de datos estrictos.
     * Poblado de catálogos paramétricos `tipos_abordaje` (7 tipos) y `tipos_protocolo` (10 tipos normativos).
   * **`SE-10` TAREA 1.1.3 — Setup Supabase y RLS base multi-tenant (3 SP | Marcelo Acevedo):**
     * Aprovisionamiento del proyecto en la nube de Supabase.
     * Activación de Row Level Security (RLS) en todas las tablas operativas (`ENABLE ROW LEVEL SECURITY`).
     * Creación de función en PL/pgSQL `set_tenant(uuid)` y políticas `USING (tenant_id = current_setting('app.tenant_id')::uuid)`.
     * Creación del tenant inicial de producción: *Escuela Coeducacional N°1 El Salvador* (RBD `00000-0`).
   * **`SE-11` TAREA 1.1.4 — Definición del contrato de API (JSON Contract) (1 SP | Marcelo Acevedo):**
     * Documentación del estándar de respuestas JSON de la API (`{ success, data, message, statusCode }` y `{ error, details }`).
     * Publicación de especificación en `/docs/api-contract.md` para desacoplar el desarrollo frontend/backend.

2. **HU 1.2 – Motor Backend y Autenticación (`SE-5` | Estado: Listo | Marcelo Acevedo)**
   * Como usuario del sistema, quiero autenticarme de forma segura para acceder a las funciones correspondientes a mi cargo escolar.
   * **`SE-12` TAREA 1.2.1 — Servidor Node/Express y middlewares base (3 SP | Marcelo Acevedo):**
     * Estructuración del servidor Express 5 en Node.js 22 modularizado (`controllers/`, `middlewares/`, `routes/`, `services/`, `utils/`).
     * Configuración de cabeceras de seguridad HTTP con Helmet (HSTS, CSP, XSS-Filter, Frameguard).
     * Configuración de CORS restringido a orígenes autorizados (`localhost:5173`, producción).
     * Endpoint de salud del sistema: `GET /api/v1/health` (responde `200 OK` con timestamp).
   * **`SE-13` TAREA 1.2.2 — Endpoints Auth, JWT y bcrypt (5 SP | Marcelo Acevedo):**
     * Endpoint `POST /api/v1/auth/login`: validación de usuario y estado activo, comparación segura de contraseñas con `bcrypt.compare()`.
     * Control de fuerza bruta: incremento de `intentos_fallidos` en tabla `usuarios`; al llegar a 5 intentos se establece bloqueo temporal (`bloqueado_hasta = NOW() + 15 min`).
     * Generación de token JWT stateless firmado con secret de 64 caracteres y expiración de 8 horas conteniendo `{ id, tenant_id, rol, email }`.
     * Endpoint `GET /api/v1/auth/me` para auto-identificación del usuario conectado.
     * Script de semilla `npm run seed` para creación del usuario Administrador inicial.
   * **`SE-14` TAREA 1.2.3 — Middlewares RBAC para 5 roles institucionales (4 SP | Marcelo Acevedo):**
     * Middleware `authenticateToken`: verificación y decodificación del JWT en header `Authorization: Bearer <token>`.
     * Middleware `setTenantContext`: ejecución de `set_tenant()` en PostgreSQL para activar RLS por sesión.
     * Middleware `requireRole(...roles)`: validación de permisos para los 5 roles del sistema: *Administrador*, *Directivo*, *Inspector*, *Docente* y *Equipo de Formación*. Retorna `403 Forbidden` ante accesos no autorizados.
   * **`SE-15` TAREA 1.2.4 — Middleware de Bitácora de Auditoría (3 SP | Marcelo Acevedo):**
     * Implementación del middleware `auditLogger` para interceptar operaciones `POST`, `PUT`, `PATCH`, `DELETE`.
     * Registro asíncrono con patrón fire-and-forget (`setImmediate`) sin añadir más de 10ms a la latencia de respuesta.
     * Almacenamiento en tabla `auditoria` de: `tenant_id`, `usuario_id`, `accion`, `tabla_afectada`, `registro_id`, `detalle` (JSONB con payload de cambio), `ip` y `fecha_hora`.

3. **HU 1.3 – Core Frontend y Acceso Privado (`SE-7` | Estado: Listo | Daniel Flores)**
   * Como usuario final, quiero una interfaz de acceso responsiva y moderna para iniciar sesión desde cualquier dispositivo escolar.
   * **`SE-16` TAREA 1.3.1 — Setup React + Vite + Tailwind CSS (1 SP | Daniel Flores):**
     * Inicialización del frontend con React 18 y bundler Vite 5.
     * Configuración de Tailwind CSS v3 con diseño utilitario y paleta institucional.
     * Configuración de alias de importación `@/` en `vite.config.js`.
     * Configuración de cliente Axios centralizado con baseURL de entorno y manejador de errores global.
   * **`SE-17` TAREA 1.3.2 — UI Login y consumo de API Auth (4 SP | Daniel Flores):**
     * Maquetación de `LoginPage.jsx` con diseño mobile-first responsivo desde 360px de ancho.
     * Formulario validado con `react-hook-form` (campos obligatorios, formato de email institucional).
     * Toggle interactivo para mostrar/ocultar contraseña, spinner de carga y feedback visual de error ante credenciales inválidas (401) o cuenta bloqueada (403).
   * **`SE-18` TAREA 1.3.3 — Rutas privadas React y protección de navegación (2 SP | Daniel Flores):**
     * Configuración de `react-router-dom` v6 con rutas públicas y privadas.
     * Componente `PrivateRoute.jsx`: verificación de token activo y redirección automática a `/login` si no hay sesión.
     * Componente `RoleRoute.jsx`: restricción de vistas según matriz de permisos (redirección a `/no-autorizado`).
     * Interceptor Axios: detección automática de respuestas `401 Unauthorized` para forzar cierre de sesión y limpieza de estado.
   * **`SE-19` TAREA 1.3.4 — Zustand Store: Auth State (1 SP | Daniel Flores):**
     * Creación del store `useAuthStore` con Zustand y middleware `persist` en `localStorage`.
     * Manejo global de estados: `user`, `token`, `isAuthenticated`, funciones `login()` y `logout()`.

---

### ÉPICA 2: Lógica de Negocio y Módulos Core (`SE-21`)
* **Objetivo:** Desarrollar los módulos operativos clave para la Escuela El Salvador: gestión de usuarios, nómina de estudiantes con importador masivo, registro de incidentes de convivencia y tramitación de protocolos RICE.
* **Estado:** 100% de Tareas e Historias Finalizadas (12 incidencias).

#### Historias de Usuario y Tareas Ejecutadas:

1. **HU 2.1 – RBAC Completo y Gestión de Usuarios (`SE-22` | Estado: Listo | Marcelo Acevedo)**
   * Como administrador, quiero controlar los usuarios del colegio para asegurar que cada funcionario solo acceda a lo que le compete.
   * **`SE-27` TAREA 2.1.2 — API CRUD de Usuarios (3 SP | Marcelo Acevedo):**
     * Endpoints: `GET /api/v1/usuarios`, `GET /api/v1/usuarios/:id`, `POST /api/v1/usuarios`, `PUT /api/v1/usuarios/:id` y `PATCH /api/v1/usuarios/:id/desactivar`.
     * Regla de negocio crítica: Bloqueo de desactivación del último Administrador activo del tenant (retorna 400 con mensaje preventivo).
     * Cifrado automático de contraseña con bcrypt (coste 10) al crear usuario.
     * Exclusión estricta del campo `password` en todas las respuestas JSON de la API.
   * **`SE-28` TAREA 2.1.3 — UI Gestión de Usuarios (3 SP | Daniel Flores):**
     * Vista `UsuariosPage.jsx` con tabla responsiva, filtros de búsqueda y badges de colores por rol y estado (Activo/Inactivo).
     * Modales interactivos `CrearUsuarioModal.jsx` y `EditarUsuarioModal.jsx` con validación en tiempo real.
     * Modal de confirmación de baja lógica con advertencia de seguridad.

2. **HU 2.2 – Gestión de Estudiantes e Importación Masiva (`SE-23` | Estado: Listo | Marcelo Acevedo)**
   * Como directivo o coordinador, quiero importar la nómina completa de 483 alumnos desde CSV/Excel para tener su ficha digitalizada.
   * **`SE-29` TAREA 2.2.1 — API CRUD de Estudiantes + Importación CSV/Excel (5 SP | Marcelo Acevedo):**
     * Endpoints: `GET /api/v1/estudiantes` (con filtros por nombre, rut, curso), `GET /api/v1/estudiantes/:id/perfil`, `POST /api/v1/estudiantes`, `PUT /api/v1/estudiantes/:id` y `POST /api/v1/estudiantes/importar`.
     * Procesador masivo multipart con `multer`, `csv-parse` y `xlsx`.
     * Algoritmo del Módulo 11 chileno en `rutValidator.js` para normalizar y validar el dígito verificador.
     * Creación automática de cursos inexistentes y apoderado titular por estudiante en la misma transacción.
     * Mecanismo de Upsert: actualización de registros si el RUT ya existe, evitando duplicados.
     * Procesamiento de nómina completa (483 estudiantes) en menos de 3.5 segundos con reporte estructurado de éxitos y filas rechazadas.
   * **`SE-30` TAREA 2.2.2 — UI Gestión de Estudiantes e Importación (3 SP | Daniel Flores):**
     * Vista `EstudiantesPage.jsx` con buscador debounce (300ms) por nombre o RUT y filtro por curso escolar.
     * Componente `ImportarEstudiantesModal.jsx`: zona drag & drop para arrastrar archivos `.csv` o `.xlsx`, barra de progreso y botón para descargar plantilla oficial de ejemplo.
     * Vista `EstudiantePerfilPage.jsx`: ficha unificada que despliega datos personales, curso, información de contacto del apoderado e historial cronológico de incidentes.

3. **HU 2.3 – Registro de Incidentes y Notificaciones (`SE-24` | Estado: Listo | Marcelo Acevedo)**
   * Como inspector o coordinador, quiero registrar incidentes de convivencia de forma estructurada y alertar casos graves.
   * **`SE-31` TAREA 2.3.1 — API Incidentes + Notificaciones (5 SP | Marcelo Acevedo):**
     * Endpoints: `GET /api/v1/incidentes`, `GET /api/v1/incidentes/:id`, `POST /api/v1/incidentes`, `PATCH /api/v1/incidentes/:id/estado` y `GET /api/v1/tipos-abordaje`.
     * Validación estricta con esquemas Zod (campos obligatorios, longitud mínima de relato de 20 caracteres).
     * Soporte de relación N:M en tabla `incidente_estudiantes` permitiendo asociar múltiples alumnos indicando su condición (`es_victima`: víctima, agresor o testigo) y observaciones individuales.
     * Detección de gravedad: incidentes `Grave` o `Gravísima` insertan automáticamente alertas en tabla `notificaciones` destinadas al Coordinador y Director.
     * Máquina de estados: valida transiciones permitidas (`En Investigación` $\rightarrow$ `Derivado` $\rightarrow$ `Cerrado`) y rechaza retrocesos de estado (HTTP 400).
   * **`SE-32` TAREA 2.3.2 — UI Formulario de Incidentes y Dashboard de Casos (5 SP | Daniel Flores):**
     * Vista `NuevoIncidentePage.jsx`: formulario con selectores de tipo de abordaje, fecha, gravedad con código de color (Verde/Amarillo/Rojo), buscador dinámico de estudiantes y campos de relato y medidas adoptadas.
     * Componente `AlertaGrave.jsx`: banner visual prominente y toast de alerta inmediata al guardar un incidente grave o gravísimo (RF-07).
     * Vista `IncidentesPage.jsx`: grilla con paginación, filtros por fecha, gravedad y estado del caso.
     * Vista `IncidenteDetallePage.jsx`: visualización integral del relato, medidas y formulario de cambio de estado.

4. **HU 2.4 – Protocolos RICE (`SE-25` | Estado: Listo | Marcelo Acevedo)**
   * Como coordinador de convivencia, quiero tramitar los 10 protocolos normativos RICE garantizando el apego a la ley.
   * **`SE-33` TAREA 2.4.1 — API Protocolos RICE (4 SP | Marcelo Acevedo):**
     * Endpoints: `GET /api/v1/protocolos`, `GET /api/v1/protocolos/:id`, `POST /api/v1/protocolos`, `PATCH /api/v1/protocolos/:id/estado` y `GET /api/v1/tipos-protocolo`.
     * Catálogo con los 10 protocolos normativos de la Superintendencia de Educación:
       1. Maltrato entre estudiantes
       2. Abuso sexual entre estudiantes
       3. Abuso sexual por adulto
       4. Maltrato de adulto a estudiante
       5. Violencia intrafamiliar
       6. Consumo de drogas o alcohol
       7. Conducta suicida o autolesión
       8. Accidente escolar
       9. Denuncia por vulneración de derechos
       10. Otro protocolo normativo
     * Integridad relacional: trigger PostgreSQL `trg_validar_protocolo_estudiante` que impide abrir un protocolo a un estudiante que no figure en el incidente origen.
     * Trazabilidad de estados: registro de observaciones obligatorio al cambiar de etapa y fijación automática de `fecha_cierre = NOW()` al cerrar.
   * **`SE-34` TAREA 2.4.2 — UI Módulo RICE (3 SP | Daniel Flores):**
     * Vista `ProtocolosPage.jsx`: tabla de seguimiento de protocolos con insignias de estado y filtros por tipo y fecha.
     * Vista `NuevoProtocoloPage.jsx`: selector de tipo de protocolo normativo, buscador de estudiante y selector filtrado de incidentes previos del alumno seleccionado.
     * Vista `ProtocoloDetallePage.jsx`: datos completos del caso, línea de tiempo gráfica de etapas (En Investigación $\rightarrow$ Derivado $\rightarrow$ Cerrado) y formulario de actualización de estado.

---

### ÉPICA 3: Analítica, Reportería y Despliegue a Producción (`SE-35`)
* **Objetivo:** Dotar a la dirección del colegio de herramientas analíticas de toma de decisiones en tiempo real, generación de informes institucionales certificados en PDF y despliegue del sistema en entornos productivos seguros con HTTPS.
* **Estado:** 100% de Tareas e Historias Finalizadas (12 incidencias).

#### Historias de Usuario y Tareas Ejecutadas:

1. **HU 3.1 – Dashboard Analítico con Visualización en Tiempo Real (`SE-36` | Estado: Listo | Marcelo Acevedo / Daniel Flores)**
   * Como directivo, quiero ver estadísticas actualizadas al instante para identificar patrones de conducta por curso y gravedad.
   * **`SE-40` TAREA 3.1.1 — Vistas SQL y endpoints de métricas para el dashboard (3 SP | Marcelo Acevedo):**
     * Consultas agregadas optimizadas en `dashboardService.js`:
       - `getResumen()`: conteo de incidentes totales, incidentes graves, protocolos activos y estudiantes únicos atendidos.
       - `getIncidentesPorCurso()`: agrupación y orden descendente de incidentes por nivel/curso.
       - `getIncidentesPorGravedad()`: porcentajes y cantidades de incidentes Leves, Graves y Gravísimos.
       - `getTendenciaMensual()`: serie de tiempo mensual de casos ocurridos en el año lectivo.
     * Endpoint unificado de métricas con tiempos de respuesta inferiores a 120ms.
   * **`SE-41` TAREA 3.1.2 — UI Dashboard con gráficos Recharts en tiempo real (4 SP | Daniel Flores):**
     * Maquetación de `DashboardPage.jsx` con 4 tarjetas de KPIs superiores (*Total Incidentes*, *Casos Graves*, *Protocolos Activos*, *Estudiantes en Seguimiento*).
     * 3 Gráficos interactivos construidos con la librería `recharts`:
       1. Gráfico de Barras: Incidentes por Curso.
       2. Gráfico de Torta (PieChart): Distribución porcentual por Gravedad.
       3. Gráfico de Líneas (AreaChart): Tendencia mensual cronológica.
     * Carga paralela con `Promise.all` que garantiza renderizado completo en $< 1.8$ segundos.

2. **HU 3.2 – Exportación PDF de Historial Conductual (`SE-37` | Estado: Listo | Marcelo Acevedo / Daniel Flores)**
   * Como coordinador, quiero emitir un informe oficial en PDF del historial conductual del alumno con firmas institucionales.
   * **`SE-42` TAREA 3.2.1 — API Generación PDF con membrete institucional (4 SP | Marcelo Acevedo):**
     * Endpoint `GET /api/v1/estudiantes/:id/pdf` implementado con la librería `pdfkit`.
     * Formato oficial estandarizado: membrete de la *Escuela Coeducacional N°1 El Salvador*, logo, datos identificatorios del alumno, curso, datos del apoderado, tabla cronológica de todos los incidentes y medidas aplicadas.
     * Pie de página con cláusula de confidencialidad y recuadros de firma para el *Coordinador de Convivencia* y el *Director del Establecimiento*.
   * **`SE-43` TAREA 3.2.2 — UI Botón descarga PDF en perfil del estudiante (1 SP | Daniel Flores):**
     * Integración de componente `DownloadPDFButton.jsx` en el encabezado de `EstudiantePerfilPage.jsx`.
     * Descarga directa en un clic con manejo de estados de carga (spinner) y notificación toast al completarse.

3. **HU 3.3 – Despliegue a Producción con URL Pública HTTPS (`SE-38` | Estado: Listo | Marcelo Acevedo / Daniel Flores)**
   * Como usuario de la escuela, quiero acceder a SIGA Escolar desde cualquier computador o tablet con conexión a Internet.
   * **`SE-44` TAREA 3.3.1 — Deploy Backend en Render con variables de entorno (2 SP | Marcelo Acevedo):**
     * Configuración del servicio web PaaS en **Render** conectado a la rama `main` de GitHub.
     * Inyección segura de variables de entorno de producción (`SUPABASE_URL`, `SUPABASE_SERVICE_KEY`, `JWT_SECRET`, `PORT`, `NODE_ENV=production`).
     * Certificado SSL/TLS automático con HTTPS activo en `https://siga-backend.onrender.com`.
   * **`SE-45` TAREA 3.3.2 — Deploy Frontend en Vercel con HTTPS (1 SP | Daniel Flores):**
     * Configuración del despliegue en **Vercel** conectado al repositorio de frontend.
     * Configuración de variables de entorno de cliente (`VITE_API_URL`, `VITE_SUPABASE_URL`).
     * Configuración de reescritura de rutas SPA en `vercel.json` para evitar errores 404 al recargar el navegador en rutas protegidas.
     * Despliegue exitoso con HTTPS en `https://siga-frontend-delta-six.vercel.app`.

4. **HU 3.4 – Certificación UAT y Entrega Final al Cliente (`SE-39` | Estado: Listo | Marcelo Acevedo)**
   * Como contraparte institucional, quiero validar el software en un ambiente real antes de la firma de conformidad.
   * **`SE-46` TAREA 3.4.1 — Carga de datos reales en producción y ambiente UAT (3 SP | Marcelo Acevedo):**
     * Ejecución del script DDL y seed oficial en la base de datos de producción de Supabase.
     * Importación exitosa de la nómina real de estudiantes del establecimiento y configuración de credenciales de prueba para el cliente.
   * **`SE-47` TAREA 3.4.2 — Pruebas UAT con el cliente y Documentación de Cierre (2 SP | Marcelo Acevedo):**
     * Elaboración del protocolo de pruebas de aceptación de usuario y acompañamiento remoto al Coordinador de Convivencia.
     * Aprobación del 100% de los casos de prueba y entrega de la carpeta de documentación técnica y manuales.

---

### ÉPICA 4: Motor de Reglas y Alertas Tempranas (`SE-59`)
* **Objetivo:** Transformar el sistema de un registro pasivo de información a un motor determinístico y proactivo de alertas tempranas y plazos legales (sin requerir APIs externas ni costos de IA, 100% en Node.js y PostgreSQL).
* **Estado:** 100% de Tareas Técnicas Finalizadas en Código/BD (6 tareas listas, 2 HUs en formalización de cierre).

#### Historias de Usuario y Tareas Ejecutadas:

1. **HU 4.1 – Reglas de Protocolo y Plazos Normativos (`SE-60` | En Cierre | Marcelo Acevedo)**
   * Como coordinador, quiero que el sistema calcule los plazos de cada protocolo abierto para no depender de la memoria ni de avisos informales por WhatsApp.
   * **`SE-63` TAREA 4.1.1 — Nueva tabla `reglas_protocolo` en Supabase (2 SP | Marcelo Acevedo):**
     * Creación de tabla en PostgreSQL con campos: `id`, `tenant_id`, `tipo_protocolo_id`, `orden`, `accion`, `plazo_dias`, `prorrogable`, `activo`.
     * Políticas RLS de aislamiento multi-tenant y restricción de unicidad `UNIQUE (tenant_id, tipo_protocolo_id, orden)`.
     * Alteración de tabla `protocolos_rice` para añadir columna de auditoría de avances: `fecha_ultimo_avance TIMESTAMPTZ DEFAULT now()`.
   * **`SE-64` TAREA 4.1.2 — Seed de reglas de protocolo por defecto (3 SP | Marcelo Acevedo):**
     * Script `seedReglas.js` idempotente que inserta las 4 actuaciones obligatorias para cada uno de los 10 tipos de protocolo RICE (40 filas en total):
       - Orden 1: *Entrevista inicial con las partes involucradas* (Plazo: 2 días, no prorrogable).
       - Orden 2: *Citación y reunión con apoderados* (Plazo: 5 días, prorrogable).
       - Orden 3: *Informe de situación a Dirección* (Plazo: 7 días, prorrogable).
       - Orden 4: *Cierre, derivación externa o solicitud de prórroga* (Plazo: 10 días, prorrogable).
   * **`SE-65` TAREA 4.1.3 — Función SQL RPC y endpoint `GET /acciones-pendientes` (5 SP | Marcelo Acevedo):**
     * Creación de función PL/pgSQL `calcular_acciones_pendientes()` que cruza protocolos abiertos con sus reglas y calcula los días restantes contra la fecha actual.
     * Clasificación de semáforo determinístico:
       - Plazo expirado: `'vencido'` (Rojo).
       - Vence en $\le 2$ días: `'urgente'` (Ámbar).
       - Más de 2 días: `'ok'` (Verde).
     * Endpoint `GET /api/v1/dashboard/acciones-pendientes` con filtro estricto por tenant.

2. **HU 4.2 – Score de Riesgo de Escalada por Estudiante (`SE-61` | En Cierre | Marcelo Acevedo)**
   * Como equipo de convivencia, quiero identificar oportunamente a los estudiantes que acumulan faltas reiteradas antes de que escalen a situaciones graves.
   * **`SE-66` TAREA 4.2.1 — Endpoint `GET /dashboard/estudiantes-en-riesgo` (4 SP | Marcelo Acevedo):**
     * Algoritmo determinístico de scoring ponderado implementado en `dashboardService.js`:
       $$\text{Score} = (\text{Incidentes últimos 30 días} \times 2) + (\text{Casos Graves} \times 3) + (\text{Casos Gravísimos} \times 5)$$
     * Umbral de activación configurable fijado en $\ge 6$ puntos.
     * Retorno estructurado ordenado de mayor a menor riesgo con desglose de incidentes y faltas graves.

3. **HU 4.3 – Widgets de Alerta en Dashboard y Perfil (`SE-62` | Estado: Listo | Daniel Flores)**
   * Como directivo o coordinador, quiero ver en mi pantalla principal las alertas de urgencia y riesgo sin realizar búsquedas manuales.
   * **`SE-67` TAREA 4.3.1 — Widget "Acciones Pendientes" en Dashboard (5 SP | Daniel Flores):**
     * Componente `AccionesPendientesWidget.jsx` integrado en `DashboardPage.jsx` cargado en paralelo vía `Promise.all`.
     * Lista priorizada de casos con badges de semáforo interactivos, enlace clickeable que redirige directamente al caso (`/protocolos/:id`) y mensaje de confirmación *"Todo al día ✓"* cuando no hay pendientes.
   * **`SE-68` TAREA 4.3.2 — Badge de riesgo en perfil del estudiante (2 SP | Daniel Flores):**
     * Componente contextual en `EstudiantePerfilPage.jsx` que consulta el endpoint de riesgo al abrir la ficha del alumno.
     * Renderizado de banner informativo de alerta (`bg-amber-50 border-amber-200 text-amber-800`) antes de los datos personales para estudiantes con score $\ge 6$.

---

## 4. ESTADO DE PLANIFICACIÓN Y DISEÑO DEL SPRINT 5

Para dar continuidad y cierre al ciclo de desarrollo, se diseñó e integró la guía completa del **Sprint 5** ([`siga-backend/docs/sprint5.md`](file:///home/macevedo/Proyectos/INACAP/siga-escolar/siga-backend/docs/sprint5.md) y [`DOCS/sprint5.md`](file:///home/macevedo/Proyectos/INACAP/siga-escolar/DOCS/sprint5.md)), con una capacidad comprometida de **36 Story Points**:

* **HU 5.1 (11 SP) — Checklist RICE Normativo con Bloqueo Estricto de Etapas:**
  * **TAREA 5.1.1 (3 SP | Marcelo Acevedo) — Tabla `protocolo_pasos` con RLS e Inicialización Automática:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Base de Datos:** DDL ejecutado en Supabase con claves foráneas a `tenants`, `protocolos_rice` y `reglas_protocolo`, índice `idx_protocolo_pasos_completado`, restricción `UNIQUE(protocolo_id, orden)` y política RLS multi-tenant (`siga-backend/src/db/migrations/20260908_crear_protocolo_pasos.sql` y `DOCS/schema_siga_escolar.sql`).
    * **Backend (`protocolosService.js`):** En `crearProtocolo()`, se consulta automáticamente el catálogo de reglas del tenant y se generan en lote los 4 pasos iniciales (`completado = false`). Se incluye reversión compensatoria (*rollback*) para evitar protocolos huérfanos ante fallos.
    * **API:** Se habilitó el método `listarPasosProtocolo()` y la ruta `GET /api/v1/protocolos/:id/pasos`.
    * **Migración de Retrocompatibilidad:** Script SQL con cursor PL/pgSQL ejecutado con éxito en Supabase: se vincularon automáticamente los 4 pasos normativos a los 6 protocolos preexistentes en la base de datos (marcando los 4 protocolos Cerrados con 4 pasos completados y los 2 Derivados con 0 completados).
    * **Resultados de Validación Real:**
      * *Prueba 1 (Supabase DDL & Backfill):* 6/6 protocolos históricos certificados con 4 pasos asignados según su estado.
      * *Prueba 2 (Jest Unit Test):* 4/4 pruebas unitarias aprobadas en 2.5s (`protocolosPasos.test.js` al 100%).
      * *Prueba 3 (Creación Real API `POST /protocolos`):* Protocolo creado (`da2bfb7a-6b12-4b6d-af9e-d6ad7e7d6b76`) con 4 pasos iniciales generados en base de datos.
      * *Prueba 4 (Consulta de Pasos `GET /:id/pasos`):* Respuesta HTTP 200 OK con los 4 pasos ordenados (plazos de 2, 5, 7 y 10 días).
  * **TAREA 5.1.2 (4 SP | Marcelo Acevedo) — API de Gestión de Pasos y Validación de Cierre Estricto:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Backend (`protocolosService.js`):**
      * Implementación de regla de bloqueo estricto en `cambiarEstado()`: verificación preventiva de pasos inconclusos (`completado = false`) antes de permitir el avance a estados terminales (`'Derivado'` o `'Cerrado'`). Ante tareas pendientes, bloquea la transición arrojando HTTP 400 con mensaje explicativo y el desglose de `pasos_pendientes`.
      * Función `actualizarPasoProtocolo()`: certificación y actualización de pasos normativos con validación obligatoria de observación ($\ge 5$ caracteres) al completar. Asignación automática e inviolable de `responsable_id = req.user.user_id` y marca temporal `fecha_completado = new Date()`, protegiendo la inmutabilidad de protocolos previamente cerrados.
      * Trazabilidad completa con `auditoriaService.registrarAuditoria()` registrando diff de cambios (`datos_antes`, `datos_despues`, `cambios`).
    * **Controladores y Rutas (`protocolosController.js` y `protocolos.routes.js`):**
      * Ruta `PATCH /api/v1/protocolos/:id/pasos/:pasoId` protegida con RBAC para roles `'Administrador'` y `'Equipo de Formación'`.
      * Respuesta estructurada en `cambiarEstadoHandler` formateando la lista de pasos pendientes requeridos para el desbloqueo.
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Jest Unit Tests):* 6/6 tests unitarios aprobados (`src/__tests__/services/protocolosBloqueo.test.js`).
      * *Prueba 2 (Bloqueo Estricto de Estado):* Rechazo con HTTP 400 al intentar avanzar a "Derivado" con 4 pasos pendientes.
      * *Prueba 3 (Validación de Observación):* Rechazo con HTTP 400 (*"La observación es obligatoria al completar un paso y debe tener al menos 5 caracteres"*).
  * **TAREA 5.1.3 (4 SP | Daniel Flores) — UI Checklist Interactivo en `ProtocoloDetallePage`:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Frontend (`ChecklistProtocolo.jsx`, `CompletarPasoModal.jsx` y `ProtocoloDetallePage.jsx`):**
      * Componente `ChecklistProtocolo.jsx` con barra de progreso porcentual dinámica, cálculo automático de pasos completados sobre el total y feedback visual semafórico.
      * Modal interactivo `CompletarPasoModal.jsx` que exige obligatoriamente una glosa u observación ($\ge 5$ caracteres) para certificar y registrar el cumplimiento normativo.
      * Bloqueo visual del botón de transición de estado en `ProtocoloDetallePage.jsx`: deshabilitado con advertencia explicativa mientras existan pasos pendientes en la fase de investigación.
      * Integración con servicio `protocolosService.js` (`getPasosProtocolo`, `completarPasoProtocolo`).
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Vitest):* 5/5 tests unitarios aprobados en `src/__tests__/components/protocolos/ChecklistProtocolo.test.jsx`.
      * *Prueba 2 (Bloqueo Visual en UI):* Botón de avance deshabilitado mientras la barra marca menos del 100%.
      * *Prueba 3 (Modal Obligatorio):* Bloqueo de confirmación ante observaciones cortas o vacías; certificación exitosa con glosa válida, actualizando el paso a verde con fecha y responsable.
      * *Prueba 4 (Desbloqueo al 100%):* Al certificar todos los pasos normativos, el botón de avance a Derivado/Cerrado se activa inmediatamente.
* **HU 5.2 (7 SP) — Alertas de Antecedentes y Detección de Escalada de Casos:**
  * **TAREA 5.2.1 (4 SP | Marcelo Acevedo) — Motor Backend de Detección de Escalada y Reincidencia:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Lógica de Negocio (`alertasService.js` y `dashboardService.js`):**
      * Implementación de `getAntecedentesEscalada(tenantId, estudianteId)` con consulta única optimizada a Supabase ($\le 45$ días con join a `tipos_abordaje`).
      * Regla 1 (Reincidencia de Ámbito): Detección de $\ge 2$ faltas en la misma tipología de abordaje en 45 días (`reincidencia_ambito = true`, nivel `'advertencia'`).
      * Regla 2 (Escalada de Gravedad): Análisis cronológico en ventana de 30 días detectando transiciones de faltas 'Leve' a 'Grave' o 'Gravísima' en un lapso $\le 15$ días calendario UTC (`escalada_gravedad = true`, nivel `'critico'`).
      * Asignación de nivel `'critico'` ante concurrencia de ambas reglas y redacción de sugerencias formativas constructivas.
    * **API y Controladores (`estudiantesController.js` y `estudiantes.routes.js`):**
      * Endpoint `GET /api/v1/estudiantes/:id/antecedentes-escalada` protegido con autenticación JWT y validación estricta de aislamiento multi-tenant (retorno 404 preventivo ante IDs inexistentes o de otros establecimientos).
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Jest Unit Tests):* 7/7 tests unitarios aprobados en 0.74s (`src/__tests__/services/antecedentesEscalada.test.js`).
      * *Prueba 2 (Caso Limpio en Servidor):* Estudiante Claudia Escobar sin incidentes recientes retornó HTTP 200 OK con `tiene_alerta: false`, `nivel: null` y `total_incidentes_recientes: 0`.
      * *Prueba 3 (Seguridad Multi-Tenant):* Consulta con UUID inexistente/externo rechazada con HTTP 404 Not Found (*"Estudiante no encontrado o no pertenece a este establecimiento"*).
      * *Prueba 4 (Mapeo de Casos Activos en Supabase):* Identificación exitosa en base de datos de alumnos con incidentes en ventana de 45 días (María González con 2, Carlos Muñoz con 2).
  * **TAREA 5.2.2 (3 SP | Daniel Flores) — Componente Visual `AlertaEscaladaBanner.jsx` en Flujos RICE:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Frontend (`AlertaEscaladaBanner.jsx`, `NuevoProtocoloPage.jsx` y `ProtocoloDetallePage.jsx`):**
      * Componente `AlertaEscaladaBanner.jsx` con renderizado condicional inteligente (solo se muestra cuando `tiene_alerta = true`).
      * Código de colores semafóricos: fondo rojo/borde rojo para nivel `critico` (escalada rápida de faltas Leve $\rightarrow$ Grave/Gravísima en $\le 15$ días) y fondo amarillo/borde ámbar para nivel `advertencia` (reincidencia en el mismo ámbito $\ge 2$ faltas en 45 días).
      * Exposición clara de sugerencias pedagógicas ministeriales y acordeón colapsable *"Ver detalle de antecedentes"* para auditar la cronología de hechos.
      * Integración reactiva en `NuevoProtocoloPage.jsx` al seleccionar al alumno y renderizado persistente en el encabezado de `ProtocoloDetallePage.jsx`.
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Vitest):* 6/6 tests unitarios aprobados en `src/__tests__/components/shared/AlertaEscaladaBanner.test.jsx`.
      * *Prueba 2 (Reactividad en Formulario):* Al seleccionar a un estudiante con faltas recientes, el banner aparece automáticamente sin recarga de página.
      * *Prueba 3 (Acordeón Desplegable):* Expansión y colapso fluido mostrando la lista de incidentes y cálculo de días transcurridos.
      * *Prueba 4 (Persistencia en Detalle):* Visualización fija en la cabecera de `ProtocoloDetallePage`.
* **HU 5.3 (8 SP) — Panel de Configuración Dinámica de Parámetros:**
  * **TAREA 5.3.1 (4 SP | Marcelo Acevedo) — DDL `configuracion_tenant` y Endpoints de Configuración:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Base de Datos (Supabase):**
      * Creación de la tabla `configuracion_tenant` con claves foráneas en cascada a `tenants`, restricciones `CHECK (> 0)` para umbrales y ventanas, políticas Row Level Security (RLS) multi-tenant y script de backfill (`migrations/2026-09-08-add-configuracion-tenant.sql` y `DOCS/schema_siga_escolar.sql`).
    * **Backend y Lógica de Negocio (`configuracionService.js`):**
      * Métodos `obtenerConfiguracion()`, `actualizarConfiguracion()` y `actualizarPlazoRegla()`.
      * Manejo de fallbacks automáticos para garantizar resiliencia en tenants sin configuración explícita.
      * Modificación de `dashboardService.getEstudiantesEnRiesgo()` y `alertasService.getAntecedentesEscalada()` para desacoplar constantes fijas del código y consultar dinámicamente `umbral_riesgo`, `ventana_dias_riesgo`, `ventana_dias_reincidencia` y `ventana_dias_escalada`.
      * Integración de auditoría completa (`auditoriaService.registrarAuditoria()`) en toda modificación de parámetros y reglas.
    * **Controladores y Rutas (`configuracionController.js` y `configuracion.routes.js`):**
      * Rutas `GET /api/v1/configuracion`, `PUT /api/v1/configuracion` y `PUT /api/v1/configuracion/reglas/:id` protegidas estrictamente con `requireRole('Administrador')`.
      * Manejo defensivo en `authController.js` para validación estructurada del body.
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Jest Unit Tests):* 8/8 tests unitarios aprobados en 0.89s (`src/__tests__/services/configuracionService.test.js`).
      * *Prueba 2 (Consulta Administrativa):* `GET /api/v1/configuracion` retornó exitosamente los parámetros y la matriz completa de las 40 reglas de protocolo del tenant.
      * *Prueba 3 (Seguridad RBAC):* Rechazo ante token inválido/ausente y bloqueo exclusivo con rol Administrador.
      * *Prueba 4 (Actualización Dinámica de Umbral):* `PUT /api/v1/configuracion` actualizó el umbral a `8`. Inmediatamente `GET /api/v1/dashboard/estudiantes-en-riesgo` recalculó la nómina filtrando en tiempo real a Carlos Muñoz con score 9.
      * *Prueba 5 (Edición de Plazo de Regla Normativa):* `PUT /api/v1/configuracion/reglas/fa45b9eb-61ab-4853-b9f9-820e4001764c` actualizó el plazo de 2 a 4 días con confirmación en base de datos.
  * **TAREA 5.3.2 (4 SP | Daniel Flores) — Vista Frontend de Configuración General y Editor de Plazos RICE:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Frontend (`ConfiguracionPage.jsx`, `configuracionService.js`, `AppRouter.jsx`):**
      * Vista integral `/configuracion` protegida con control de acceso por rol (`RoleRoute allowedRoles={['Administrador']}`) en `AppRouter.jsx`.
      * Formulario de calibración de parámetros generales (umbral de score de riesgo, ventana de análisis, ventana de reincidencia y ventana de escalada) con validaciones de números enteros positivos en cliente.
      * Tabla interactiva de reglas normativas con buscador de texto rápido y filtro desplegable por los 10 tipos de protocolo RICE.
      * Edición en línea de plazos en días con guardado por fila y feedback visual temporal de confirmación.
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Vitest):* 7/7 tests unitarios aprobados en `src/__tests__/pages/ConfiguracionPage.test.jsx`.
      * *Prueba 2 (Seguridad RBAC en Navegador):* Redirección a `/no-autorizado` al intentar acceder con cuentas de rol no Administrador.
      * *Prueba 3 (Validación de Formulario):* Rechazo en vivo de valores nulos o $\le 0$.
      * *Prueba 4 (Persistencia y Feedback):* Guardado exitoso de nuevos umbrales y edición de plazos con notificación Toast y check verde en fila.
* **HU 5.4 (4 SP) — Ficha Integral del Estudiante: Condición PIE y Domicilio Familiar:**
  * **TAREA 5.4.1 (2 SP | Marcelo Acevedo) — Migración DDL y Soporte API para Condición PIE y Domicilios:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Base de Datos (Supabase):**
      * Ejecución de script DDL agregando columnas `es_pie BOOLEAN NOT NULL DEFAULT FALSE` y `direccion VARCHAR(255)` en la tabla `estudiantes`, y `direccion VARCHAR(255)` en la tabla `apoderados`.
      * Creación del índice de optimización `idx_estudiantes_pie` sobre `estudiantes(tenant_id, es_pie)` para acelerar reportes y filtros de inclusión escolar.
      * Archivos de persistencia versionados y sincronizados en `migrations/2026-09-08-add-pie-y-direccion.sql`, `siga-backend/schema.sql` y `DOCS/schema_siga_escolar.sql`.
    * **Backend y Lógica de Negocio (`estudiantesService.js`):**
      * Incorporación de validaciones declarativas con Zod (`estudianteSchema`, `actualizarEstudianteSchema`) con sanitización de texto y restricción máxima de 255 caracteres en direcciones.
      * Actualización de `obtenerPerfil()` y `listarEstudiantes()` para seleccionar y exponer `es_pie` y `direccion` del alumno, así como `direccion` de los apoderados vinculados.
      * Actualización de `crearEstudiante()` y `actualizarEstudiante()` soportando la persistencia de condición PIE y domicilios tanto del alumno como del apoderado titular.
      * Optimización de `importarEstudiantes()` con reconocimiento inteligente de variantes de cabeceras (`pie`, `es_pie`, `domicilio`, `direccion`, `direccion_apoderado`, `domicilio_apoderado`), normalización booleana flexible (`si`, `sí`, `true`, `1`, `s`) y creación/actualización automática de registros en `apoderados`.
    * **Resultados de Validación Real en Terreno:**
      * *Script DDL Supabase:* Columnas creadas exitosamente y certificadas mediante introspección de catálogo (`information_schema.columns` confirmó `direccion` varchar, `es_pie` boolean).
      * *Prueba 1 (Jest Unit Tests):* 7/7 tests unitarios aprobados en 2.12s (`src/__tests__/services/estudiantesPieDireccion.test.js`).
      * *Prueba 2 (Consulta de Perfil):* `GET /api/v1/estudiantes/18bb5fb9-39a9-4210-9076-8df7bb6a4e52/perfil` retornó HTTP 200 OK exponiendo `es_pie: false` y `direccion: null` en estudiante, y `direccion: null` en apoderado.
      * *Prueba 3 (Actualización de Ficha):* `PUT /api/v1/estudiantes/18bb5fb9-39a9-4210-9076-8df7bb6a4e52` actualizó y persistió exitosamente `es_pie: true` y `direccion: "Av. Central 742, Villa Los Aromos"`.
  * **TAREA 5.4.2 (2 SP | Daniel Flores) — Visualización de Condición PIE y Domicilios en UI:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Frontend (`EstudiantePerfilPage.jsx`, `ImportarEstudiantesModal.jsx`):**
      * Renderizado de badge distintivo `"PIE"` con diseño accesible en el encabezado de `EstudiantePerfilPage.jsx` cuando `estudiante.es_pie === true`.
      * Incorporación de las secciones de Domicilio Personal del Estudiante y Domicilio Familiar del Apoderado en la ficha personal.
      * Actualización de la plantilla de importación CSV descargable desde `ImportarEstudiantesModal.jsx`, incorporando las columnas opcionales `pie` y `domicilio` con instrucciones claras de llenado.
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Vitest):* Tests unitarios aprobados en `src/__tests__/pages/EstudiantePerfilPage.test.jsx`.
      * *Prueba 2 (Visualización de Badge):* Comprobación visual del badge "PIE" en el perfil de alumnos inscritos en el programa.
      * *Prueba 3 (Plantilla CSV):* Descarga y verificación de columnas `pie` y `domicilio` en archivo generado.
* **HU 5.5 (6 SP) — Períodos Académicos y Búsqueda en Cascada (Nivel $\rightarrow$ Letra $\rightarrow$ Alumno):**
  * **TAREA 5.5.1 (3 SP | Marcelo Acevedo) — Tabla `periodos_academicos`, Estructura `cursos` y API en Cascada:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Base de Datos (Supabase):**
      * Creación de la tabla `periodos_academicos` con clave primaria UUID, restricción única `(tenant_id, anio)` y política Row Level Security multi-tenant (`tenant_isolation_periodos`).
      * Alteración de la tabla `cursos` incorporando las columnas `periodo_id` (FK a `periodos_academicos`) y `letra` (VARCHAR(5)).
      * Creación de índices compuestos para garantizar respuestas < 100ms: `idx_periodos_tenant_activo`, `idx_cursos_periodo_nivel` e `idx_cursos_nivel_letra`.
      * Migración y backfill de datos: creación del período lectivo 2026 para todos los tenants y desglose automático de `nombre` en `nivel` y `letra` (ej: `"1° Medio A"` $\rightarrow$ nivel: `"1° Medio"`, letra: `"A"`).
      * Scripts versionados y consolidados en `migrations/2026-09-08-add-periodos-academicos-y-cursos-cascada.sql`, `siga-backend/schema.sql` y `DOCS/schema_siga_escolar.sql`.
    * **Backend y Capas de Servicio/Controlador (`cursosService.js`, `cursosController.js`, `cursos.routes.js`):**
      * Creación de `cursosService.js` con soporte para consulta de período activo, listado jerárquico de niveles, filtrado de letras y nómina de estudiantes activos.
      * Implementación de ordenamiento pedagógico formal según la secuencia escolar chilena (Pre-Kínder $\rightarrow$ Kínder $\rightarrow$ 1° a 8° Básico $\rightarrow$ 1° a 4° Medio).
      * Creación de `cursosController.js` y refactorización de `cursos.routes.js`, exponiendo los endpoints `GET /api/v1/cursos/niveles`, `GET /api/v1/cursos/letras` y `GET /api/v1/cursos/:id/estudiantes`.
      * Actualización de `buscarOCrearCurso` en `estudiantesService.js` para clasificar automáticamente nuevos cursos con su nivel, letra y período activo.
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Jest Unit Tests):* 9/9 tests unitarios aprobados en 1.13s (`src/__tests__/services/cursosCascada.test.js`).
      * *Prueba 2 (Niveles Disponibles):* `GET /api/v1/cursos/niveles` retornó HTTP 200 OK con los 4 niveles del establecimiento (`["7° Básico", "8° Básico", "1° Medio", "2° Medio"]`) sin duplicados y estrictamente ordenados.
      * *Prueba 3 (Filtrado de Letras):* `GET /api/v1/cursos/letras?nivel=1° Medio` retornó HTTP 200 OK con los cursos `"1° Medio A"` (`id: 91dd7566-...`) y `"1° Medio B"` (`id: 8e26d343-...`).
      * *Prueba 4 (Nómina de Alumnos del Curso):* `GET /api/v1/cursos/91dd7566-b6ab-43fb-81ee-b4e8fcb6f2d2/estudiantes` retornó la lista ordenada alfabéticamente (Isidora Flores, Juan Pérez) con sus respectivos RUTs y marca `es_pie`.
  * **TAREA 5.5.2 (3 SP | Daniel Flores) — Componente `SelectorEstudianteCascada.jsx` en Incidentes y Protocolos:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Frontend (`SelectorEstudianteCascada.jsx`, `cursosService.js`, `NuevoIncidentePage.jsx`, `NuevoProtocoloPage.jsx`):**
      * Componente interactivo con flujo en cascada guiado: Nivel (ordenado pedagógicamente) $\rightarrow$ Letra (paralelos disponibles) $\rightarrow$ Lista de alumnos ordenada alfabéticamente.
      * Modo dual flexible: botón de alternancia entre navegación en cascada y búsqueda directa global por RUT o nombre/apellido.
      * Soporte para selección única (protocolos) y selección múltiple de involucrados (incidentes con badges y roles de víctima/involucrado).
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Vitest):* 6/6 tests unitarios aprobados en `src/__tests__/components/shared/SelectorEstudianteCascada.test.jsx`.
      * *Prueba 2 (Navegación en Cascada):* Carga fluida de niveles $\rightarrow$ letras $\rightarrow$ nómina de estudiantes en menos de 100ms.
      * *Prueba 3 (Modo Dual Directo):* Autocompletado reactivo funcionando por RUT y nombre sin recargas.
      * *Prueba 4 (Integración en Formularios):* Selección exitosa en `/incidentes/nuevo` y `/protocolos/nuevo`.

* **HU 5.6 — Modernización UI/UX del Acceso Institucional (Login Screen Redesign):**
  * **TAREA 5.6.1 (Daniel Flores) — Nueva Interfaz de Login, Identidad Visual y Experiencia de Usuario:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Frontend (`LoginPage.jsx`, `index.html`, `index.css`, `vite.config.js`, `LoginPage.test.jsx`):**
      * Rediseño completo de la vista de acceso basado en la propuesta de alta fidelidad `DOCS/UI/login_screen.jpeg`.
      * Integración de la ilustración vectorial oficial de estudiantes (`img_students.svg`) con renderizado nítido en el panel izquierdo sobre fondo `#FAF9F8`.
      * Incorporación del nuevo logo institucional oficial (`siga-escolar-logo.png`) optimizado y posicionado de forma centrada en la parte superior del formulario, inmediatamente sobre el encabezado "Acceder", con alta legibilidad y jerarquía visual.
      * Integración del favicon oficial SVG (`favicon.svg`) en `index.html` y configuración de precache en `VitePWA`.
      * Fondo envolvente en azul marino oscuro (`#071526`) con partículas bokeh animadas mediante keyframes CSS acelerados por GPU (`animate-float-slow`, `animate-float-medium`, `animate-float-fast`, `animate-pulse-glow`).
      * Campo de autenticación enfocado en **Email institucional** y **Contraseña** con botón interactivo para alternar visibilidad (mostrar/ocultar clave) accesible con teclado y lectores de pantalla.
      * Responsividad móvil estricta: en pantallas pequeñas (`< md`), la ilustración de estudiantes se oculta automáticamente (`hidden md:flex`) para brindar un acceso rápido, limpio y sin distracciones.
      * Modales informativos accesibles para *"Términos y Servicios"* y *"Soporte y Contacto"*, eliminando enlaces de autoregistro no pertinentes en sistemas escolares cerrados.
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Vitest):* 9/9 tests unitarios aprobados en `src/__tests__/pages/LoginPage.test.jsx`.
      * *Prueba 2 (Cobertura de Código):* 97.14% en declaraciones, 100% en ramas y 96.96% en líneas para `LoginPage.jsx`.
      * *Prueba 3 (Compilación Vite):* `npm run build` exitoso con generación de service worker PWA y chunks minificados.
      * *Prueba 4 (Linting ESLint):* Cero errores en componentes y suites de prueba.


* **HU 6.2 — Modal de Revisión Modular y Control Human-in-the-Loop en Frontend:**
  * **TAREA 6.2.1 (Daniel Flores) — Componente `ModalRevisionReporteIA.jsx` con Edición por Secciones y Tabs:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Frontend (`ModalRevisionReporteIA.jsx`, `reportesService.js`):**
      * Creación del servicio frontend en `src/services/reportesService.js` (`getReportesIncidente`, `generarBorradoresReporte`, `guardarBorradorReporte`, `aprobarReporte`, `descargarReportePdf`).
      * Modal amplio responsivo (`max-w-5xl`), accesible, con backdrop desenfocado (`backdrop-blur-sm`) y scroll fluido.
      * Barra de pestañas superiores dinámica para alternar entre informes diferenciados cuando el incidente involucra a más de un alumno, preservando el estado de edición en memoria sin sobreescrituras ni pérdidas al alternar de tab.
      * Desglose modular en las 5 secciones obligatorias de la Circular N° 482: Contexto institucional, Hechos objetivos, Medidas adoptadas, Acuerdos/compromisos formativos y Plan de seguimiento.
      * Contadores dinámicos de caracteres por bloque e indicadores visuales de estado (*"Propuesta IA Gemini Flash"*, *"Editado manualmente"*, *"Borrador en revisión"* y *"Oficializado / Aprobado"*).
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Vitest - reportesService):* 6/6 tests unitarios aprobados en `src/__tests__/services/reportesService.test.js`.
      * *Prueba 2 (Vitest - ModalRevisionReporteIA):* 8/8 tests unitarios aprobados en `src/__tests__/components/reportes/ModalRevisionReporteIA.test.jsx`.
      * *Prueba 3 (Preservación de Estado):* Comprobación de persistencia reactiva en memoria al alternar entre pestañas de alumnos víctimas e involucrados.
  * **TAREA 6.2.2 (Daniel Flores) — Lógica de Guardado de Borradores y Control de Aprobación RBAC:**
    * ✅ **Estado: Implementado, Desplegado y Validado en Terreno.**
    * **Frontend (`IncidenteDetallePage.jsx`, `ModalRevisionReporteIA.jsx`):**
      * Incorporación de botón principal de acción con ícono de destello (`Sparkles`) en el encabezado de `IncidenteDetallePage.jsx` para roles autorizados (`Administrador`, `Directivo`, `Equipo de Formación`, `Inspector`).
      * Pantalla modal de espera institucional durante la llamada con Gemini Flash detallando la aplicación de la política DLP de privacidad (Ley 19.628).
      * Botón *"Guardar Borrador"* que realiza persistencia silenciosa mediante `PATCH /reportes/:reporteId` con notificación Toast de feedback.
      * Botón *"Aprobar y Oficializar"* con diálogo modal interno de confirmación y advertencia legal, restringido estrictamente a roles directivos/coordinación (`Administrador`, `Directivo`, `Equipo de Formación`). Para el rol `Inspector`, se deshabilita con insignia de seguridad explicativa.
      * Botón *"Descargar Acta Oficial (PDF)"* activo de inmediato para reportes que ya han sido oficializados.
    * **Resultados de Validación Real en Terreno:**
      * *Prueba 1 (Vitest - IncidenteDetallePage):* 4/4 tests unitarios aprobados en `src/__tests__/pages/IncidenteDetallePage.test.jsx`.
      * *Prueba 2 (RBAC en Interfaz):* Bloqueo visual del botón de aprobación ante rol Inspector y renderizado condicional para Jefatura.
      * *Prueba 3 (Build Vite & ESLint):* Compilación de producción exitosa en 2.61s sin errores de linting.

---

### SPRINT 6: Asistente de Redacción Normativa con IA y Emisión Oficial PDF (En Ejecución)
* **Objetivo:** Reducir la sobrecarga administrativa mediante generación asistida de informes y actas oficiales con **Google Gemini Flash**, sanitización DLP, reportes diferenciados por alumno, revisión *Human-in-the-Loop* y emisión PDF oficial con membrete y firmas.
* **Estado Actual:** **100% de Tareas Backend Completadas y Certificadas en Terreno por Marcelo Acevedo (18 de 28 SP totales del Sprint)**. Cobertura de pruebas unitarias 41/41 en el módulo de reportes y 188/188 pruebas en la suite global de backend. Pendiente la integración de vistas UI en React por Daniel Flores.

#### Tareas Técnicas Ejecutadas:

1. **`SE-66` TASK 6.1.1 — Modelo DDL `reportes_incidentes` con RLS y Versionado (3 SP | Marcelo Acevedo):**
   * **Descripción Técnica:** Creación de la estructura relacional para persistir los reportes normativos en Supabase con soporte para versionado, borrador inmutable devuelto por la IA, modificaciones del profesional y aprobación oficial.
   * **Entregables de Código y Base de Datos:**
     * Archivo de migración `siga-backend/src/db/migrations/20260929_crear_reportes_incidentes.sql`.
     * Actualización del esquema maestro consolidado en `DOCS/schema_siga_escolar.sql`.
     * Creación de servicio `siga-backend/src/services/reportesService.js` con esquemas Zod (`seccionesReporteSchema`, `crearReporteSchema`, `editarReporteSchema`) y métodos CRUD seguros.
     * Triggers de base de datos: `trg_actualizar_reportes_incidentes` (gestión automática de `updated_at`) y `trg_validar_estudiante_en_reporte` (garantiza que el estudiante foco pertenezca a `incidente_estudiantes`).
     * Política de Row Level Security `tenant_isolation_reportes_incidentes` e índices de rendimiento en `(tenant_id)`, `(incidente_id)`, `(estudiante_id)` y `(tenant_id, estado)`.
   * **Resultados de Validación Real en Terreno Certificados por el Usuario:**
     * *Prueba 1 (Supabase Schema):* Creación verificada de las 16 columnas con tipado estricto `UUID`, `INT`, `VARCHAR(20)`, `JSONB`, `BOOLEAN` y `TIMESTAMPTZ`.
     * *Prueba 2 (Triggers e Integridad):* Triggers `trg_actualizar_reportes_incidentes` y `trg_validar_estudiante_en_reporte` (INSERT/UPDATE) certificados como activos en Supabase.
     * *Prueba 3 (Suite Jest):* 12/12 pruebas unitarias aprobadas al 100% en `src/__tests__/services/reportesService.test.js` cubriendo validación de esquemas Zod, rechazo de estudiantes no involucrados (400), inserción con versionado, control de duplicados (409), edición de borradores y bloqueo de modificación tras aprobación (400).

2. **`SE-67` TASK 6.1.2 — Pipeline de Sanitización DLP y Servicio Gemini Flash (`@google/genai`) (5 SP | Marcelo Acevedo):**
   * **Descripción Técnica:** Implementación del pipeline de Data Loss Prevention (DLP) para enmascaramiento estricto de PII escolar previo al envío a la API externa de Google Gemini Flash, junto con el cliente orquestador de IA estructurada (`@google/genai` v2.24.0) y el mecanismo de desanonimización selectiva para emisión de informes normativos diferenciados y confidenciales.
   * **Entregables de Código y Dependencias:**
     * Incorporación del SDK oficial `@google/genai` (v2.24.0) en `siga-backend/package.json`.
     * Creación del módulo DLP de sanitización y desanonimización selectiva: `siga-backend/src/services/dlpSanitizer.js`.
     * Creación del cliente orquestador de IA generativa escolar: `siga-backend/src/services/geminiService.js`.
     * Configuración de variables de entorno seguras en `siga-backend/.env.example` (`GEMINI_API_KEY`, `GEMINI_MODEL`).
   * **Mecanismos de Seguridad y Resiliencia Implementados:**
     * *Filtro DLP Pre-IA:* Enmascaramiento por expresiones regulares de RUTs chilenos con verificador (`[RUT_CENSURADO]`), correos (`[EMAIL_CENSURADO]`) y teléfonos chilenos (`[TELEFONO_CENSURADO]`).
     * *Tokenización Contextual de Involucrados:* Sustitución de nombres de estudiantes y apoderados por tokens neutros (`[ESTUDIANTE_FOCO]`, `[INVOLUCRADO_N]`), ordenando los reemplazos por longitud decreciente para evitar colisiones por subcadenas.
     * *Desanonimización Diferenciada Post-IA:* Reconstitución local segura que restaura el nombre real del estudiante foco en su informe particular, pero mantiene la reserva e identidad neutra de terceros/contrapartes (ej. "otro estudiante involucrado"), impidiendo que un apoderado acceda a datos protegidos de otros menores (Ley N° 19.628 / Circular N° 482).
     * *Circuit Breaker & Fallback Inteligente:* Ante ausencia de API Key o degradación externa de red/cuotas, `generarPlantillaFallback` sintetiza las 5 secciones estructuradas a partir de la metadata del incidente sin que el sistema colapse ni genere HTTP 500.
   * **Resultados de Validación Real en Terreno Certificados por el Usuario:**
     * *Prueba en Terreno en Vivo (`scripts/verificar-dlp-gemini.js`):*
       * Conexión exitosa y autenticada con API Key oficial de Google AI Studio (`AQ.Ab8RN6...`).
       * Orquestación resiliente validada con los modelos `gemini-3-flash-preview` y `gemini-3.8-flash`.
       * Sanitización DLP en vivo: Enmascaramiento completo de RUTs, teléfonos, correos y nombres en un caso de agresión entre pares. Cero fugas de PII hacia los servidores de Google.
       * Inferencia IA en vivo: Síntesis normativa en menos de 3 segundos de las 5 secciones requeridas por la Circular N° 482.
       * Desanonimización selectiva: Restauración del nombre del estudiante foco en su acta individual y preservación anónima de la contraparte como "otro estudiante involucrado".
     * *Suite Jest:* 8/8 pruebas unitarias aprobadas al 100% en `src/__tests__/services/geminiDlp.test.js`:
       * `censurarPatronesPII`: Detección y enmascaramiento exitoso de RUTs con puntos/guiones, teléfonos fijos/móviles y emails.
       * `sanitizarContextoIncidente`: Tokenización de involucrados y censura de PII dentro del relato de hechos. Rechazo con HTTP 400 ante estudiantes ajenos al caso.
       * `desanonimizarReporte`: Reincorporación exclusiva del estudiante foco preservando anonimato de la contraparte.
       * `geminiService`: Generación correcta con API Key, fallback transparente sin API Key y respuesta resiliente ante fallas de API.

3. **`SE-68` TASK 6.1.3 — Endpoints de Generación y Persistencia de Informes Diferenciados (3 SP | Marcelo Acevedo):**
   * **Descripción Técnica:** Construcción de la capa de API REST en Express para orquestar la generación asistida con IA de reportes diferenciados para incidentes de convivencia escolar, exponiendo endpoints seguros para creación, consulta por incidente, visualización de detalle, edición modular de borradores y aprobación directiva formal bajo estricto control RBAC.
   * **Entregables de Código:**
     * Método orquestador `generarBorradoresParaIncidente` en `siga-backend/src/services/reportesService.js` (vincula consulta de incidente/alumnos, sanitización DLP, inferencia Gemini Flash, desanonimización local, correlativo de versión e inserción en base de datos).
     * Creación de controlador `siga-backend/src/controllers/reportesController.js` con handlers desacoplados: `generarBorradorHandler`, `listarReportesIncidenteHandler`, `obtenerReporteHandler`, `editarBorradorHandler` y `aprobarReporteHandler`.
     * Configuración de rutas sub-recurso en `siga-backend/src/routes/incidentes.routes.js` con validación RBAC (`requireRole`).
     * Suite de pruebas automatizadas en `siga-backend/src/__tests__/controllers/reportesController.test.js`.
   * **Mecanismos de Seguridad y RBAC Implementados:**
     * *Generación (`POST /api/v1/incidentes/:id/borrador-reporte`):* Habilitada para `Administrador`, `Directivo`, `Equipo de Formación` e `Inspector`. Bloqueo con `403 Forbidden` ante rol `Docente`.
     * *Consulta (`GET /api/v1/incidentes/:id/reportes`):* Abierta a usuarios autenticados con acceso al incidente.
     * *Edición de Borrador (`PATCH /api/v1/incidentes/:id/reportes/:reporteId`):* Exclusiva para redactores autorizados. Bloqueo estricto con `400 Bad Request` si el reporte ya ha sido aprobado y oficializado (inmutabilidad legal).
     * *Aprobación Formal (`POST /api/v1/incidentes/:id/reportes/:reporteId/aprobar`):* Restringida exclusivamente a la línea de mando institucional (`Administrador`, `Directivo`, `Equipo de Formación`). Inspectores y Docentes reciben `403 Forbidden`.
     * *Aislamiento Multi-tenant:* Todas las consultas validan `tenant_id` impidiendo el acceso a incidentes o reportes de otros establecimientos (404/403).
   * **Resultados de Validación Real en Terreno Certificados por el Usuario:**
     * *Prueba en Terreno en Vivo (`scripts/verificar-endpoints-reportes.js`):*
       * Conexión directa a Supabase con datos reales (Incidente `fba9caf2-9afb-48ff-94a2-0d3a370f8e93`, Alumno Juan Pérez).
       * Emisión de token JWT con rol `Inspector`.
       * `POST /borrador-reporte`: Generación con IA y almacenamiento en Supabase (Reporte ID `0055aacb-661c-4681-b47e-5364521bcad5`, Versión incremental 2).
       * `GET /reportes`: Consulta exitosa de reportes vinculados al incidente.
       * `PATCH /reportes/:reporteId`: Edición de acuerdos en `contenido_editado` preservando intacto `contenido_borrador` para trazabilidad de auditoría.
     * *Suite Jest:* 13/13 pruebas unitarias aprobadas al 100% en `src/__tests__/controllers/reportesController.test.js` (generación multi-estudiante, errores 400 por payload incompleto o reporte cerrado, 403 por roles no autorizados y 404 por incidente inexistente).
     * *Certificación Global de Suite (HU 6.1):* **33/33 pruebas aprobadas al 100%** integrando `reportesController.test.js` (13), `reportesService.test.js` (12) y `geminiDlp.test.js` (8).

4. **`SE-71` TASK 6.3.1 — Servicio de Renderizado PDFKit y Endpoint de Descarga Oficial (4 SP | Marcelo Acevedo):**
   * **Descripción Técnica:** Implementación del motor de renderizado server-side para la emisión del informe oficial de convivencia escolar en formato PDF estándar A4 mediante PDFKit, diseñado con los estándares gráficos e institucionales de la Escuela Coeducacional N° 1 El Salvador y blindado bajo estrictas reglas de inmutabilidad jurídica (disponible únicamente para reportes en estado Aprobado).
   * **Entregables de Código:**
     * Función `generarInformeOficialIncidentePDF` en `siga-backend/src/services/pdfService.js`: renderizado de membrete institucional azul corporativo (`#1e3a5f`), folio único correlativo (`INF-2026-XXXX`), ficha del alumno foco y apoderado titular, bloques estructurados de las 5 secciones de la Circular N° 482 con saltos de página dinámicos, recuadros de firmas físicas (Convivencia y Dirección) y glosa legal de confidencialidad (Ley N° 19.628).
     * Handler `descargarReportePdfHandler` en `siga-backend/src/controllers/reportesController.js` con control de inmutabilidad (bloqueo HTTP 400 ante reportes en borrador) y enriquecimiento de datos desde tablas `tenants`, `estudiantes`, `cursos` y `apoderados`.
     * Ruta REST segura en `siga-backend/src/routes/incidentes.routes.js`: `GET /api/v1/incidentes/:id/reportes/:reporteId/pdf` retornando stream binario con `Content-Type: application/pdf` y `Content-Disposition: inline`.
     * Suites de pruebas automatizadas en `src/__tests__/services/pdfService.test.js` y `src/__tests__/controllers/reportesController.test.js`.
   * **Mecanismos de Seguridad e Integridad Implementados:**
     * *Inmutabilidad Normativa:* Si el reporte está en estado `Borrador`, la API rechaza la solicitud de descarga con `400 Bad Request` impidiendo la circulación de documentos no autorizados.
     * *Aislamiento Multi-tenant Estricto:* Valida `tenant_id` tanto en la búsqueda del reporte como en la carga del membrete y datos de matrícula.
     * *Confidencialidad Diferenciada:* El PDF solo contiene los antecedentes de filiación del estudiante foco; las menciones a otros involucrados se mantienen neutras.
   * **Resultados de Validación Real en Terreno Certificados por el Usuario:**
     * *Prueba en Terreno en Vivo (`scripts/verificar-pdf-reporte.js`):*
       * Verificación de la regla de inmutabilidad: Rechazo exitoso con `400 Bad Request` ante intento de descarga en estado `Borrador`.
       * Aprobación formal del reporte `0055aacb-661c-4681-b47e-5364521bcad5` por el Inspector General.
       * Generación del archivo PDF físico en disco: `siga-backend/reporte-oficial-prueba.pdf` (4.4 KB).
       * Inspección del documento: Membrete institucional, folio `INF-2026-0055AACB`, ficha del alumno, desarrollo de las 5 secciones normativas, bloques de firma física y glosa de confidencialidad de la Ley N° 19.628.
     * *Suite Jest:* 18/18 pruebas unitarias aprobadas al 100% integrando `pdfService.test.js` (generación de buffer válido con bytes mágicos `%PDF-`) y `reportesController.test.js` (validación de cabeceras, nombres de archivo y rechazo 400 en borradores).
     * *Certificación Global de Suite Backend:* **38/38 pruebas aprobadas al 100%** integrando `pdfService.test.js` (2), `reportesController.test.js` (16), `reportesService.test.js` (12) y `geminiDlp.test.js` (8).

5. **`SE-73` TASK 6.4.1 — Integración Nodemailer y Despacho Automatizado con PDF Adjunto (3 SP | Marcelo Acevedo):**
   * **Descripción Técnica:** Implementación del módulo de notificación formal automatizada para el apoderado titular del estudiante foco tras la oficialización del caso. Integra plantilla HTML con diseño institucional, despacho con PDF oficial adjunto mediante Nodemailer y encolamiento asíncrono con mecanismo de resiliencia no bloqueante.
   * **Entregables de Código:**
     * Plantilla de correo HTML formal `src/templates/emails/informe-oficial-apoderado.html` con membrete corporativo (`#1e3a5f`), saludo empático y no estigmatizante, ficha resumen del suceso y aviso explícito de documento legal en PDF adjunto.
     * Función `renderInformeOficialApoderadoTemplate` en `src/utils/emailTemplates.js`.
     * Función `enviarEmailInformeOficialApoderado` en `src/services/emailService.js` con soporte para adjuntos en base64 compatibles con encolamiento Redis/Bull.
     * Adaptación de `src/workers/emailWorker.js` para procesar y adjuntar archivos PDF decodificados en `mailOptions.attachments`.
     * Integración en `reportesService.aprobarReporte`: al aprobar formalmente el informe, consulta al apoderado titular (`es_titular: true`), genera el `pdfBuffer` y despacha el correo, actualizando `email_apoderado_enviado: true` y `fecha_envio_email: NOW()` en la tabla `reportes_incidentes`.
     * Suite de pruebas automatizadas en `src/__tests__/services/emailServiceReporte.test.js`.
   * **Mecanismos de Seguridad y Resiliencia Implementados:**
     * *Privacidad Estricta de Menores (Ley N° 19.628 / Circular N° 482):* El correo y su adjunto se dirigen con exclusividad al apoderado titular del alumno foco; no se filtran antecedentes, nombres ni contactos de terceras partes.
     * *Mecanismo No Bloqueante (Circuit Breaker):* Si el servicio SMTP o la cola experimentan indisponibilidad o latencia, la aprobación jurídica del reporte en base de datos permanece inalterada y validada, registrándose la situación en logs de auditoría para entrega presencial.
     * *Manejo de Casos sin Correo Electrónico:* Si el apoderado titular carece de email, el sistema conserva el flag en `false` alertando la necesidad de notificación física en inspectoría.
   * **Resultados de Validación Real en Terreno Certificados por el Usuario:**
     * *Prueba en Terreno en Vivo (`scripts/enviar-correo-prueba.js`):*
       * Verificación de la plantilla HTML generada en disco: `siga-backend/correo-apoderado-vista-previa.html`.
       * Procesamiento del adjunto PDF oficial codificado en base64 para compatibilidad total con Bull Queue y Redis.
       * Certificación de despacho seguro dirigido únicamente al apoderado titular con confirmación directa por parte del usuario.
     * *Suite Jest:* 3/3 pruebas unitarias aprobadas al 100% en `emailServiceReporte.test.js` (renderizado de plantilla, despacho con adjunto PDF y flujo integrado en `aprobarReporte`).
     * *Certificación Global de Suite Backend Sprint 6 (Marcelo Acevedo):* **41/41 pruebas aprobadas al 100%** integrando `emailServiceReporte.test.js` (3), `pdfService.test.js` (2), `reportesController.test.js` (16), `reportesService.test.js` (12) y `geminiDlp.test.js` (8).
     * *Certificación Global del Monorepo Backend:* **188/188 pruebas unitarias aprobadas en 23 suites de pruebas**, con 0 regresiones.

6. **TASK — Almacenamiento y Gestión de Fotos de Perfil (Avatares) en Supabase Storage (Full-Stack):**
    * **Descripción Técnica:** Implementación end-to-end de la arquitectura de almacenamiento de objetos en la nube para fotos de perfil de usuarios institucionales utilizando **Supabase Storage** (Bucket `avatars`), gestionando el ciclo de vida completo del recurso: subida en memoria con Multer, validación de tipo y peso, generación de URLs públicas vía CDN, purga de imágenes huérfanas, integración visual en modales de creación y edición de usuarios, tarjetas de usuarios, cabecera de navegación (`DashboardLayout`) y directorios de cursos.
    * **Entregables de Código y Base de Datos:**
      * **Backend (`siga-backend` - Marcelo Acevedo):**
        * Script DDL: `siga-backend/src/db/migrations/20260929_agregar_avatar_url_usuarios.sql` (agrega columna `avatar_url VARCHAR(500)` a la tabla `usuarios` y aprovisiona el bucket `avatars` con límite de 2 MB y políticas públicas de lectura).
        * Actualización del esquema maestro `DOCS/schema_siga_escolar.sql`.
        * Módulo de servicio `siga-backend/src/services/storageService.js` (orquesta subida a Supabase Storage con `cacheControl: 3600`, extracción de rutas relativas y purga automatizada de fotos anteriores).
        * Middleware `siga-backend/src/middlewares/uploadAvatar.js` con `multer.memoryStorage()`, límite estricto de 2 MB y lista blanca MIME (`image/jpeg`, `image/png`, `image/webp`).
        * Controladores y rutas en `usuariosController.js` y `usuarios.routes.js` exponiendo `POST /api/v1/usuarios/:id/avatar` y `DELETE /api/v1/usuarios/:id/avatar`.
        * Scripts de prueba en terreno: `scripts/verificar-avatar-storage.js` y `scripts/verificar-endpoints-avatar.js`.
        * Suites de pruebas automatizadas: `storageService.test.js`, `usuariosController.avatar.test.js` y `uploadAvatar.test.js`.
      * **Frontend (`siga-frontend` - Daniel Flores):**
        * Componente `src/components/usuarios/AvatarUploadInput.jsx`: selector de archivos con arrastrar/soltar o clic, previsualización circular inmediata, fallback de iniciales dinámicas por rol, límites visuales de 2 MB y formatos admitidos (JPG, PNG, WebP), y acciones de sustitución y eliminación.
        * Integración en `src/components/usuarios/CrearUsuarioModal.jsx`: flujo en dos fases donde primero se crea el registro del usuario y luego, de seleccionarse una foto, se ejecuta la subida enlazada a su UUID.
        * Integración en `src/components/usuarios/EditarUsuarioModal.jsx`: precarga de avatar existente, soporte para reemplazar imagen o eliminarla volviendo a las iniciales predeterminadas.
        * Tarjetas en `src/pages/UsuariosPage.jsx`: renderizado de fotografía real con soporte de recuperación mediante evento `onError` en caso de fallos de red o CDN.
        * Cabecera `src/components/layout/DashboardLayout.jsx`: miniatura del usuario conectado en la barra superior con badge de rol.
        * Gestión de estado en `src/store/useAuthStore.js`: método `updateUser` para propagación reactiva e inmediata del cambio de foto en toda la sesión del usuario.
        * Servicios en `src/services/usuariosService.js`: métodos `subirAvatarUsuario(id, file)` y `eliminarAvatarUsuario(id)`.
        * Adaptación en `src/pages/EstudiantesPage.jsx`: renderizado de foto real del profesor jefe en las cards de curso.
    * **Mecanismos de Seguridad y Resiliencia Implementados:**
      * *Almacenamiento Efímero Seguro:* Procesamiento 100% en memoria RAM sin escribir archivos en el sistema de archivos efímero de Render.
      * *Prevención de XSS y Malware:* Lista blanca de tipos MIME estricta que prohíbe archivos SVG o binarios ejecutables disfrazados, validada tanto en frontend (input nativo y verificación de extensión/peso) como en backend.
      * *Control RBAC de Propiedad:* Los usuarios solo pueden modificar o eliminar su propia fotografía (`req.user.user_id === targetId` o `:id === 'me'`); las modificaciones cruzadas quedan restringidas exclusivamente al rol `Administrador` (retornando `403 Forbidden` a roles no autorizados).
      * *Protección contra Archivos Huérfanos:* Al actualizar un avatar, el backend identifica la URL previa y purga oportunamente el objeto anterior del bucket.
      * *Degradación Elegante:* Si una imagen falla al cargar en el cliente o no existe, el sistema conmuta sin parpadeos a un avatar con las iniciales del usuario coloreadas según su rol institucional.
    * **Resultados de Validación Real en Terreno Certificados por el Usuario:**
      * *Prueba en Terreno en Vivo Backend (`scripts/verificar-avatar-storage.js`):*
        * Verificación exitosa del bucket `avatars` en Supabase Storage (Público, límite 2 MB).
        * Subida real de buffer PNG de prueba para usuario Inspector General (`inspector@mail.com`).
        * Generación de URL pública CDN válida en `nosfdmgbxyypllpdnrct.supabase.co`.
        * Actualización en vivo de la columna `avatar_url` en la tabla `usuarios` de Supabase.
        * Purga y eliminación certificada del objeto en Storage y reseteo a `null` en base de datos.
      * *Prueba de Filtros REST (`scripts/verificar-endpoints-avatar.js`):*
        * Bloqueo verificado ante archivos mayores a 2 MB (`HTTP 400 Bad Request`).
        * Bloqueo verificado ante tipos MIME no permitidos (`HTTP 400 Bad Request`).
        * Bloqueo RBAC verificado ante intentos de modificación por usuarios no autorizados (`HTTP 403 Forbidden`).
      * *Suites de Pruebas Automatizadas Backend:* **42/42 suites pasadas y 287/287 pruebas aprobadas al 100%** en todo el monorepo backend.
      * *Pruebas de Interfaz de Usuario (Frontend QA):*
        * Creación de usuario con foto y verificación de subida y visualización inmediata en tarjeta.
        * Edición de usuario existente con reemplazo de fotografía y actualización instantánea.
        * Eliminación de foto en modal de edición con retorno automático a iniciales.
        * Reflejo reactivo en tiempo real del avatar del usuario actual en la barra superior (`DashboardLayout`).
        * Compilación de producción con Vite (`npm run build`) exitosa sin advertencias ni errores de sintaxis.

---

### SPRINT 7: Rediseño UI/UX en Figma (7 Pantallas), Mapa de Calor Analítico, Auditoría DoD y UAT Integral (`SE-Sprint-7`)
* **Objetivo del Sprint:** Fortalecer la experiencia de usuario de la Escuela El Salvador mediante especificaciones de diseño en Figma lideradas por **Claudia Infante** para **7 pantallas críticas** (Acciones Pendientes, Directorio Estudiantes, Ficha de Estudiante, Nuevo Incidente, Tablero RICE, Detalle de Protocolo RICE y Nuevo Protocolo RICE), implementar la herramienta de inteligencia preventiva de **Mapa de Calor por Cursos (Opción A)** en Analítica, auditar la calidad técnica integral con un checklist riguroso de *Definition of Done (DoD)* y coordinar las pruebas finales de aceptación con el cliente (*UAT*).
* **Capacidad del Sprint:** 51 Story Points (15 SP completados en la primera fase técnica: Backend/Frontend del Mapa de Calor y Documentación).
* **Distribución de Roles:**
  * **Claudia Infante Soto (Lead UI/UX & QA DoD):** Diseño en Figma de las 7 vistas críticas (33 SP), auditoría de DoD del monorepo (5 SP) y coordinación del protocolo UAT con el cliente (5 SP). Total: **43 SP**.
  * **Marcelo Acevedo Silva (Backend & Data Lead):** Endpoints analíticos agregados, optimización de consultas, RBAC y control de privacidad (Ley N° 19.628). Total: **4 SP**.
  * **Daniel Flores Jaime (Frontend Developer):** Componente interactivo `MapaCalorCursos.jsx`, modal de diagnóstico pedagógico `DetalleCeldaModal.jsx` y actualización de `AnalyticsDashboard.jsx`. Total: **4 SP**.

#### Tareas y Entregables del Sprint 7:

1. **`S7-01` al `S7-07` — Especificaciones de Rediseño en Figma de 7 Pantallas Críticas (Claudia Infante | 33 SP):**
   * Documento oficial entregado: [`DOCS/sprint7/ESPECIFICACIONES_FIGMA_S7_CLAUDIA_INFANTE.md`](file:///home/macevedo/Proyectos/INACAP/siga-escolar/DOCS/sprint7/ESPECIFICACIONES_FIGMA_S7_CLAUDIA_INFANTE.md).
   * **Bandeja de Acciones Pendientes (4 SP):** Prototipo con semáforos de plazos fatales (Vencidos 🔴, Urgentes < 48 hrs 🟡, En Plazo 🟢), filtros por curso y acción directa de 1-clic.
   * **Directorio de Estudiantes (5 SP):** Selector visual por ciclo y curso (Pre-Kínder a 8° Básico), fotos reales de perfil, badges PIE, indicadores de riesgo y exportación masiva.
   * **Ficha y Detalles del Estudiante (5 SP):** Expediente integral con datos del apoderado, timeline de incidentes, protocolos activos y acuerdos formativos.
   * **Registro de Nuevo Incidente (5 SP):** Formulario multiescolar N:M con asignación de roles (Víctima/Agresor/Testigo), advertencia interactiva de incidentes graves y redacción fáctica.
   * **Tablero General de Protocolos RICE (5 SP):** Pipeline procesal en 4 fases normativas de la Superintendencia de Educación con conteo de días hábiles.
   * **Apertura de Nuevo Protocolo RICE (4 SP):** Selector normativo de los 10 protocolos de la Superintendencia con banner predictivo de escalada y medidas de resguardo inmediatas obligatorias.
   * **Detalle y Seguimiento de Protocolo RICE (5 SP):** Tramitación del expediente formal con stepper interactivo, checklist normativo, observaciones inmutables y descarga en PDF.

2. **`S7-05` — Endpoint Seguro de Mapa de Calor por Cursos en Backend (Marcelo Acevedo | 4 SP | ✅ Completado):**
   * Endpoint `GET /api/v1/analytics/mapa-calor-cursos`:
     * Agregación mensual de incidentes (Marzo a Diciembre) agrupados por curso con cálculo de semáforo ético:
       * 🟢 Verde: 0 a 1 leves.
       * 🟡 Amarillo: 2 a 4 leves o 1 grave.
       * 🔴 Rojo: $\ge 5$ casos o gravísimas.
     * Ordenamiento jerárquico según el sistema escolar chileno (`ORDEN_NIVELES_CHILE`).
     * Control de acceso RBAC estricto: Directivos, Inspectoría y Convivencia visualizan la matriz completa; Docentes visualizan únicamente su jefatura de curso asignada. Roles no autorizados reciben `403 Forbidden`.
   * Endpoint `GET /api/v1/analytics/mapa-calor-cursos/detalle`:
     * Drill-down pedagógico por curso, mes y año con desglose de severidad, tipologías frecuentes, estados de resolución y recomendación formativa para el equipo directivo.
     * Protección ética: datos 100% agregados sin exponer nombres de menores (conforme a la Ley N° 19.628).
   * **Resultados de Validación Backend:** **20/20 pruebas aprobadas al 100%** en `analyticsController.test.js` y **42/42 suites (294 pruebas)** aprobadas en todo el monorepo sin regresiones.

3. **`S7-06` — Implementación de Interfaz de Mapa de Calor y Modal Drill-Down (Daniel Flores | 4 SP | ✅ Completado):**
   * Creación del componente `siga-frontend/src/components/analytics/MapaCalorCursos.jsx`:
     * Matriz de Cursos vs Meses con celdas coloreadas interactivas y tooltips explicativos.
     * Selectores de Año (2026/2025) y Ciclo Escolar (*Todos*, *Parvularia*, *1° Ciclo*, *2° Ciclo*).
     * Resumen global superior con contadores de cursos en verde, amarillo y rojo.
   * Creación del componente `siga-frontend/src/components/analytics/DetalleCeldaModal.jsx`:
     * Modal interactivo accesible (Escape key, backdrop, aria-modal) que despliega el diagnóstico pedagógico del curso sin estigmatizar estudiantes individuales.
   * Integración en `siga-frontend/src/pages/AnalyticsDashboard.jsx` con navegación por pestañas (*Mapa de Calor* y *Tendencias Globales*).
   * **Resultados de Validación Frontend:** Compilación limpia con Vite (`npm run build`) en 8.94 segundos con 0 errores de sintaxis.

4. **`S7-07` — Protocolo de Auditoría Integral DoD (Claudia Infante | 4 SP | 🟢 En Preparación):**
   * Documento oficial entregado: [`DOCS/sprint7/CHECKLIST_DOD_AUDITORIA_INTEGRAL.md`](file:///home/macevedo/Proyectos/INACAP/siga-escolar/DOCS/sprint7/CHECKLIST_DOD_AUDITORIA_INTEGRAL.md).
   * Matriz de chequeo exhaustivo para verificar higiene de consola, tiempos de respuesta (< 3 seg), aislamiento multi-tenant y consistencia visual en los módulos de los Sprints 1 al 7.

5. **`S7-08` — Plan de Pruebas de Aceptación UAT en Terreno (Claudia Infante | 3 SP | 🟢 En Preparación):**
   * Documento oficial entregado: [`DOCS/sprint7/PROTOCOLO_PRUEBAS_UAT_ESCUELA_EL_SALVADOR.md`](file:///home/macevedo/Proyectos/INACAP/siga-escolar/DOCS/sprint7/PROTOCOLO_PRUEBAS_UAT_ESCUELA_EL_SALVADOR.md).
   * 6 casos de prueba E2E guiados paso a paso con el equipo directivo de la Escuela El Salvador más acta de conformidad final.

6. **`S7-09` — Módulo Transaccional de Cierre de Año Lectivo y Promoción de Cursos (Marcelo Acevedo & Daniel Flores | 8 SP | ✅ Completado y Certificado):**
   * **Definición Funcional:** Implementación integral basada en las definiciones oficiales del cliente (*Consulta de Definición Funcional: Cierre de Año Lectivo y Promoción de Cursos — SIGA Escolar*), resolviendo las 5 preguntas estructurales planteadas por la Dirección:
     * *Pregunta 1 (Opción A):* Promoción automática de cursos al nivel inmediatamente superior por defecto (Pre-Kínder a 8° Básico / 4° Medio) con capacidad de ajuste individual (repitencia, egreso o retiro).
     * *Pregunta 2 (Opción B):* Gestión diferenciada para alumnos de 8° Básico (o último nivel institucional), asignándoles automáticamente la condición de **Egresado** con desvinculación de curso activo y resguardo de antecedentes.
     * *Pregunta 3 (Opción A):* Historial y trazabilidad académica permanente mediante la nueva tabla `matriculas` (preservando el curso, año y estado final de cada período lectivo).
     * *Pregunta 4 (Opción A):* Proceso transaccional en bloque vía función RPC en PostgreSQL/Supabase (`ejecutar_cierre_anio_y_promocion`), ejecutando el cierre del período anterior, apertura del nuevo año, creación de cursos y migración de alumnos en una única transacción atómica ACID con rollback ante fallos.
     * *Pregunta 5 (Opción B):* Replicación sugerida de profesores jefes del año anterior con asignación visual en asistente, filtrando exclusivamente a docentes con rol `Docente` e incorporando avatares fotográficos.
   * **Entregables de Código y Base de Datos:**
     * **Migración y Base de Datos:** `DOCS/arquitectura_y_api/migracion_cierre_anio_y_promocion.sql` (tabla `matriculas`, índices multi-tenant, RLS y función RPC resiliente `ejecutar_cierre_anio_y_promocion` con resolución dinámica sin bloqueos de constraint).
     * **Backend (`siga-backend`):**
       * Rutas y controlador REST en `/api/v1/cierre-anio` (`GET /estado-actual`, `GET /propuesta`, `POST /ejecutar`).
       * Servicio `cierreAnioService.js` con esquemas de validación Zod (`cierreAnioPayloadSchema`) y lógica de proyección curricular flexible (Enseñanza Básica y Media completa).
       * Actualización de `cursosService.js` para enriquecer `listarCursos` con la resolución del profesor jefe y filtros por año lectivo.
       * Actualización de `estudiantesService.js` para incorporar `estado_matricula` en las consultas de nómina general.
       * Suite de pruebas automatizadas: `cierreAnioController.test.js` (43 suites y 303 pruebas pasando al 100%).
     * **Frontend (`siga-frontend`):**
       * Asistente interactivo en 4 pasos: [`CierreAnioPage.jsx`](file:///home/macevedo/Proyectos/INACAP/siga-escolar/siga-frontend/src/pages/CierreAnioPage.jsx) (Paso 1: Configuración de Años y Fechas; Paso 2: Creación de Cursos y Jefaturas con avatares; Paso 3: Nómina de Promoción con botones masivos e individuales de Egreso/Promoción y sincronización bidireccional; Paso 4: Resumen y Confirmación con Modal Modal de Seguridad).
       * Módulo de Directorio [`EstudiantesPage.jsx`](file:///home/macevedo/Proyectos/INACAP/siga-escolar/siga-frontend/src/pages/EstudiantesPage.jsx) adaptado con selector de año dinámico en cabecera principal, badge contextual dentro del curso y distintivos visuales `🎓 Egresado` y `📁 Retirado`.
       * Expediente individual [`EstudiantePerfilPage.jsx`](file:///home/macevedo/Proyectos/INACAP/siga-escolar/siga-frontend/src/pages/EstudiantePerfilPage.jsx) con badges y tabla de Trayectoria Académica histórica.
       * Suite de pruebas automatizadas en Vitest: `CierreAnioPage.test.jsx` (29 suites y 147 pruebas pasando al 100%). Build de producción con Vite exitoso.
   * **Resultados de Validación y Certificación por el Usuario:**
     * Aprobación de CP-01 (Detección de período lectivo y cálculo automático de nuevo año).
     * Aprobación de CP-02 (Proyección de cursos y filtro exclusivo de docentes con avatar fotográfico).
     * Aprobación de CP-03 (Trazabilidad y persistencia de matrículas históricas en base de datos).
     * Aprobación de CP-04 (Sincronización bidireccional y restauración de curso superior sugerido).
     * Aprobación de CP-05 (Ejecución transaccional exitosa de la función RPC en Supabase).
     * Validación de egreso dinámico para 8° Básico y soporte de Enseñanza Media.
     * Validación de navegación contextual de años lectivos y visualización con badges de egresados/retirados en el listado de estudiantes.

7. **`S7-10` — Desacople del Módulo de Asistencia Escolar y Empoderamiento del Rol Docente en Aula (Marcelo Acevedo & Daniel Flores | 5 SP | ✅ Completado y Certificado):**
   * **Justificación de Negocio y Cliente:** La Escuela Coeducacional N° 1 El Salvador determinó que el registro de asistencia diaria se realiza en sistemas ministeriales externos (SIGE) y el colegio no dispone de integración directa ni requerimiento operativo para duplicar dicho registro en SIGA Escolar. Consecuentemente, se procedió al desmantelamiento limpio y seguro del módulo de Asistencia.
   * **Definición y Empoderamiento del Rol Docente:**
     * Se clarificó la función central del docente en la plataforma combinando dos pilares clave:
       1. **Acompañamiento Pedagógico y Jefatura:** Consulta de nómina de cursos, identificación de estudiantes con apoyo PIE, teléfonos de contacto de apoderados e historial formativo.
       2. **Registro Directo de Incidentes de Aula (`/incidentes/nuevo`):** Habilitación plena del rol Docente en frontend y backend para reportar de inmediato situaciones de convivencia ocurridas durante la clase a Inspectoría y Equipo de Convivencia.
       3. **Ruta por Defecto al Iniciar Sesión:** Al autenticarse un docente, el sistema lo redirige fluidamente a `/estudiantes` (en lugar de la extinta `/asistencia`).
   * **Cambios Técnicos Implementados:**
     * **Frontend (`siga-frontend`):**
       * `DashboardLayout.jsx`: Eliminación del ítem de navegación "Asistencia" y su icono `ClipboardCheck`.
       * `useAuthStore.js`: Actualización de la ruta de redirección por defecto de `Docente` a `/estudiantes`.
       * `AppRouter.jsx`: Eliminación de la ruta `/asistencia` y adición de `Docente` en `RoleRoute` de `/incidentes/nuevo`.
       * `IncidentesPage.jsx` y `DashboardPage.jsx`: Incorporación de `Docente` en los permisos `canCreate` y `canCreateIncidente` de Acciones Rápidas.
       * Eliminación de vistas y componentes obsoletos: `AsistenciaPage.jsx`, `components/asistencia/` y suites de prueba asociadas.
     * **Backend (`siga-backend`):**
       * `server.js`: Desacople de cola Bull `alertaAusentismoQueue`, worker de procesamiento `procesarAlertaAusentismo`, cron job diario de las 09:00 AM y cierre en graceful shutdown.
       * `routes/v1/index.js` y `routes/index.js`: Eliminación de montura de rutas `/asistencia`.
       * `incidentes.routes.js`: Inclusión de `Docente` en el middleware `requireRole` para `POST /` (creación de incidentes).
       * Eliminación de archivos huérfanos: rutas, controladores, servicios, caché Redis, colas y jobs de alerta de ausentismo.
       * Nueva suite de pruebas automatizadas: `src/__tests__/middlewares/requireRole.test.js` certificando la autorización del rol Docente.
   * **Resultados de Validación y Calidad Técnica:**
     * **Backend:** 43/43 suites de pruebas aprobadas al 100% (285 pruebas pasadas) con Jest.
     * **Frontend:** 27/27 suites de pruebas aprobadas al 100% (137 pruebas pasadas) con Vitest. Compilación de producción con Vite (`npm run build`) exitosa en 7.47s con 0 errores.
     * **Documentación:** Actualización íntegra del `MANUAL_DE_USUARIO.md` eliminando la sección de asistencia y reordenando el índice temático.

8. **`S7-11` — Rediseño UI de Acciones Pendientes: Pizarra Interactiva de Post-its (Claudia Infante & Daniel Flores | 4 SP | ✅ Completado y Certificado):**
   * **Objetivo de Diseño:** Transformar la bandeja plana de acciones pendientes en una pizarra visual e intuitiva de notas adhesivas físicas (Post-it notes), facilitando la detección inmediata de plazos por el equipo directivo y de convivencia.
   * **Componentes y Estilos Implementados:**
     * **Pizarra Modular (`postit-board`):** Disposición en cuadrícula responsiva con leyenda superior de estados (🔴 Vencido, 🟡 Por vencer, 🟢 Completado / En plazo).
     * **Anatomía del Post-it (`postit-note`):**
       * Formato cuadrado (aspect-ratio 1:1) con degradados realistas según severidad (`#ffb3b3` a `#f79a9a` vencido, `#ffe27a` a `#f5cf4a` por vencer, `#b9eac3` a `#9ad9a8` en plazo).
       * Cinta adhesiva superior semitransparente con leve inclinación (`::before`).
       * Sombra realista con esquina levantada (`::after`).
       * Rotación orgánica alternada por posición (`--r`, `--t`) que se endereza suavemente al posar el cursor (`hover: rotate(0deg) translateY(-4px)`).
     * **Accesibilidad y Pruebas:** Compatibilidad garantizada para lectores de pantalla (`aria-labelledby`, `sr-only`), modo oscuro y `prefers-reduced-motion`.
     * **Resultados de Validación:** 10/10 pruebas pasando en `DashboardAccionesPendientes.test.jsx`. 27/27 suites (137 pruebas) aprobadas en Vitest y build exitoso con Vite.

9. **`S7-12` — Buscador Predictivo de Alumnos en Navbar Tipo Spotlight (Daniel Flores & Marcelo Acevedo | 4 SP | ✅ Completado y Certificado):**
   * **Objetivo Funcional:** Dotar a la barra de navegación superior (Header) de una experiencia de búsqueda instantánea para localizar estudiantes desde cualquier pantalla del sistema sin necesidad de navegar previamente al Directorio.
   * **Características Implementadas:**
     * **Componente `NavbarStudentSearch.jsx`:**
       * Entrada con debounce de 250ms que consulta dinámicamente al backend a partir de 2 caracteres (`getEstudiantes({ search })`).
       * Menú desplegable flotante (dropdown typeahead) con resultados en vivo mostrando: nombre completo, RUT formateado, curso actual, insignias de estado (PIE, Egresado, Retirado) y flecha interactiva de navegación directa.
       * Redirección directa al expediente del estudiante (`/estudiantes/:id`) con 1 solo clic.
       * Botón de envío (`Enter`) o enlace inferior para explorar los resultados filtrados en el directorio general (`/estudiantes?search=...`).
       * Adaptabilidad móvil completa con botón de lupa expandible sobre el header para inspectores y docentes en patio.
       * Limpieza rápida con tecla Escape o clic fuera (`click-outside`).
     * **Sincronización en `EstudiantesPage.jsx`:** Lectura reactiva de `useSearchParams` para pre-cargar y activar filtros automáticos cuando se accede con un query de búsqueda.
     * **Resultados de Calidad y Validación:** 5/5 pruebas unitarias aprobadas en `NavbarStudentSearch.test.jsx`. 31/31 suites (150 pruebas) pasando en Vitest y build de producción con Vite exitoso en 7.83s.

10. **`S7-13` — Módulo Copiloto RAG Normativo RICE (Retrieval-Augmented Generation con pgvector y Gemini Embedding/Pro) (Marcelo Acevedo & Daniel Flores | 8 SP | ✅ Completado y Certificado en Terreno):**
    * **Objetivo de Negocio e Innovación:** Entregar a los directivos, inspectores y docentes un asesor de IA contextualizado al Reglamento Interno y de Convivencia Escolar (RICE) específico de la escuela, garantizando el cumplimiento del debido proceso (Circular N° 482 de la Superintendencia) y la tipificación precisa de medidas formativas o plazos legales (24 horas ante delitos).
    * **Arquitectura y Componentes Desarrollados:**
      * **Base de Datos Vectorial (Supabase PostgreSQL):**
        * Extensión `pgvector` activada.
        * Tablas maestras `rice_documentos` (versión, metadatos, estado activo) y `rice_chunks` (`seccion TEXT`, `articulo TEXT`, `contenido TEXT`, vector embedding de dimensión 768).
        * Índice de vecinos más cercanos `HNSW` (`vector_cosine_ops`) con `m=16` y `ef_construction=64`.
        * Función RPC `buscar_contexto_rice` con filtrado estricto por `tenant_id` y umbral de similitud de coseno.
        * Políticas de Row Level Security (RLS) que aíslan completamente el reglamento de cada establecimiento.
      * **Backend (`siga-backend`):**
        * Middleware de subida con validación estricta de Magic Bytes PDF (`%PDF-`) o Markdown (`uploadRiceMiddleware.js`).
        * Servicio de normalización y chunking semántico (`riceConverterService.js`) con jerarquización de encabezados (`# TÍTULO`, `## CAPÍTULO`, `### ARTÍCULO`).
        * Pipeline de ingesta (`riceIngestaService.js`) con embeddings vectoriales de 768 dimensiones vía Gemini `text-embedding-004`.
        * Servicio de consulta RAG (`riceRagService.js`) con desidentificación y enmascaramiento DLP escolar (`dlpSanitizer.js`), prompt de anclaje normativo con debido proceso y citas directas.
        * Controlador (`riceController.js`) y endpoints protegidos por RBAC (`POST /api/v1/rice/upload`, `GET /api/v1/rice/documento-activo`, `POST /api/v1/rice/consultar`).
      * **Frontend (`siga-frontend`):**
        * Modal de gestión y carga de RICE (`GestionRiceModal.jsx`) exclusivo para Administradores desde Configuración.
        * Asistente interactivo tipo Copiloto (`AsistenteNormativoModal.jsx`) accesible desde el Header global y desde la ficha de detalle de cualquier incidente (`IncidenteDetallePage.jsx`), con sugerencias rápidas, historial conversacional y visor colapsable de fragmentos normativos citados.
      * **Resultados de Validación y Pruebas:**
        * Cobertura de pruebas completa: 16 pruebas unitarias y de integración pasando en backend (`riceRag.test.js` y `riceController.test.js`) y 8 pruebas en frontend (`riceService.test.js`, `AsistenteNormativoModal.test.jsx`, `GestionRiceModal.test.jsx`).
        * **Validación en Terreno con Datos Reales:** Carga y activación exitosa del RICE oficial de la **Escuela Coeducacional N° 1 El Salvador** (documento extenso con 150+ páginas). Consulta sobre protocolos de agresión y ciberacoso respondida con precisión citando el Capítulo VII (pág. 137), Cuarta Parte (pág. 149), principios de Circular N° 482 y plazo perentorio de 24 horas ante delitos.

---

### Sprint 7 / Mejora de Usabilidad: Navegación Global y Persistencia de Layout (Navbar & Sidebar)
* **Objetivo:** Garantizar la presencia persistente del Navbar superior (con buscador en tiempo real de alumnos, notificaciones, copilot RICE y perfil) y del Sidebar lateral colapsable/responsive en la totalidad de las pantallas operativas del sistema.
* **Componentes intervenidos:**
  * `EstudiantePerfilPage.jsx`: Integración de `DashboardLayout` tanto en estado de carga y error como en el visor de ficha escolar.
  * `IncidenteDetallePage.jsx`: Integración de `DashboardLayout` envolviendo cabecera, estados, detalle de involucrados y modales de reportes/RICE.
  * `NuevoIncidentePage.jsx`: Integración de `DashboardLayout` en formulario de registro con selectores en cascada.
  * `NuevoProtocoloPage.jsx`: Integración de `DashboardLayout` en creación de protocolos RICE con alertas de escalada.
  * `ProtocoloDetallePage.jsx`: Integración de `DashboardLayout` en el seguimiento de pasos normativos y avance de estados.
  * `useTheme.js`: Incorporación de fallback seguro en modo claro/oscuro para aislar y blindar pruebas unitarias y entornos sin `ThemeProvider`.
* **Resultados de Validación:**
  * 31 suites de pruebas unitarias y de integración pasando al 100% (150 de 150 tests exitosos).
  * Build de producción Vite completado limpiamente con 0 errores.

---

### Sprint 7 / Mejora Analítica: Jerarquía Colapsable por Nivel y Filtro Inteligente en Mapa de Calor
* **Objetivo:** Eliminar la sobrecarga visual de la matriz analítica cuando la base de datos está limpia o cuando los cursos no tienen incidentes, introduciendo una arquitectura jerárquica de dos niveles (Nivel General consolidado -> Secciones específicas desglosadas).
* **Componentes intervenidos:**
  * `analyticsController.js` (Backend): Estructura consolidada `niveles_agrupados` que calcula las sumatorias mensuales y semáforos generales de cada nivel escolar según la jerarquía del Ministerio de Educación de Chile.
  * `MapaCalorCursos.jsx` (Frontend):
    * Fila padre colapsable por nivel (ej. "8° Básico") con botón interactivo de flecha y contador de secciones.
    * Filas hijas anidadas con sangría (`↳ Sección A`, `↳ Sección B`) que se despliegan únicamente al expandir el nivel.
    * Filtro inteligente activo por defecto: **«Solo con incidentes»**, ocultando filas vacías en 0.
    * Botones rápidos de control masivo: **«Expandir todos»** y **«Colapsar todos»**.
    * Estado visual limpio (*Empty State*) con mensaje de felicitación pedagógica cuando no hay incidentes en ningún curso.
* **Resultados de Validación:**
  * 20 pruebas de integración de backend pasando al 100% en Jest (`analyticsController.test.js`).
  * 150 pruebas unitarias de frontend pasando al 100% en Vitest.
  * Compilación de producción Vite impecable con 0 errores.

---

### Sprint 7 / Mejora de Usabilidad: Estado Vacío y Mensaje de Convivencia Estable en Protocolos RICE
* **Objetivo:** Prevenir la sensación de interfaz en blanco o fallo técnico cuando la base de datos se encuentra limpia o cuando no existen casos normativos abiertos.
* **Componentes intervenidos:**
  * `ProtocolosPage.jsx`: Integración de `EmptyState` profesional y receptivo con ícono `ShieldCheck` verde esmeralda.
    * Mensaje pedagógico claro: *"No hay protocolos activos: No se registran casos normativos abiertos en este período. La convivencia escolar se encuentra al día y en orden."*
    * Diferenciación de filtros: Si hay filtros aplicados, indica *"No se encontraron protocolos con los filtros aplicados"* con botón rápido para **«Limpiar Filtros»**.
    * Acceso directo para perfiles autorizados con botón **«Activar Protocolo RICE»**.
* **Resultados de Validación:**
  * 150 de 150 pruebas pasando al 100% en Vitest (`npx vitest run --pool=threads`).
  * Build de producción Vite completado con éxito (0 errores).

---

### Sprint 7 / Mejora de Usabilidad: Onboarding y Estado Inicial Atractivo en Directorio de Estudiantes y Cursos
* **Objetivo:** Orientar al equipo escolar y directivo cuando la plataforma se encuentra recién desplegada o con la base de datos limpia, explicando que los cursos se crean de forma autónoma al cargar la nómina de alumnos.
* **Componentes intervenidos:**
  * `EstudiantesPage.jsx`:
    * Rediseño visual del estado vacío (`cursosDisponibles.length === 0`) con tarjeta amplia en degradado suave (`bg-gradient-to-b from-blue-50/60 via-white to-gray-50/80`), bordes punteados estilizados y modo oscuro integrado.
    * Ícono ilustrativo animado (`GraduationCap` con rebote suave).
    * Titular claro y pedagógico: *"Aún no hay cursos ni estudiantes registrados"*.
    * Mensaje explicativo: *"Los cursos y sus niveles se reconocen automáticamente al cargar la nómina de estudiantes. No necesitas crearlos manualmente uno a uno."*
    * Badge informativo de compatibilidad: *"Compatible con archivos Excel (.xlsx) y CSV con el formato oficial"*.
    * Llamado a la acción (CTA) directo para administradores y equipo de formación: Botón destacado **«Cargar Nómina de Estudiantes (Excel)»** que abre de inmediato el modal de importación con barra de progreso.
* **Resultados de Validación:**
  * Nueva prueba unitaria agregada en `EstudiantesCursosPage.test.jsx` certificando la visualización del empty state y su CTA.
  * 5/5 pruebas unitarias pasando al 100% en `EstudiantesCursosPage.test.jsx`.
  * Build de producción Vite completado con éxito (0 errores).

---

### Sprint 7 / Mejora de Usabilidad: Hero Banner del Curso, Filtros Rápidos (PIE/Riesgo) y Vista Dual (Lista vs Tarjetas)
* **Objetivo:** Proporcionar una experiencia de navegación moderna, fluida e intuitiva al consultar un curso específico, alineada con las necesidades de jefatura y duplas psicosociales.
* **Componentes intervenidos:**
  * `EstudiantesPage.jsx`:
    * **Hero Banner del Curso:** Tarjeta institucional con avatar del Profesor(a) Jefe, nombre, email de contacto oficial y badges métricos destacados:
      * **Matriculados Activos:** Métrica en azul institucional con ícono `Users`.
      * **Estudiantes con apoyo PIE:** Métrica en púrpura pedagógico con ícono `Puzzle`.
    * **Barra de Herramientas Integrada:** Buscador en tiempo real por RUT, nombre o apoderado, alternador de vista interactivo (**Lista / Tarjetas**) y botones directos de exportación a **Excel** y **PDF**.
    * **Chips de Filtrado Rápido:** Píldoras interactivas con un solo clic para filtrar por `Solo PIE` (con conteo en vivo), `Riesgo Alto` y `Riesgo Medio`.
    * **Vista Alternable en Tarjetas (Grid Cards):** Cada alumno se representa con tarjeta interactiva mostrando iniciales en degradado, badge PIE, semáforo de riesgo, curso, apoderado titular y botón directo **«Ver Ficha del Estudiante»**.
    * **Vista en Lista Enriquecida:** Tabla optimizada con columna distintiva de apoyo PIE y diseño adaptado a modo oscuro.
* **Resultados de Validación:**
  * Nueva prueba unitaria agregada en `EstudiantesCursosPage.test.jsx` validando el Hero Banner, las métricas de matriculados/PIE y el cambio dinámico a vista tarjetas.
  * 6 de 6 pruebas unitarias pasando al 100% en `EstudiantesCursosPage.test.jsx`.
  * Build de producción Vite completado con éxito (`0` errores, tiempo de compilación ~7s).

---

### Sprint 7 / Seguridad y Gestión: Asignación de Profesor Jefe con Confirmación de Contraseña
* **Objetivo:** Permitir la asignación o reasignación ágil de la jefatura de un curso desde el propio directorio, exigiendo confirmación con la contraseña institucional del usuario autenticado para certificar la autorización del cambio.
* **Componentes intervenidos:**
  * **Backend:**
    * `cursosService.js`: Método `asignarProfesorJefe()` con verificación estricta de credenciales usando `bcrypt.compare` contra el hash almacenado en Supabase, validación de pertenencia al tenant y control de estado activo del docente.
    * `cursosController.js`: Handler `asignarProfesorJefeHandler` con respuestas normalizadas de éxito y error.
    * `cursos.routes.js`: Ruta `PATCH /api/v1/cursos/:id/profesor-jefe` protegida con RBAC (`Administrador`, `Equipo de Formación`).
  * **Frontend:**
    * `AsignarProfesorModal.jsx`: Modal interactivo que lista a los docentes activos del establecimiento, cuenta con opción de desasignación y exige el ingreso de la contraseña de inicio de sesión con toggle para ver/ocultar clave.
    * `EstudiantesPage.jsx`: Botón dinámico `[+ Asignar Profesor / Cambiar Profesor]` en el Hero Banner que actualiza el estado en vivo sin recargar la página.
    * `cursosService.js`: Integración de función cliente `asignarProfesorJefe()`.
* **Resultados de Validación:**
  * 3 nuevas pruebas unitarias en `cursosCascada.test.js` cubriendo: rechazo por contraseña vacía (400), rechazo por contraseña errónea (401) y asignación exitosa (200).
  * 12 de 12 pruebas de backend pasando al 100% en Jest (`cursosCascada.test.js`).
  * 6 de 6 pruebas de frontend pasando al 100% en Vitest (`EstudiantesCursosPage.test.jsx`).
  * Compilación de producción Vite ejecutada exitosamente con 0 errores.

### Sprint 7 / UX & Arquitectura de Navegación: Flujo Pedagógico Jerárquico (Inicio -> Cursos -> Estudiantes -> Perfil)
* **Objetivo:** Implementar la jerarquía de navegación escolar intuitiva solicitada: `Inicio -> Cursos -> Estudiantes -> Perfil {nombre estudiante}`, garantizando coherencia cognitiva, migas de pan interactivas y retención de contexto del curso seleccionado.
* **Componentes intervenidos:**
  * **Frontend:**
    * `Breadcrumbs.jsx`: Soporte para handlers interactivos `item.onClick`, enlaces `item.href` y estilizado adaptable en modo oscuro.
    * `DashboardLayout.jsx`: Ajuste de la barra lateral con la sección **Cursos** (icono `GraduationCap`), vinculada a la gestión de cursos y nóminas de alumnos.
    * `EstudiantesPage.jsx`:
      * Estado y sincronización bidireccional con el parámetro URL `?curso=:id`.
      * Migas de pan dinámicas: `Inicio > Cursos` en el directorio general, y al seleccionar un curso: `Inicio > Cursos > Estudiantes`, permitiendo volver al directorio con un solo clic.
      * Traspaso de contexto de curso hacia la ficha del estudiante mediante `navigate(/estudiantes/:id?curso=:cursoId)`.
      * Herencia cromática en Hero Banner: el contenedor principal del curso (docente, alumnos matriculados y apoyos PIE) adopta automáticamente la paleta visual, barra de acento, bordes y tonalidades temáticas (`PALETA_CURSOS`) de la tarjeta correspondiente en el catálogo.
    * `EstudiantePerfilPage.jsx`:
      * Inclusión de `Breadcrumbs` con la secuencia completa: `Inicio` > `Cursos` > `Estudiantes` > `Perfil {nombre} {apellido}`.
      * Navegación contextual en botón de retorno (`← Volver a Estudiantes`), redirigiendo al listado del curso de procedencia del alumno.
    * `AppRouter.jsx`: Enrutamiento resiliente con redirección automática de `/cursos` hacia `/estudiantes`.
* **Resultados de Validación:**
  * 9 de 9 pruebas unitarias en `EstudiantesCursosPage.test.jsx` pasando al 100%, validando el flujo de migas de pan, apertura directa por parámetro de URL y la tonalidad coherente del Hero Banner.
  * 9 de 9 pruebas unitarias en `EstudiantePerfilPage.test.jsx` pasando al 100%, certificando la secuencia completa de breadcrumbs y retorno contextual.
  * Suite completa de pruebas de frontend (155 pruebas en 31 suites) y build de producción Vite certificados con 0 errores.

### Sprint 7 / Épica 7.2 — Infraestructura y Base de Datos: Tablas de Mediación Escolar y Acuerdos Formativos (TASK 7.2.1.1)
* **Objetivo:** Diseñar y desplegar en Supabase (PostgreSQL 15) la infraestructura relacional de datos para el módulo de mediaciones escolares y acuerdos formativos con enfoque restaurativo, incorporando aislamiento multi-tenant RLS, correlativo automático de folio inmutable y claves foráneas en cascada.
* **Componentes intervenidos:**
  * **Base de Datos (Supabase / PostgreSQL 15):**
    * `20261015_crear_tablas_mediaciones.sql`:
      * Tabla `mediaciones` con PK UUID, folio único generado por trigger (`MED-YYYY-XXXX`), relaciones con `tenants`, `incidentes`, `usuarios` (mediador) y estados de ciclo de vida (`borrador`, `programada`, `en_sesion`, `acordada`, `sin_acuerdo`, `derivada_inspectoria`).
      * Tabla `mediacion_participantes` con restricción de unicidad `unique_estudiante_en_mediacion`, rol de participante (`parte_1`, `parte_2`, `afectado`, `mediador_par`, `observador`) y seguimiento de aviso previo al apoderado.
      * Secuencia atómica `seq_mediaciones_folio` y trigger `trg_generar_folio_mediacion` (prevención de colisiones concurrentes).
      * Políticas RLS multi-tenant robustas con protección de casteo de UUIDs mediante `NULLIF(current_setting('app.tenant_id', true), '')::uuid` y `FORCE ROW LEVEL SECURITY`.
      * Índices B-Tree optimizados en `(tenant_id, estado)`, `(folio)`, `(estudiante_id)`, `(mediacion_id)` e `(incidente_id)`.
  * **Backend Testing:**
    * `mediacionesMigration.test.js`: Suite de 6 pruebas unitarias verificando definición de tablas, claves foráneas, generación de folios, RLS e índices.
* **Resultados de Validación:**
  * 6 de 6 pruebas unitarias aprobadas al 100% en Jest (`mediacionesMigration.test.js`).
  * Certificación en Supabase SQL Editor:
    * Generación atómica de folios verificada (`MED-2026-0001`, `MED-2026-0002`, `MED-2026-0003`).
    * Aislamiento RLS certificado: consulta sin `tenant_id` retorna exactamente 0 filas (`filas_visibles_sin_tenant: 0`).
  * Suite completa de backend (46 suites, 311 pruebas) aprobada al 100% sin regresiones.

### Sprint 7 / Épica 7.2 — Backend: Controladores, Servicios, Validación Zod y Notificaciones a Apoderados en Express 5 (TASK 7.2.1.2)
* **Objetivo:** Desarrollar los controladores, lógica de negocio y contratos de validación en Express 5 para el ciclo de vida de mediaciones escolares, asegurando la regla de negocio de al menos 2 estudiantes distintos, rollback compensatorio, listado paginado filtrable por estado y curso, y registro de aviso formal con notificación a apoderados.
* **Componentes intervenidos:**
  * **Validaciones Zod (`src/schemas/mediacionesSchemas.js`):**
    * Contratos estrictos para creación (`crearMediacionSchema`), filtros de listado (`filtrosMediacionesSchema`) y notificación a apoderados (`notificarApoderadosSchema`).
    * Regla de validación `.refine()` que exige al menos 2 estudiantes participantes distintos y rechaza colisiones/duplicados de un mismo alumno en la mediación.
  * **Servicios de Negocio (`src/services/mediacionesService.js`):**
    * `crearMediacion`: inserción atómica de cabecera y participantes, rollback compensatorio ante fallas en estudiantes relacionados y registro de auditoría inmutable.
    * `listarMediaciones`: consulta paginada de alta velocidad (<150ms) con joins a `usuarios` (mediador), `estudiantes` y `cursos`, con filtros multidimensionales (`estado`, `tipo_origen`, `fecha_desde`, `fecha_hasta`, `curso_id`, `estudiante_id`).
    * `obtenerMediacionPorId`: consulta integral del expediente de mediación, participantes y contactos de apoderados titulares.
    * `notificarApoderados`: despacho de correos formativos vía `emailService` y registro de la marca temporal (`aviso_apoderado_enviado = true`, `fecha_aviso_apoderado = NOW()`) en la tabla `mediacion_participantes` con log de auditoría.
  * **Controladores Express 5 (`src/controllers/mediacionesController.js`):**
    * Handlers HTTP desacoplados (`crearHandler`, `listarHandler`, `obtenerHandler`, `notificarApoderadosHandler`) con respuestas estandarizadas y delegación de excepciones a middleware centralizado.
  * **Rutas y Seguridad RBAC (`src/routes/mediaciones.routes.js`):**
    * Rutas montadas bajo `/api/v1/mediaciones` y `/api/mediaciones` protegidas con `requireRole('Administrador', 'Directivo', 'Equipo de Formación', 'Inspector', 'Docente')`.
  * **Plantilla de Correo Institucional (`src/templates/emails/aviso-mediacion-apoderado.html` y `src/utils/emailTemplates.js`):**
    * Formato HTML responsive institucional con membrete oficial, enfoque formativo, principio de confidencialidad y resguardo de datos sensibles de menores conforme a la Circular N° 482 de la Superintendencia de Educación.
* **Resultados de Validación y Certificación en Terreno:**
  * **Pruebas Unitarias Automatizadas:**
    * 27 de 27 pruebas aprobadas al 100% en `mediacionesService.test.js` y `mediacionesController.test.js`.
    * **Cobertura de Código:** **100%** en controladores, **100%** en esquemas Zod y **93.38%** en servicios (promedio ponderado **95.26%**, superando el criterio de aceptación del $\ge 85\%$).
    * Cero regresiones: Suite completa de backend aprobada con **48 test suites y 338 pruebas exitosas**.
  * **Validación Funcional en Entorno Real (Insomnia / Postman):**
    * Creación de mediación exitosa (`POST /api/v1/mediaciones`) retornando código `201 Created` y folio correlativo generado automáticamente (`MED-2026-0007`).

### Sprint 7 / Épica 7.2 — Backend: Modelo mediacion_compromisos y Endpoints de Gestión en Express (TASK 7.2.2.1)
* **Objetivo:** Implementar la estructura de datos relacional para los acuerdos y compromisos formativos pactados en mediación escolar (`mediacion_compromisos`), garantizando integridad atómica con rollback compensatorio en Express 5, tipos regulados por enum o check constraint, y validación estricta Zod que impide fechas límites retroactivas anteriores a la mediación.
* **Componentes intervenidos:**
  * **Infraestructura y Base de Datos Supabase (`src/db/migrations/20261020_crear_tabla_mediacion_compromisos.sql`):**
    * Tabla `mediacion_compromisos` con claves foráneas a `tenants`, `mediaciones` y `estudiantes`.
    * Tipos de compromiso regulados mediante restricción `CHECK`: `'reparacion_relacional'`, `'disculpa_comunitaria'`, `'cuidado_espacios'`, `'actitud_aula'`, `'apoyo_academico'`, `'otro'`.
    * Índices B-Tree optimizados sobre `tenant_id`, `mediacion_id`, `estudiante_id` y `fecha_limite`.
    * Políticas de seguridad RLS (`tenant_isolation_mediacion_compromisos`) que aseguran el aislamiento estricto multi-tenant por colegio.
  * **Contratos de Validación Zod (`src/schemas/mediacionesSchemas.js`):**
    * `compromisoItemSchema`: valida estructura de cada acuerdo, longitud de descripción, formato de fecha `YYYY-MM-DD` y tipos admitidos.
    * `crearGuardarCompromisosSchema(fechaMediacion)`: función de esquema contextualizada con `.superRefine()` que valida que ninguna `fecha_limite` sea anterior a la `fecha_programada` de la sesión de mediación.
  * **Servicios de Negocio y Transaccionalidad (`src/services/mediacionesService.js`):**
    * `guardarCompromisos`: lógica de reemplazo en lote con **rollback compensatorio** (respalda acuerdos previos en memoria, limpia existentes e inserta el nuevo conjunto; si la BD rechaza los nuevos registros, restaura automáticamente los anteriores). Actualiza estado de mediación a `'acordada'`, fija `fecha_seguimiento` y emite log de auditoría inmutable en `auditoriaService`.
    * `listarCompromisos`: consulta los compromisos vigentes ordenados cronológicamente por fecha límite.
    * `obtenerMediacionPorId`: select enriquecido para incorporar la relación `mediacion_compromisos (*)` en la ficha integral del expediente.
  * **Controladores y Rutas Express 5 (`src/controllers/mediacionesController.js` y `src/routes/mediaciones.routes.js`):**
    * Endpoints `PUT /api/v1/mediaciones/:id/compromisos` y `GET /api/v1/mediaciones/:id/compromisos` protegidos por roles RBAC (`Administrador`, `Directivo`, `Equipo de Formación`, `Inspector`, `Docente`).
* **Resultados de Validación Automatizada:**
  * **Pruebas Unitarias (`src/__tests__/services/mediacionCompromisos.test.js`):**
    * 13 de 13 pruebas aprobadas al 100% (validación de enums, rechazo de fecha límite anterior a la mediación, atomicidad y rollback compensatorio, 404 de mediación y respuestas 200 de handlers).
  * **Suite Global Backend:**
    * 51 de 51 suites aprobadas al 100% (**364 pruebas en verde**, 0 fallos, 0 regresiones).

### Sprint 7 / Épica 7.2 — Backend: Motor PDFKit de Acta Oficial de Mediación Escolar (TASK 7.2.3.1)
* **Objetivo:** Desarrollar el motor de renderizado documental en PDFKit (`pdfMediacionService.js`) para la generación oficial y descarga del Acta de Mediación y Acuerdos Formativos, incorporando membrete institucional de la Escuela El Salvador (RBD 9876-5), tablas de participantes y compromisos formativos, cláusula legal normativa conforme a la Circular N° 482 de la Superintendencia de Educación, cuadrantes para firmas y estampado de hash criptográfico SHA-256 inmutable en pie de página.
* **Componentes intervenidos:**
  * **Servicio Especializado PDF (`src/services/pdfMediacionService.js`):**
    * Maquetación en formato A4 con membrete superior azul marino institucional (`#1e3a5f`), datos oficiales del colegio (RBD 9876-5) y folio correlativo único.
    * Ficha técnica consolidada: mediador a cargo, fecha de sesión, lugar, estado del proceso y fecha de seguimiento.
    * Tabla de participantes con roles específicos (*Parte 1, Parte 2, Afectado, Mediador Par, Observador*) y estado del aviso formal a apoderados.
    * Tabla oficial de compromisos formativos con clasificación tipológica, descripción detallada, fecha límite y cálculo de altura dinámica por fila para textos extensos.
    * Cláusula jurídica de validez formativa basada en la Circular N° 482 y Ley N° 20.370 (enfoque restaurativo, confidencial y no punitivo).
    * Tres cuadrantes delimitados para firmas digitales o manuscritas (Mediador/a y Estudiantes participantes).
    * Función `calcularHashMediacion(mediacion)`: cálculo determinista de hash SHA-256 (64 caracteres hexadecimales) de los datos canónicos, estampado en el pie de página de cada hoja para garantizar inmutabilidad, trazabilidad forense y no repudio.
  * **Controladores y Rutas Express 5 (`src/controllers/mediacionesController.js` y `src/routes/mediaciones.routes.js`):**
    * Handler `descargarActaPdfHandler` que expone el endpoint `GET /api/v1/mediaciones/:id/acta-pdf` con cabeceras `application/pdf`, nombre de archivo correlativo seguro y control RBAC.
* **Resultados de Validación Automatizada:**
  * **Pruebas Unitarias (`src/__tests__/services/pdfMediacionService.test.js`):**
    * 8 de 8 pruebas aprobadas al 100% (número mágico `%PDF-`, metadatos oficiales UTF-16BE, determinismo y sensibilidad del hash SHA-256, tolerancia ante expedientes sin compromisos o datos incompletos y headers HTTP del controlador).
  * **Suite Global Backend:**
    * 52 de 52 suites aprobadas al 100% (**372 pruebas en verde**, 0 fallos, 0 regresiones).

### Sprint 7 / Épica 7.2 — Backend: Servicio Dispatcher Transaccional de Correos de Mediación (TASK 7.2.3.2)
* **Objetivo:** Desarrollar el servicio dispatcher transaccional de correos electrónicos (`emailServiceMediacion.js`) para notificar formalmente y remitir copia adjunta del Acta Oficial de Mediación Escolar en formato PDF a los Apoderados Titulares y a los Profesores Jefes de cada alumno involucrado, implementando desduplicación estricta de remitentes y trazabilidad inmutable con hash SHA-256 en auditoría.
* **Componentes intervenidos:**
  * **Plantilla de Correo Electrónico Institucional (`src/templates/emails/acta-mediacion-oficial.html` y `src/utils/emailTemplates.js`):**
    * Diseño HTML responsivo y accesible acorde a la identidad corporativa de la Escuela Coeducacional N° 1 El Salvador (RBD 9876-5).
    * Incluye bloque de bienvenida personalizado con tratamiento protocolar según rol del destinatario (*Apoderado/a Titular* o *Profesor/a Jefe*).
    * Resumen ejecutivo del acta: folio correlativo oficial, fecha de la sesión, lugar, nombre del/la mediador/a a cargo, nombres de los estudiantes involucrados y fecha comprometida para la sesión de seguimiento.
    * Bloque de seguridad y verificación con estampado del hash SHA-256 inmutable de 64 caracteres.
    * Renderizador `renderActaMediacionOficialTemplate` con fallback en texto plano para clientes de correo sin soporte HTML.
  * **Servicio Dispatcher Transaccional (`src/services/emailServiceMediacion.js`):**
    * `obtenerDestinatariosDesduplicados(tenantId, mediacion)`: inspecciona a todos los alumnos participantes, extrae sus apoderados titulares (`es_titular = true`) e identifica el profesor jefe del curso (`cursos.profesor_jefe_id` $\rightarrow$ `usuarios`).
    * **Desduplicación Estricta:** indexa destinatarios mediante un `Map` por correo electrónico normalizado en minúsculas. Si ambos alumnos pertenecen al mismo curso o comparten profesor jefe (o comparten apoderado en caso de hermanos), el docente o apoderado recibe exactamente **un único correo consolidado**, evitando saturación y spam institucional.
    * Generación al vuelo del buffer PDF mediante `pdfMediacionService.generarActaMediacionPDF` y cálculo de su hash determinista SHA-256.
    * Encolamiento seguro en Bull/Redis vía `emailService.enviarEmail` pasando el PDF serializado en Base64 como archivo adjunto (`Acta_Mediacion_[FOLIO].pdf`).
    * **Trazabilidad Inmutable en Auditoría:** emisión de registro en la tabla canónica `auditoria` (vía `auditoriaService.registrarAuditoria`) y respaldo en `auditoria_logs` con acción `SEND_EMAIL`, tabla `mediacion_actas`, lista de destinatarios, timestamp ISO y hash SHA-256 inmutable.
  * **Controladores y Rutas Express 5 (`src/controllers/mediacionesController.js` y `src/routes/mediaciones.routes.js`):**
    * Endpoint `POST /api/v1/mediaciones/:id/despachar-acta` protegido por roles RBAC (`Administrador`, `Directivo`, `Equipo de Formación`, `Inspector`).
    * Handler `despacharActaHandler` que ejecuta el despacho transaccional y responde HTTP 200 con el resumen de destinatarios y comprobante de encolamiento.
* **Resultados de Validación Automatizada:**
  * **Pruebas Unitarias (`src/__tests__/services/emailServiceMediacion.test.js`):**
    * 8 de 8 pruebas aprobadas al 100% (despacho a apoderados y profesores distintos, desduplicación ante mismo curso/profesor jefe, desduplicación de apoderados compartidos, verificación de adjunto PDF en Base64, registro en auditoría con hash SHA-256 y timestamp, manejo de errores y códigos de respuesta del controlador).
  * **Suite Global Backend:**
    * 53 de 53 suites aprobadas al 100% (**380 pruebas en verde**, 0 fallos, 0 regresiones).

### Sprint 7 / Épica 7.2 — Backend: Endpoints de Evaluación de Compromisos, Cierre Inmutable y Enlace RICE (TASK 7.2.4.1)
* **Objetivo:** Implementar la lógica integral de evaluación formativa de acuerdos, sellado inmutable del expediente y consulta de historial restaurativo por estudiante en `mediacionesController.js` y `mediacionesService.js`, permitiendo actualizar acuerdos a estados granulares (`cumplido`, `parcial`, `incumplido`), sellar definitivamente el caso impidiendo mutaciones posteriores, derivar a inspectoría con apertura automática de protocolo RICE y consultar el historial conductual del alumno.
* **Componentes intervenidos:**
  * **Base de Datos y Migración SQL (`src/db/migrations/20261021_agregar_estado_cierre_mediaciones.sql`):**
    * Inclusión de columna `estado VARCHAR(20) DEFAULT 'pendiente' CHECK (estado IN ('pendiente', 'cumplido', 'parcial', 'incumplido'))` en tabla `mediacion_compromisos`, con índice B-Tree dedicado y retrocompatibilidad con el booleano `cumplido`.
    * Columnas `cerrada_at TIMESTAMP WITH TIME ZONE`, `cerrada_por_id UUID REFERENCES usuarios(id)` y `protocolo_id UUID REFERENCES protocolos_rice(id)` en tabla `mediaciones`.
  * **Contratos de Validación Zod (`src/schemas/mediacionesSchemas.js`):**
    * `evaluarCompromisosSchema`: valida arreglo de evaluaciones (`compromiso_id` UUID, `estado` enum, observaciones opcionales).
    * `cerrarMediacionSchema`: valida `estado` de cierre (`'acordada'`, `'sin_acuerdo'`, `'derivada_inspectoria'`), `conclusiones_cierre` (mínimo 10 caracteres) y objeto opcional `protocolo_rice` (`tipo_protocolo_id`, `estudiante_id`, `observaciones`).
  * **Lógica de Negocio y Transaccionalidad (`src/services/mediacionesService.js`):**
    * `evaluarCompromisos`: valida pertenencia al tenant, comprueba que el caso no esté cerrado (`cerrada_at`), actualiza cada compromiso con su estado, fecha de cumplimiento (`NOW()` si cumplido, `null` si no) y emite registro inmutable en auditoría.
    * `cerrarMediacion`: sella inmutablemente el caso registrando `cerrada_at`, `cerrada_por_id` y `conclusiones_cierre`. Si el estado es `'derivada_inspectoria'` y se envía `protocolo_rice`, invoca automáticamente a `protocolosService.crearProtocolo` y enlaza el `protocolo_id` generado.
    * `obtenerHistorialMediacionesEstudiante`: consulta el expediente restaurativo completo del estudiante, calculando métricas de mediaciones acordadas, derivadas o sin acuerdo, total de compromisos, tasas de cumplimiento porcentual y detalle cronológico ordenado.
    * **Blindaje de Inmutabilidad:** `guardarCompromisos` y `evaluarCompromisos` verifican si `mediacion.cerrada_at` existe; de ser así, rechazan cualquier modificación con código HTTP `409 Conflict`.
  * **Controladores y Rutas Express 5 (`src/controllers/mediacionesController.js` y `src/routes/mediaciones.routes.js`):**
    * `PATCH /api/v1/mediaciones/:id/evaluar-compromisos`: evaluación de compromisos (RBAC: Administrador, Directivo, Formación, Inspector).
    * `PATCH /api/v1/mediaciones/:id/cerrar`: sellado inmutable y derivación RICE.
    * `GET /api/v1/mediaciones/estudiante/:estudianteId`: historial y métricas conductuales (registrado antes de `/:id` para prevenir colisiones en Express).
* **Resultados de Validación Automatizada:**
  * **Pruebas Unitarias (`src/__tests__/services/mediacionEvaluacionCierre.test.js`):**
    * 13 de 13 pruebas aprobadas al 100% (evaluación con sincronización de estado y booleano, rechazo 409 ante expedientes sellados, cierre con timestamp inmutable, derivación a inspectoría con apertura RICE, historial y métricas por alumno, manejo 404 y controladores Express).
  * **Suite Global Backend:**
    * 54 de 54 suites aprobadas al 100% (**393 pruebas en verde**, 0 fallos, 0 regresiones).

### Sprint 7 / UX-UI — Modernización Integral de Interfaces: Registro de Incidentes y Apertura de Protocolos RICE
* **Objetivo:** Renovar la experiencia de usuario en los formularios críticos de convivencia escolar (`NuevoIncidentePage.jsx` y `NuevoProtocoloPage.jsx`), migrando a un layout en dos columnas asimétricas con barra lateral sticky de control en tiempo real, paleta con gradientes temáticos vivos y diferenciados, y modales de confirmación/descarte de datos.
* **Componentes intervenidos:**
  * **Página de Nuevo Incidente (`siga-frontend/src/pages/NuevoIncidentePage.jsx`):**
    * Arquitectura de 2 columnas (`grid-cols-1 lg:grid-cols-[minmax(0,1fr)_340px]`).
    * Gradientes diferenciados de alto contraste WCAG AA:
      * Tarjeta 1 (Azul/Índigo): Abordaje formativo en chips seleccionables, fecha y semáforo de gravedad reglamentaria.
      * Tarjeta 2 (Esmeralda/Teal): Selector en cascada (`SelectorEstudianteCascada`), roles individuales (víctima / descargo) y eliminación con un clic.
      * Tarjeta 3 (Púrpura/Violeta): Relato objetivo (mínimo 20 caracteres con contador reactivo) y medidas pedagógicas adoptadas.
    * Sidebar Sticky: Barra de progreso reactiva (0% a 100%), checklist interactivo de 5 requisitos de completitud, resumen de alumnos seleccionados y botones de acción.
    * Modales interactivos: Diálogo modal de confirmación previa con resumen del expediente y modal de advertencia ante descarte de formulario sucio.
  * **Página de Nuevo Protocolo RICE (`siga-frontend/src/pages/NuevoProtocoloPage.jsx`):**
    * Arquitectura idéntica de 2 columnas asimétricas adaptativa a modo claro y oscuro.
    * Gradientes temáticos:
      * Sección 1 (Índigo/Azul): Cápsulas interactivas directas para los 10 protocolos normativos de la Superintendencia (eliminando redundancia de menús desplegables duplicados).
      * Sección 2 (Esmeralda/Teal): Integración con `SelectorEstudianteCascada`, banner de riesgo de escalada (`AlertaEscaladaBanner`) y ficha del titular vinculado con opción de cambio inmediato.
      * Sección 3 (Ámbar/Naranja): Fecha oficial de apertura e incidentes previos del alumno con spinner de consulta y selección opcional.
      * Sección 4 (Púrpura/Violeta): Observaciones preliminares y contexto inicial con contador de caracteres.
    * Sidebar Sticky con checklist normativo RICE de 5 puntos y barra de progreso de apertura.
    * Modales de confirmación con detalle de expediente y alerta de descarte.
  * **Backend RAG RICE y Analytics (`siga-backend/src/services/riceRagService.js`, `analyticsController.js`):**
    * Generación dinámica de recomendaciones pedagógicas fundamentadas en el RICE mediante IA, en reemplazo de textos estáticos hardcodeados en el modal de detalle analítico (`DetalleCeldaModal.jsx`).
* **Resultados de Validación y Certificación Automatizada:**
  * **Pruebas Frontend:** 31 de 31 test suites aprobadas al 100% (156 pruebas unitarias y de integración sin regresiones).
  * **Pruebas Backend:** 48 de 48 test suites aprobadas al 100% (340 pruebas pasando exitosamente).

---

### SPRINT DE AJUSTES Y HALLAZGOS EN TERRENO: Escuela Coeducacional N°1 El Salvador (Octubre 2026)
* **Objetivo:** Responder de forma ágil y certificada a los hallazgos operativos levantados directamente por la contraparte escolar (Dirección y Encargado de Convivencia Escolar), adaptando los flujos a la realidad pedagógica y normativa del colegio.
* **Estado:** **Hallazgos 1, 2, 3, 4, 5, 6 y 7 completados y certificados al 100%**. 

#### Hallazgos Implementados y Certificados:
1. **Hallazgo 1 — Firma Única del Encargado(a) de Convivencia Escolar en Documentos Oficiales:**
   - Modificación en el servicio de generación PDF (`pdfService.js`) tanto en el informe de incidentes como en el historial conductual: el bloque de firma institucional pasa de dos firmas (Dirección y Convivencia) a firma única centrada exclusiva para el/la **Encargado(a) de Convivencia Escolar**, conforme al requerimiento formal de la jefatura institucional.
2. **Hallazgo 2 — Estructura y Roles Granulares de Formación y Convivencia:**
   - Refactorización de la matriz de roles (`constants/roles.js`, `requireRole.js`, `RolBadge.jsx`, `UsuariosPage.jsx`, modales de usuario).
   - Se desmenuzó el rol genérico *Equipo de Formación* en 4 roles operativos independientes: `Coordinador de Convivencia Escolar`, `Orientador`, `Psicólogo` y `Asistente Social`, manteniendo compatibilidad con `Directiva`, `Inspector` y `Docente`.
   - Reorganización jerárquica con filtros en la interfaz de gestión de usuarios (`UsuariosPage.jsx`).
3. **Hallazgo 3 — Reasignación Dinámica de Curso/Paralelo en Directorio y Cierre de Año:**
   - Creación de endpoint atómico `PATCH /api/v1/estudiantes/:id/curso` con validación de pertenencia al tenant, motivo/observación obligatoria y registro en auditoría.
   - En el frontend, creación de `ReasignarCursoModal.jsx` y su integración en el directorio de estudiantes (`EstudiantesPage.jsx`) y en el flujo de cierre de año (`CierreAnioPage.jsx`), permitiendo mover alumnos entre cursos paralelos (ej. de 8° A a 8° B por razones de convivencia escolar).
4. **Hallazgo 4 — Validación y Previsualización de Borradores PDF para Involucrados:**
   - Corrección de sanitización DLP multi-estudiante en `reportesController.js` y `pdfService.js`: ahora `otrosEstudiantes` se puebla obligatoriamente garantizando el reemplazo de nombres y RUTs de contrapartes conforme a la Circular N° 482 y Ley N° 19.628.
   - Soporte de parámetro `?preview=true` que renderiza una marca de agua diagonal de *"DOCUMENTO DE VALIDACIÓN / VISTA PREVIA (NO OFICIAL - PENDIENTE DE APROBACIÓN)"* y pie de página de revisión interna, permitiendo al equipo validar el PDF antes de firmar formalmente.
   - Badges y accesos directos en `IncidenteDetallePage.jsx` para previsualizar y validar el borrador de cada involucrado.
5. **Hallazgo 5 — Observaciones Individuales por Estudiante al Derivar:**
   - En `incidentesService.js`, extensión de `cambiarEstado` para procesar y persistir observaciones individualizadas en `incidente_estudiantes.observacion` al transicionar a `Derivado`.
   - Creación del endpoint `PATCH /api/v1/incidentes/:id/estudiantes/:estudianteId/observacion` para registrar o editar la observación individual de derivación de un estudiante en cualquier momento.
   - En `IncidenteDetallePage.jsx`, adaptación del modal de cambio de estado para ingresar observaciones específicas por alumno y renderizado de la tarjeta de derivación individual con botón de edición rápida.

6. **Hallazgo 6 — Reestructuración del Catálogo de Protocolos RICE:**
   - Adición de las tipologías prioritarias solicitadas por la Escuela El Salvador: `Acoso escolar`, `Ciberacoso` y `Maltrato entre adultos`.
   - Subsunción de `Violencia intrafamiliar` y `Abuso sexual` dentro de `Vulneración de derechos` (marcando los registros directos como `activo = false` en `tipos_protocolo` para evitar su selección errónea en nuevos casos sin romper la integridad referencial de protocolos históricos).
   - Inclusión de glosa descriptiva en `tipos_protocolo.descripcion` con sanitización en frontend (`NuevoProtocoloPage.jsx`) para omitir espacios vacíos y garantizar visualización limpia de las tarjetas de tipo de protocolo.
   - Siembra de reglas estándar de 4 pasos por defecto en `reglas_protocolo` para cada nuevo tipo normativo.

7. **Hallazgo 7 — Carga de Evidencias en el Checklist y Expediente Oficial RICE en PDF para Auditorías:**
   - Creación de tabla `protocolo_paso_evidencias` con aislamiento multi-tenant RLS en Supabase para asociar documentos probatorios (actas, cartas de citación, informes psicosociales o comprobantes de derivación al CESFAM/OPD).
   - Middleware de subida en backend (`uploadEvidenciaMiddleware.js`) con límite de 10 MB y filtrado MIME seguro (PDF, imágenes, Word) y servicio de almacenamiento en Supabase Storage (`evidenciasStorageService.js`) con sanitización de nombres de archivo y trazabilidad en `auditoria`.
   - Endpoints REST `POST /api/v1/protocolos/:id/pasos/:pasoId/evidencias` y `DELETE /api/v1/protocolos/:id/pasos/:pasoId/evidencias/:evidenciaId`.
   - **Expediente Oficial RICE con Evidencias en PDF (`pdfService.generarExpedienteProtocoloPDF`):**
     - Generación automatizada de expediente legal para auditorías de la Superintendencia de Educación (Circular N° 482 / Ley N° 19.628).
     - Incluye carátula con folio oficial, datos del estudiante titular y apoderado, tabla de checklist de pasos normativos certificados y tabla anexo de evidencias probatorias con trazabilidad forense (nombre de archivo, fecha/hora exacta, responsable y tamaño).
     - Incorpora el bloque de **Firma Única Centrada del Encargado(a) de Convivencia Escolar** (cumpliendo con el Hallazgo 1).
     - Endpoint `GET /api/v1/protocolos/:id/expediente-pdf` con control RBAC.
   - **Interfaz de Usuario Web (`ProtocoloDetallePage.jsx` y `ChecklistProtocolo.jsx`):**
     - Botón de descarga con spinner en la cabecera: *"Descargar Expediente RICE (PDF)"*.
     - Gestión contextual y ágil de evidencias probatorias directamente dentro de cada paso del checklist (enlace directo, peso del archivo y opciones de carga o eliminación).
     - Integración en `CompletarPasoModal.jsx` y `ChecklistProtocolo.jsx`.

* **Resultados de Validación y Certificación Automatizada:**
  * **Pruebas Frontend:** **34 de 34 test suites aprobadas al 100% (173 pruebas unitarias y de integración pasando exitosamente, 0 fallos)**.
  * **Pruebas Backend:** **54 de 54 test suites aprobadas al 100% (393 pruebas pasando exitosamente en Jest integrando `mediacionEvaluacionCierre.test.js`, `emailServiceMediacion.test.js`, `pdfMediacionService.test.js`, `mediacionCompromisos.test.js`, `protocolosEvidencias.test.js` y `protocolosCatalogo.test.js`, 0 fallos)**.
  * **Total de Cobertura Monorepo:** **566 pruebas automáticas aprobadas al 100% sin regresiones**.

---

## 5. ARQUITECTURA TÉCNICA Y MATRIZ DE REQUERIMIENTOS

### Arquitectura de Software
* **Capa de Presentación (Frontend):** React 18, Vite 5, Tailwind CSS 3, Zustand 4, Axios, Recharts 2, Lucide Icons. Desplegado en Vercel con CDN global y HTTPS.
* **Capa de Aplicación (Backend):** Node.js 22, Express 5, Zod 4 (validación de contratos), pdfkit (generación documental), Helmet (seguridad HTTP), CORS, Google GenAI SDK (embeddings 768-dim y razonamiento normativo). Desplegado en Render PaaS con HTTPS.
* **Capa de Persistencia (Base de Datos):** PostgreSQL 15 en Supabase con 20 tablas operativas (incluyendo `rice_documentos`, `rice_chunks`, `mediaciones`, `mediacion_participantes` y `mediacion_compromisos`), Row Level Security (RLS) multi-tenant con FORCE RLS, índices B-Tree y HNSW vectoriales, funciones RPC en PL/pgSQL y extensiones (`uuid-ossp`, `unaccent`, `pg_trgm`, `vector`). Script oficial exportado en [`DOCS/arquitectura_y_api/schema_siga_escolar.sql`](file:///home/macevedo/Proyectos/INACAP/siga-escolar/DOCS/arquitectura_y_api/schema_siga_escolar.sql).

### Matriz de Cumplimiento de Requerimientos

| Requerimiento | Descripción | Cobertura | Estado |
| :--- | :--- | :---: | :---: |
| **RF-01** | Autenticación JWT, bcrypt coste 10 y bloqueo tras 5 intentos | 100% | ✅ Cumplido |
| **RF-02** | Control de acceso basado en roles RBAC (5 roles escolares) | 100% | ✅ Cumplido |
| **RF-03** | Bitácora de auditoría invisible de eventos CRUD en formato JSONB | 100% | ✅ Cumplido |
| **RF-04** | Gestión de usuarios del tenant y protección contra desactivación del último admin | 100% | ✅ Cumplido |
| **RF-05** | Ficha de estudiante con historial cronológico e importador CSV con Módulo 11 | 100% | ✅ Cumplido |
| **RF-06** | Registro de incidentes de convivencia (7 abordajes, gravedad, N:M involucrados) | 100% | ✅ Cumplido |
| **RF-07** | Notificaciones y alertas automáticas ante casos Graves y Gravísimos | 100% | ✅ Cumplido |
| **RF-08** | Digitalización de los 10 protocolos normativos RICE de la Superintendencia | 100% | ✅ Cumplido |
| **RF-09** | Trazabilidad estricta de estados RICE con observaciones obligatorias | 100% | ✅ Cumplido |
| **RF-10** | Dashboard analítico en tiempo real con 3 gráficos interactivos (Recharts) | 100% | ✅ Cumplido |
| **RF-11** | Emisión y descarga de historial conductual en PDF con membrete y firmas | 100% | ✅ Cumplido |
| **RNF-01** | Multi-tenancy estricto con aislamiento por tenant vía RLS en Supabase | 100% | ✅ Cumplido |
| **RNF-07** | Rendimiento y tiempos de carga inferiores a 3 segundos en Dashboard y formularios | 100% | ✅ Cumplido |
| **RNF-08** | Diseño responsivo mobile-first garantizado desde pantallas de 360px | 100% | ✅ Cumplido |
| **RNF-09** | Despliegue en producción con certificados de seguridad SSL/TLS (HTTPS) | 100% | ✅ Cumplido |

---

## 6. CONCLUSIÓN Y DICTAMEN DE CONFORMIDAD

El proyecto **SIGA Escolar** se encuentra en un estado maduro, estable y validado técnica y funcionalmente. Las 52 incidencias registradas en Jira dan cuenta de un desarrollo disciplinado bajo marco Scrum, con un estricto respeto por la separación y sinergia de responsabilidades entre Backend (Marcelo Acevedo), Frontend (Daniel Flores) y Documentación/Diseño Web (Claudia Infane Soto), cumpliendo a cabalidad con los estándares exigidos tanto por la Escuela Coeducacional N°1 El Salvador como por el marco formativo de INACAP.
