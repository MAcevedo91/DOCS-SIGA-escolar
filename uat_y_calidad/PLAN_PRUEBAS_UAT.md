# SIGA Escolar — Plan de Pruebas UAT y Definition of Done (DoD)

**Proyecto:** Sistema Integral de Gestión y Acompañamiento Escolar (SIGA Escolar)  
**Cliente / Beneficiario:** Escuela Coeducacional N°1 El Salvador  
**Equipo de Desarrollo:**
- Marcelo Acevedo Silva (Líder de Desarrollo Backend / Gestión de Proyecto)
- Daniel Flores Jaime (Líder de Desarrollo Frontend / Diseño UI/UX)

---

## 1. Definition of Done (DoD)

El **Definition of Done** es el conjunto de criterios obligatorios que toda tarea, historia de usuario y sprint debe satisfacer para garantizar la calidad, seguridad y estabilidad de la plataforma antes de ser marcada como LISTO o desplegada a producción.

### 1.1 DoD a Nivel de Tarea Técnica
- [ ] **Control de versiones:** Código committeado en la rama de desarrollo correspondiente (`develop`) con convención de mensajes semánticos (`feat:`, `fix:`, `refactor:`, `test:`, `docs:`).
- [ ] **Revisión de pares (Code Review):** Pull Request creado y aprobado por el contraparte técnico antes de la integración a la rama principal.
- [ ] **Higiene de código:** Sin errores en la consola del navegador ni del servidor. Ausencia total de `console.log` de depuración y warnings críticos de linter/build.
- [ ] **Gestión de secretos y variables de entorno:** Sin credenciales ni claves de API en duro (hardcoded). Todas las variables sensibles administradas mediante `.env` y excluidas del control de versiones.
- [ ] **Seguridad y privacidad:**
  - Los endpoints de usuarios y autenticación jamás deben exponer contraseñas, hashes ni datos sensibles en respuestas JSON.
  - Endpoints protegidos mediante middlewares de autenticación JWT (`authenticateToken`) y control de acceso basado en roles (`requireRole`).
  - Validación de esquemas de entrada estricta con Zod en controladores de backend.
  - Sanitización contra XSS e inyecciones SQL.
- [ ] **Persistencia y datos:**
  - Todas las consultas SQL implementan aislamiento multi-inquilino (`tenant_id` obligatorio).
  - Operaciones multi-tabla implementadas mediante transacciones atómicas con rollback automático ante fallos.
- [ ] **Pruebas y verificación:**
  - Happy path validado con pruebas unitarias/integración o colección Insomnia/Postman.
  - Casos de borde y error verificados (400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found).

### 1.2 DoD a Nivel de Historia de Usuario (HU)
- [ ] Todas las subtareas técnicas e ítems de desarrollo se encuentran en estado LISTO / DONE.
- [ ] Criterios de aceptación verificados de extremo a extremo (E2E) con frontend y backend comunicándose exitosamente.
- [ ] Funcionalidad desplegada y verificada en el entorno de staging / producción.
- [ ] Retrocompatibilidad de base de datos garantizada (migraciones aplicadas en Supabase sin regresión de datos históricos).

### 1.3 DoD a Nivel de Sprint
- [ ] 100% de las historias de usuario comprometidas para el ciclo validadas y operativas.
- [ ] Integración continua exitosa: merge de `develop` a `main` sin conflictos.
- [ ] Despliegues automáticos completados en Render (Backend) y Vercel (Frontend).
- [ ] Ejecución de la suite completa de pruebas automatizadas con 0 regresiones.
- [ ] Realización y documentación de la retrospectiva del sprint.

### 1.4 DoD de Cierre y Entrega Final
- [ ] URLs productivas operativas bajo HTTPS con certificados SSL válidos sin alertas de seguridad.
- [ ] Rendimiento verificado: tiempo de carga de dashboards y vistas principales inferior a 3 segundos (RNF-07).
- [ ] Generación y descarga de reportes PDF con membrete institucional, firmas y contenido fidedigno (RF-11).
- [ ] Base de datos poblada con nóminas y datos reales del establecimiento escolar.
- [ ] Pruebas UAT ejecutadas y aprobadas formalmente por el cliente con Acta de Conformidad firmada.

---

## 2. Plan de Pruebas UAT (User Acceptance Testing)

Las pruebas UAT son evaluaciones de caja negra ejecutadas directamente por los usuarios clave (Coordinador de Convivencia Escolar, Inspectores, Directivos) para certificar que la plataforma resuelve las problemáticas operativas y cumple los requerimientos acordados.

### 2.1 Entorno de Pruebas y Parámetros Operativos

| Parámetro | Valor / Enlace |
|---|---|
| **Frontend Web** | `https://siga-frontend-delta-six.vercel.app` |
| **Backend API** | `https://siga-backend.onrender.com` |
| **Establecimiento** | Escuela Coeducacional N°1 El Salvador |
| **Población Estudiantil** | 483 estudiantes matriculados |
| **Coordinador UAT** | Marcelo Acevedo Silva (Líder Backend/PM) |
| **Evaluador Cliente** | Coordinador de Convivencia Escolar / Equipo Directivo |

### 2.2 Credenciales de Prueba Controladas

| Perfil / Rol | Correo Electrónico | Contraseña Temporal | Propósito de Prueba |
|---|---|---|---|
| **Administrador** | `admin@sigaescolar.cl` | `Admin1234!` | Acceso total, gestión de usuarios e importación |
| **Inspector** | `inspector@sigaescolar.cl` | `Inspector1234!` | Registro de incidentes y control de patio |
| **Docente** | `docente@sigaescolar.cl` | `Docente1234!` | Consulta académica y reporte de aula |

> ⚠️ **Nota de Seguridad:** Al concluir la sesión de pruebas UAT, todas las contraseñas temporales deben ser rotadas inmediatamente desde el panel de administración.

---

## 3. Matriz de Casos de Prueba UAT

### CP-01: Autenticación e Inicio de Sesión
- **Objetivo:** Validar que el sistema permite el acceso seguro con credenciales válidas y bloquea accesos no autorizados.
- **Precondición:** Usuario registrado en base de datos.
- **Pasos:**
  1. Acceder a la URL del frontend.
  2. Ingresar el correo `admin@sigaescolar.cl` y la contraseña `Admin1234!`.
  3. Presionar el botón "Acceder".
- **Resultado Esperado:** Redirección inmediata al Dashboard principal mostrando el nombre del usuario y su rol.
- **Severidad en caso de falla:** **Bloqueante**.

### CP-02: Control de Acceso Basado en Roles (RBAC)
- **Objetivo:** Verificar que cada rol visualiza y accede únicamente a las opciones autorizadas según la matriz de permisos.
- **Precondición:** Cuentas con roles Administrador, Inspector y Docente disponibles.
- **Pasos:**
  1. Iniciar sesión como Administrador y verificar acceso al módulo "Gestión de Usuarios".
  2. Iniciar sesión como Inspector y constatar que el módulo "Gestión de Usuarios" no se muestra en el menú lateral.
  3. Intentar acceder directamente mediante la URL `/usuarios` como Inspector o Docente.
- **Resultado Esperado:** El sistema bloquea el acceso directo y muestra una pantalla o mensaje de "Acceso No Autorizado" (403 Forbidden).
- **Severidad en caso de falla:** **Bloqueante**.

### CP-03: Visualización del Dashboard Analítico
- **Objetivo:** Constatar que el equipo directivo puede monitorear métricas clave e indicadores de convivencia escolar.
- **Precondición:** Incidentes registrados con diversas gravedades en el sistema.
- **Pasos:**
  1. Ingresar al sistema con perfil Administrador o Directivo.
  2. Observar las tarjetas resumen (total incidentes, protocolos abiertos, alertas activas).
  3. Verificar la carga de gráficos de distribución por gravedad y por curso.
- **Resultado Esperado:** El dashboard carga en menos de 3 segundos, reflejando estadísticas actualizadas y coherentes con los datos del colegio.
- **Severidad en caso de falla:** **Mayor**.

### CP-04: Búsqueda y Perfil del Estudiante
- **Objetivo:** Validar la localización ágil de estudiantes y la consulta de su expediente conductual.
- **Precondición:** Nómina de estudiantes cargada en el sistema.
- **Pasos:**
  1. Navegar a "Directorio de Estudiantes".
  2. Ingresar en la barra de búsqueda el apellido de un alumno sin utilizar tildes (ejemplo: "Perez" o "Gonzalez").
  3. Seleccionar al estudiante de la lista de resultados para abrir su ficha.
- **Resultado Esperado:** La búsqueda insensible a mayúsculas y acentos (`unaccent`) ubica al estudiante instantáneamente. Su expediente despliega antecedentes personales, curso y línea de tiempo de incidentes.
- **Severidad en caso de falla:** **Bloqueante**.

### CP-05: Registro de Incidente de Convivencia
- **Objetivo:** Comprobar el flujo integral de reporte de un incidente grave o gravísimo con sus medidas asociadas.
- **Precondición:** Usuario Inspector o Administrador autenticado.
- **Pasos:**
  1. Ingresar a "Registro de Incidentes" -> "Nuevo Incidente".
  2. Seleccionar tipo de abordaje (Entrevista / Mediación / Citación), fecha actual y gravedad **Grave** o **Gravísima**.
  3. Buscar e incorporar a uno o más estudiantes participantes.
  4. Redactar el relato de los hechos (mínimo 20 caracteres) y consignar las medidas pedagógicas adoptadas.
  5. Guardar el registro.
- **Resultado Esperado:** El incidente se almacena en base de datos, se despliega alerta visual de alta prioridad y se genera la notificación correspondiente para el Coordinador.
- **Severidad en caso de falla:** **Bloqueante**.

### CP-06: Trazabilidad y Transición de Estados del Incidente
- **Objetivo:** Validar que el flujo de vida del incidente respete las reglas de transición sin permitir inconsistencias temporales.
- **Precondición:** Incidente en estado `En Investigación`.
- **Pasos:**
  1. Abrir el detalle del incidente registrado.
  2. Seleccionar "Cambiar Estado" y promover a `Derivado`.
  3. Confirmar que el estado visual y en backend se actualiza.
  4. Intentar retroceder manualmente a `En Investigación`.
  5. Cambiar a estado `Cerrado` registrando el dictamen final.
- **Resultado Esperado:** La máquina de estados permite avanzar ordenadamente (`En Investigación` -> `Derivado` -> `Cerrado`) y rechaza retrocesos indebidos.
- **Severidad en caso de falla:** **Mayor**.

### CP-07: Apertura y Gestión de Protocolo Normativo RICE
- **Objetivo:** Verificar la activación y seguimiento de protocolos oficiales según normativa del Mineduc (Superintendencia de Educación).
- **Precondición:** Incidente previo registrado; usuario Coordinador autenticado.
- **Pasos:**
  1. Ingresar a "Protocolos RICE" -> "Nuevo Protocolo".
  2. Escoger tipología (ej. Maltrato entre estudiantes, Vulneración de derechos, Acoso cibernético).
  3. Asociar al estudiante y vincular con el incidente correspondiente.
  4. Registrar fecha de inicio y observaciones preliminares.
  5. Guardar y verificar la asignación de plazos máximos normativos.
- **Resultado Esperado:** El protocolo queda abierto y vinculado a la historia del alumno con cálculo visible de días restantes para resolución.
- **Severidad en caso de falla:** **Bloqueante**.

### CP-08: Emisión y Descarga de Historial en PDF
- **Objetivo:** Validar la exportación del informe conductual con estándares formales para entrevistas de apoderados o citaciones.
- **Precondición:** Alumno con al menos un incidente registrado.
- **Pasos:**
  1. Abrir el perfil del estudiante en el sistema.
  2. Pulsar la opción "Descargar Historial PDF".
  3. Abrir el documento descargado.
- **Resultado Esperado:** El documento PDF presenta membrete oficial de la Escuela Coeducacional N°1 El Salvador, datos identificatorios completos, detalle cronológico de incidentes/medidas y casillas formales para firma de apoderado y directivo.
- **Severidad en caso de falla:** **Mayor**.

### CP-09: Importación Masiva de Nómina Escolar
- **Objetivo:** Confirmar que el establecimiento puede actualizar nóminas de cursos mediante archivo estructurado CSV/Excel.
- **Precondición:** Archivo CSV normalizado con columnas requeridas (RUT, Nombres, Apellidos, Curso, Fecha Nacimiento).
- **Pasos:**
  1. Ingresar con rol Administrador a "Estudiantes" -> "Importación Masiva".
  2. Cargar el archivo de prueba.
  3. Ejecutar la carga y revisar el resumen de procesamiento.
- **Resultado Esperado:** La plataforma procesa los registros sin duplicar RUTs, reporta estadísticas (insertados, actualizados, fallidos) y los nuevos estudiantes quedan inmediatamente disponibles para búsqueda.
- **Severidad en caso de falla:** **Mayor**.

### CP-10: Cierre de Sesión e Invalidación de Token
- **Objetivo:** Asegurar que la sesión del usuario sea terminada de forma segura impidiendo navegación residual.
- **Precondición:** Sesión activa en el sistema.
- **Pasos:**
  1. Abrir el menú de perfil de usuario y hacer clic en "Cerrar Sesión".
  2. Constatar la redirección al login.
  3. Intentar volver atrás con el botón del navegador o acceder directamente a `/dashboard`.
- **Resultado Esperado:** Los tokens en almacenamiento local/cookies son destruidos; cualquier intento de acceso posterior es redirigido inmediatamente a `/login`.
- **Severidad en caso de falla:** **Menor**.

---

## 4. Clasificación de Severidad y Criterios de Aprobación

### 4.1 Categorización de Hallazgos

| Nivel de Severidad | Definición Operativa | Protocolo de Acción |
|---|---|---|
| **Bloqueante (Crítica)** | Imposibilita el cumplimiento de un flujo central del sistema (ej. inicio de sesión, guardar incidente, abrir protocolo). | Detiene la certificación. Debe subsanarse de inmediato antes de firmar el acta. |
| **Mayor** | Comportamiento anómalo o cálculo incorrecto que cuenta con un procedimiento de mitigación temporal. | Se programa para resolución inmediata en hotfix prioritario post-UAT. |
| **Menor** | Discrepancia cosmética, de espaciado o redacción que no compromete datos ni operatividad. | Se cataloga en el backlog de mejoras de interfaz. |

### 4.2 Criterio Formal de Aprobación
El UAT se dictaminará formalmente como **APROBADO** si se cumplen simultáneamente las siguientes condiciones:
1. El **100% de los casos de prueba clasificados como Bloqueantes** (CP-01, CP-02, CP-04, CP-05, CP-07) resultan aprobados exitosamente.
2. Al menos **9 de los 10 casos de prueba totales** resultan aprobados.
3. No existe riesgo de filtración de datos sensibles ni inconsistencias en la base de datos de producción.

---

## 5. Checklist de Cierre Técnico y Calidad

### Aseguramiento Técnico
- [ ] Código fuente en rama `main` de backend y frontend sincronizado y libre de cambios pendientes.
- [ ] Variables de entorno en Render y Vercel debidamente aprovisionadas sin credenciales maestras expuestas.
- [ ] Certificados TLS/SSL activos con protocolo HTTPS forzado en todas las rutas.
- [ ] Base de datos Supabase con extensión `unaccent` activada e índices optimizados en tablas críticas (`incidentes`, `estudiantes`, `protocolos_rice`).
- [ ] Políticas RLS (Row Level Security) activas para garantizar estricto aislamiento entre colegios.

### Documentación de Entrega
- [ ] Documentación de API (`DOCS/arquitectura_y_api/api-contract.md`) actualizada con respuestas y códigos HTTP.
- [ ] Diagrama y modelo de datos relacional (`DOCS/arquitectura_y_api/model-er.png` y `DOCS/schema_siga_escolar.sql`) sincronizados con producción.
- [ ] Registro de versiones de API (`DOCS/arquitectura_y_api/API_VERSIONING.md`).
- [ ] Historial de Sprints e Historias de Usuario consolidadas (`DOCS/sprints/SPRINTS_CONSOLIDADOS.md`).

---

## 6. Acta de Recepción y Conformidad del Cliente

En ___________________, a _____ de _________________ de 2026, el representante institucional del establecimiento educacional certifica haber participado en la jornada de pruebas de aceptación UAT del Sistema de Gestión y Acompañamiento Escolar (SIGA Escolar):

- **Establecimiento:** Escuela Coeducacional N°1 El Salvador
- **Evaluador Responsable:** ____________________________________________________
- **Cargo Institucional:** ____________________________________________________
- **Dictamen General:** [ &nbsp; ] Aprobado Conforme &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ &nbsp; ] Aprobado con Observaciones Menores &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ &nbsp; ] Rechazado

**Observaciones del Cliente:**
____________________________________________________________________________________________________
____________________________________________________________________________________________________

**Firma Representante Cliente:** ___________________________________  
**Firma Responsable Técnico SIGA:** ___________________________________
