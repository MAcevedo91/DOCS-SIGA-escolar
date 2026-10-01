# GUÍA MAESTRA PARA PRESENTACIÓN DE DEFENSA (10 MINUTOS)
## Proyecto: SIGA Escolar — Sistema de Gestión y Acompañamiento Escolar
### Cliente: Escuela Coeducacional N°1 El Salvador (Atacama, Chile) | Institución: INACAP

---

## ⏱️ DISTRIBUCIÓN DEL TIEMPO (10 MINUTOS CRONOMETRADOS)

* **Minuto 0:00 - 1:00 (1 min):** Sección 1 — Resumen General del Proyecto y Equipo.
* **Minuto 1:00 - 2:30 (1.5 min):** Secciones 2 y 3 — Stakeholders, Entrevistas y Levantamiento de Requerimientos.
* **Minuto 2:30 - 4:00 (1.5 min):** Secciones 4 y 5 — Planificación (Carta Gantt) y Desglose EDT/WBS.
* **Minuto 4:00 - 5:30 (1.5 min):** Sección 6 — Requerimientos (RF/RNF), Historias de Usuario (Jira) y Trazabilidad.
* **Minuto 5:30 - 7:30 (2 min):** Secciones 7 y 8 — Organización Documental y Evidencia Técnica en Vivo (Demo/Commits).
* **Minuto 7:30 - 9:00 (1.5 min):** Secciones 9 y 10 — Riesgos, Soluciones Aplicadas y Anexos Obligatorios.
* **Minuto 9:00 - 10:00 (1 min):** Sección 11 — Próximos Pasos, Hitos Futuros y Cierre Profesional.

---

## ESTRUCTURA DE LAS 11 SECCIONES OBLIGATORIAS

### SECCIÓN 1: RESUMEN GENERAL DEL PROYECTO (Minuto 0:00 - 1:00)
* **Nombre del Proyecto:** SIGA Escolar (Sistema de Gestión y Acompañamiento Escolar).
* **Organización Cliente:** Escuela Coeducacional N°1 El Salvador (Campamento Minero El Salvador, Comuna de Diego de Almagro, Región de Atacama). Dependiente del **SLEP Atacama** (Servicio Local de Educación Pública).
* **Población Objetivo:** 483 estudiantes matriculados (Prekínder a 8° Básico / Media), 2 jornadas lectivas.
* **Integrantes del Equipo:**
  1. **Marcelo Andrés Acevedo Silva:** Líder de Proyecto / Arquitecto de Software, Backend (Node.js/Express) y Base de Datos (PostgreSQL/Supabase).
  2. **Daniel Flores Jaime:** Encargado de Frontend (React 18, Vite, Tailwind CSS, Zustand) y Diseño UI/UX Mobile-First.
  3. **Claudia Infante Soto:** Encargada de Calidad (QA), Pruebas UAT, Documentación Técnica y Diseño Web.
* **Estado Actual de Avance (%):**
  * **Fase de Formulación y Especificación IEEE 830:** **100% completada** y aprobada.
  * **Sprints 1 al 5 (Scrum / Jira):** **100% completados y cerrados** (171 Story Points certificados: Infraestructura, RICE, 483 alumnos, Dashboard, Reglas y Cursos).
  * **Sprint 6 (En Ejecución — 28 sep al 08 oct 2026 | 28 SP):** **64% de avance del sprint (18 de 28 SP)**. **100% del Backend completado y certificado en terreno por Marcelo Acevedo** (DDL, DLP, orquestador Gemini Flash, PDFKit y Email con PDF adjunto; 41/41 tests aprobados). Restan 10 SP de vistas React a cargo de Daniel Flores.
  * **Avance Global del Proyecto:** **~95% de avance consolidado**, con base de datos en Supabase, backend y frontend en Staging/Producción.

---

### SECCIÓN 2: EVIDENCIA DE REUNIONES CON STAKEHOLDERS (Minuto 1:00 - 1:45)
* **Stakeholders Principales:**
  * **Sponsor / Representante Legal:** *Rodrigo Pacheco Contreras* (Director del Establecimiento).
  * **SME (Subject Matter Expert) / Contraparte Técnica:** *Roberto Eduardo Miranda Vivanco* (Coordinador de Convivencia Escolar).
* **Evidencias Obligatorias a Mostrar en Pantalla:**
  1. **Carpeta física y digital:** `DOCS/requerimientos/fuentes_originales/`
  2. **Documento 1:** `Entrevista de requerimientos Roberto Miranda.docx` (Fecha: Mayo 2026). Diagnóstico en terreno, identificación de los 483 alumnos y levantamiento del dolor de los ~30 incidentes semanales en papel.
  3. **Documento 2:** `Toma de requerimientos 2.docx` (Fecha: Junio 2026). Validación de la Bandeja Matutina Inteligente, formato de actas PDF con firmas oficiales y plazos de la Superintendencia.
  4. **Documento 3:** `Consulta de Definición Operativa.docx` (Fecha: Septiembre 2026). Ajustes de tipología RICE, validación de la anonimización DLP para IA y roles de inspectores de patio.
  5. **Comunicaciones:** Respaldos de correos institucionales, minutas de acuerdos vía Teams/Meet y chats de coordinación operativa para el traspaso de la nómina CSV.

---

### SECCIÓN 3: LEVANTAMIENTO DE REQUERIMIENTOS (Minuto 1:45 - 2:30)
* **Técnicas de Levantamiento Empleadas:**
  * **Entrevistas semiestructuradas en profundidad:** Con el Coordinador de Convivencia (Roberto Miranda).
  * **Observación directa en terreno:** Análisis del flujo de patio de los inspectores (cuaderno borrador vs transcripción a Word).
  * **Análisis documental normativo:** Estudio del RICE oficial de la escuela y la **Resolución Exenta N° 781 de la Superintendencia de Educación**.
* **Síntesis del Problema Diagnosticado (El "As-Is"):**
  * Descentralización en cuadernos y hojas sueltas; 20 minutos por acta; 40% de casos leves no detectados como patrones de bullying; riesgo de multas de hasta **1.000 UTM** por vencimiento de plazos legales.
* **Documento Clave a Proyectar:**
  * `DOCS/requerimientos/fuentes_originales/SINTESIS_REQUERIMIENTOS.md` (Mapeo directo de la entrevista en terreno a los capítulos IEEE 830 del informe).

---

### SECCIÓN 4: CARTA GANTT Y CRONOGRAMA BASE (Minuto 2:30 - 3:15)
* **Línea Base del Cronograma:**
  * **Línea Base Inicial del MVP (5 semanas | 06/06 al 10/07/2026):** Construcción, pruebas y puesta en marcha del núcleo del sistema (Sprints 1, 2 y 3).
  * **Fase Evolutiva y Sprint Actual (Julio a Octubre 2026):**
    * *Sprint 4 (02/07 – 09/07):* Motor de reglas y scoring de riesgo preventivo. ✅
    * *Sprint 5 (08/09 – 09/09):* Checklist RICE estricto, PIE y Cursos en cascada. ✅
    * *Sprint 6 (28/09 – 08/10):* Asistente de redacción IA con Gemini Flash, DLP, PDFKit y Email al apoderado. 🟡 (En Ejecución).
* **Métricas de Control de Cronograma (EVM - Earned Value Management):**
  * **SPI (Schedule Performance Index):** $\text{SPI} = \frac{\text{EV}}{\text{PV}} = \mathbf{1.0}$ (El avance real coincide estrictamente con la planificación; el backend del Sprint 6 terminó antes de la fecha límite).
  * **Hitos de Control Cumplidos y en Curso:**
    * **H-01:** Kickoff y diagnóstico en terreno (Completado).
    * **H-02:** Congelamiento de SRS IEEE 830 + EDT (Completado).
    * **H-03:** Base de datos multi-tenant y Auth JWT (Sprint 1 - Completado).
    * **H-04:** Registro de incidentes e importación de 483 alumnos (Sprint 2 - Completado).
    * **H-05:** Certificación UAT y Go-Live del MVP (Sprint 3 - Completado).
    * **H-06:** Prevención, Checklist RICE y PIE (Sprints 4 y 5 - Completado).
    * **H-07:** Asistente IA, DLP y Emisión Oficial PDF/Email (Sprint 6 - Backend 100% completado, Frontend en integración).
* **Evidencia a Mostrar:** Sección 6.2 de la Formulación y la tabla de Sprints de `DOCS/INFORME_EJECUCION_Y_AVANCE_PROYECTO.md`.

---

### SECCIÓN 5: ESTRUCTURA DE DESGLOSE DEL TRABAJO (EDT / WBS) (Minuto 3:15 - 4:00)
* **Nivel 1:** Proyecto SIGA Escolar.
* **Nivel 2 (5 Fases Principales):**
  * **1.0 Gestión del Proyecto:** Project Charter, Plan de Proyecto, Cronograma Gantt y Gestión de Riesgos. [TERMINADO]
  * **2.0 Análisis y Diseño:** Levantamiento con SME, SRS IEEE 830, Modelo ER, Arquitectura Multi-Tenant y Wireframes UI. [TERMINADO]
  * **3.0 Construcción y Desarrollo (Sprints Scrum):**
    * 3.1 Módulo Core & Autenticación RBAC / JWT (Sprint 1). [TERMINADO]
    * 3.2 Módulo Alumnos e Importador CSV/Excel 483 estudiantes (Sprint 2). [TERMINADO]
    * 3.3 Módulo Registro de Incidentes & Alertas Graves (Sprint 2). [TERMINADO]
    * 3.4 Módulo Protocolos RICE normativos y Kanban (Sprint 2). [TERMINADO]
    * 3.5 Módulo Reportería PDF & Dashboard Estadístico (Sprint 3). [TERMINADO]
    * 3.6 Motor de Reglas, Semáforo <48h y Scoring de Riesgo (Sprint 4). [TERMINADO]
    * 3.7 Checklist RICE, PIE y Cursos en Cascada (Sprint 5). [TERMINADO]
    * 3.8 Asistente IA Gemini Flash, DLP, PDFKit y Email Apoderado (Sprint 6). [BACKEND 100% TERMINADO (18 SP) / FRONTEND EN EJECUCIÓN (10 SP)]
  * **4.0 Aseguramiento de Calidad y Testing:** Pruebas unitarias Jest (188/188 pasando en backend), Pruebas de integración, Validación RLS y Pruebas UAT (CP-01 a CP-10). [TERMINADO]
  * **5.0 Despliegue y Cierre:** Despliegue PaaS en Render/Vercel, Manual de Usuario, Capacitación y Firma de Acta UAT. [EN PROCESO / CIERRE FINAL]

---

### SECCIÓN 6: REQUERIMIENTOS, HISTORIAS DE USUARIO Y TRAZABILIDAD (Minuto 4:00 - 5:30)
* **Requerimientos Funcionales (14 RFs Clave):**
  * **RF-01 a RF-03 (Seguridad):** Autenticación JWT con bcrypt, Matriz RBAC (5 roles) y Bitácora de Auditoría inmutable (*Audit Log*).
  * **RF-04 y RF-05 (Estudiantes):** Importación masiva CSV de 483 alumnos con algoritmo Módulo 11 para RUT y Ficha Unificada del Estudiante.
  * **RF-06 y RF-07 (Incidentes):** Formulario móvil en cascada (3 clics) y disparo de notificaciones automáticas ante faltas graves/gravísimas.
  * **RF-08 y RF-09 (Protocolos RICE):** Activación de los 10 protocolos de la Res. Exenta 781 con semáforos de plazos fatales (<24h / <48h).
  * **RF-10 y RF-11 (Reportería):** Dashboard analítico en tiempo real y generación de actas oficiales PDF con membrete y firmas en <3 segundos.
  * **RF-12 a RF-14 (Inteligencia & Formación - Sprint 6):** Asistente de redacción IA con Gemini Flash, revisión modular *Human-in-the-Loop*, emisión de PDF oficial diferenciado y despacho automático por correo electrónico con PDF adjunto al apoderado titular.
* **Historias de Usuario y Backlog en Jira (`DOCS/Jira.csv` y Sprint 6):**
  * Sprints 1 al 5: **63 incidencias** terminadas y cerradas (171 Story Points).
  * Sprint 6: **4 Historias (9 Tareas Técnicas / 28 SP)**: `SE-66` (DDL `reportes_incidentes`), `SE-67` (Pipeline DLP y Gemini Flash), `SE-68` (Endpoints REST), `SE-71` (Servicio PDFKit) y `SE-73` (Nodemailer y adjuntos).
* **Matriz de Trazabilidad Integral:**  
  Demostrar que cada Requerimiento de la Entrevista ➔ Tiene un RF en el SRS IEEE 830 ➔ Tiene una Historia en Jira ➔ Tiene un Commit en Git ➔ Tiene una Suite de Pruebas Jest (188 tests) ➔ Tiene un Caso de Prueba UAT.

---

### SECCIÓN 7: ORGANIZACIÓN DOCUMENTAL Y CONTROL DE VERSIONES (Minuto 5:30 - 6:15)
* **Estructura Modular del Directorio `DOCS/`:**
  * `DOCS/defensa_y_negocio/`: Guía estratégica de negocio, mercado y glosario.
  * `DOCS/manual_de_usuario/`: Manual de usuario didáctico para inspectores y docentes (incluye Sección 8.1 de Informes Sprint 6).
  * `DOCS/requerimientos/`: Requerimientos consolidados y entrevistas originales.
  * `DOCS/sprints/`: Historial de Sprints 1 al 5 y guía técnica de `sprint6.md`.
  * `DOCS/uat_y_calidad/`: Plan de pruebas UAT, DoD y criterios de aceptación.
  * `DOCS/arquitectura_y_api/`: Contrato de API REST, versionado y diseño ER.
  * `DOCS/proyecto_de_titulo/`: Documento maestro de formulación, Project Charter y PMBOK.
* **Control de Versiones (Git):**
  * 3 repositorios desacoplados: `siga-backend`, `siga-frontend` y `DOCS`.
  * Flujo de trabajo GitFlow con ramas `main` y `develop`, políticas de commits semánticos (`feat:`, `fix:`, `docs:`, `test:`).

---

### SECCIÓN 8: EVIDENCIA TÉCNICA DE AVANCE (Minuto 6:15 - 7:30)
* **Mostrar en Vivo / Capturas Reales:**
  1. **Código y Repositorio:** Arquitectura desacoplada en Node.js/Express y React/Vite.
  2. **Base de Datos Supabase:** Tabla `reportes_incidentes` con 16 columnas tipadas, triggers y políticas Row Level Security (RLS) activas.
  3. **Demostración de Inteligencia Artificial (Sprint 6):**
     * Sanitización DLP en vivo: Reemplazo automático de RUTs, teléfonos y nombres por tokens (`[ESTUDIANTE_FOCO]`, `[INVOLUCRADO_N]`).
     * Inferencia en <3 segundos con Google Gemini Flash estructurando las 5 secciones de la Circular N° 482.
     * Desanonimización diferenciada: El PDF solo revela el nombre del alumno foco; las contrapartes quedan en anonimato para proteger la intimidad (Ley N° 19.628).
     * Archivo físico en disco generado: `reporte-oficial-prueba.pdf` y correo despachado con adjunto PDF al apoderado titular.
  4. **Pruebas Automatizadas:** **188 de 188 pruebas unitarias aprobadas al 100%** en la suite global de backend (41 pruebas exclusivas del módulo de reportes Sprint 6).

---

### SECCIÓN 9: RIESGOS Y PROBLEMAS ENCONTRADOS (Minuto 7:30 - 8:30)
* **Dificultad 1: Resguardo de Datos de Menores al Usar Inteligencia Artificial.**
  * *Problema:* La Ley N° 21.719 y la Ley N° 19.628 prohíben enviar datos sensibles de niños a servidores externos.
  * *Solución Aplicada:* Construcción de un middleware de sanitización DLP (*Data Loss Prevention*) que anonimiza nombres, RUTs y direcciones con tokens sintácticos antes de invocar a Google Gemini Flash.
* **Dificultad 2: Aislamiento Estricto entre Establecimientos (Multi-Tenancy).**
  * *Problema:* Riesgo de contaminación de datos entre escuelas en una base de datos compartida.
  * *Solución Aplicada:* Implementación de Row Level Security (RLS) nativo en PostgreSQL a nivel de motor de datos, forzando `tenant_id = current_setting('app.tenant_id')`.
* **Dificultad 3: Resistencia al Cambio y Fatiga Administrativa de los Inspectores.**
  * *Problema:* Los inspectores no querían usar el computador durante los recreos.
  * *Solución Aplicada:* Rediseño Mobile-First para celulares con selectores rápidos en cascada, reduciendo la tipificación a 3 toques de pantalla en menos de 2 minutos.

---

### SECCIÓN 10: ANEXOS OBLIGATORIOS (Minuto 8:30 - 9:00)
* **Mostrar en la Carpeta `DOCS/proyecto_de_titulo/`:**
  1. `PLAN DE PROYECTO _SIGA escolar_.docx`: Project Charter, matriz RACI, plan de costos y gestión de comunicaciones.
  2. `FORMULACIÓN DEL PROYECTO DE TÍTULO...md`: Informe completo de 1.800 líneas con diagnóstico, análisis IEEE 830, WBS y marco teórico.
  3. `Evaluación 1 - Unidad 1 (Formativa).docx`: Evidencia formal de aprobación de la primera entrega académica.
  4. `PMBOK_Guide_8va_Edicion.pdf` y `Guiapractica_seguridad.pdf`: Referencias metodológicas y normativas aplicadas en la ingeniería del proyecto.

---

### SECCIÓN 11: PRÓXIMOS PASOS Y COMPROMISOS (Minuto 9:00 - 10:00)
* **Correcciones Incorporadas en esta Entrega:**
  * Blindaje del marco de negocio y mercado (TAM/SAM/SOM, modelo Ley SEP, Unit Economics).
  * Consolidación del manual de usuario para el cliente final.
* **Actividades Comprometidas para la Siguiente Entrega (Fecha Estimada: Noviembre 2026):**
  1. Ejecución de la jornada de capacitación formal con los docentes y el equipo directivo de la Escuela El Salvador.
  2. Firma del Acta de Cierre y Aceptación Final UAT por parte del Director Rodrigo Pacheco y el Coordinador Roberto Miranda.
  3. Entrega de informe final de titulación y preparación de la defensa de grado.

---

## 🎯 BANCO DE RESPUESTAS A LAS PREGUNTAS CLAVE DEL DOCENTE

### 1. «¿Cuál fue la última reunión realizada y qué requerimientos surgieron de ella?»
> **Respuesta:**  
> *"Nuestra última reunión formal con la contraparte técnica fue la **'Consulta de Definición Operativa'** (septiembre 2026) con don Roberto Miranda, Coordinador de Convivencia, la cual dio origen al **Sprint 6**. De esta sesión surgieron tres requerimientos de vanguardia: (1) que el **Asistente de IA (Google Gemini Flash)** elabore informes diferenciados por alumno foco protegiendo la identidad de terceros; (2) que el reporte pase por una revisión obligatoria *Human-in-the-Loop* antes de su oficialización; y (3) que al aprobarse, se genere automáticamente el PDF formal con membrete y se despache por correo electrónico al apoderado titular con el PDF adjunto."*

### 2. «¿Qué requerimiento cambió después del levantamiento inicial?»
> **Respuesta:**  
> *"El requerimiento de registro de incidentes (**RF-06**). En el levantamiento original se concibió como un formulario web tradicional de escritorio con múltiples campos de texto abierto. Sin embargo, en la observación en terreno constatamos que los inspectores de patio no podían cargar notebooks en el recreo. El requerimiento cambió a una **interfaz Mobile-First con selectores en cascada cerrados (Área ➔ Protocolo ➔ Gravedad)**, permitiendo ingresar el hecho en menos de 2 minutos desde un smartphone, eliminando el texto libre ambiguo."*

### 3. «¿Qué actividades presentan retraso respecto al cronograma?»
> **Respuesta:**  
> *"Ninguna actividad crítica presenta retraso. Nuestro **SPI (Índice de Desempeño del Cronograma) es de 1.0**. Los Sprints 1 al 5 están **100% cerrados** con 171 Story Points certificados. Respecto al **Sprint 6 (actualmente en ejecución hasta el 08 de octubre)**, el backend a cargo de Marcelo Acevedo ya está **100% completado y verificado en terreno (18 de 28 SP)** con 41/41 pruebas unitarias aprobadas, y Daniel Flores se encuentra integrando las pantallas de React restantes según el cronograma acordado."*

### 4. «¿Qué entregables están terminados y cuáles faltan?»
> **Respuesta:**  
> *"Están **100% terminados y certificados:** el documento de Formulación y SRS IEEE 830, el esquema multi-tenant en Supabase, los endpoints REST del backend (Sprints 1 al 6), los 10 protocolos RICE, el pipeline de sanitización DLP, el servicio Gemini Flash, la generación PDFKit, las 188 pruebas unitarias y el Manual de Usuario. **Faltan únicamente:** las vistas UI en React del Sprint 6 (10 SP a cargo de Frontend) y la jornada de capacitación final con firma de acta UAT en el colegio."*

### 5. «¿Dónde se almacena la evidencia del proyecto?»
> **Respuesta:**  
> *"La evidencia está centralizada bajo control de versiones en el repositorio del proyecto:  
> - Evidencias de reuniones y entrevistas originales en `DOCS/requerimientos/fuentes_originales/` (archivos .docx con minutas).  
> - Historias y avance ágil en `DOCS/Jira.csv`, `DOCS/sprints/` y la guía de `sprint6.md`.  
> - Arquitectura y contratos en `DOCS/arquitectura_y_api/`.  
> - Pruebas y actas en `DOCS/uat_y_calidad/`.  
> - Código fuente respaldado en GitHub en los repositorios `siga-backend` y `siga-frontend` con historial inmutable de commits."*

### 6. «¿Qué funcionalidad está completamente terminada hoy?»
> **Respuesta:**  
> *"El **flujo de ciclo de vida completo de un incidente y protocolo RICE**:  
> Inicio de sesión seguro con RBAC ➔ Importación de los 483 alumnos por CSV con validación de RUT Módulo 11 ➔ Registro móvil del incidente en patio ➔ Disparo de alertas automáticas al director ➔ Activación del protocolo RICE con checklist normativo ➔ Generación asistida de informe con IA sanitizada por DLP ➔ Aprobación directiva e inmutabilidad legal ➔ Emisión del PDF oficial con folio único y despacho automático por correo electrónico con PDF adjunto al apoderado titular."*

### 7. «¿Qué validaciones reales han realizado hasta ahora?»
> **Respuesta:**  
> *"Hemos ejecutado cuatro niveles de validación real en terreno:  
> 1. **Validación de Datos:** Procesamiento de la nómina real de **483 alumnos** de la Escuela El Salvador en menos de 3.5 segundos con validación de RUT Módulo 11.  
> 2. **Validación de Seguridad:** Pruebas automatizadas de aislamiento RLS donde una consulta sin `tenant_id` retorna exactamente cero filas.  
> 3. **Validación de IA y Privacidad (Sprint 6):** Pruebas en vivo con Google Gemini Flash (`scripts/verificar-dlp-gemini.js`), certificando que el pipeline DLP censura el 100% de RUTs, nombres y teléfonos antes de la llamada a la API, desanonimizando localmente solo al alumno foco.  
> 4. **Validación de Despacho:** Generación en disco de `reporte-oficial-prueba.pdf` e inspección del correo formal despachado con Nodemailer."*

### 8. «¿Cuál ha sido el principal problema encontrado desde que comenzó el proyecto?»
> **Respuesta:**  
> *"El principal desafío fue **resolver la tensión entre innovación tecnológica y privacidad legal de menores de edad**. Queríamos incorporar Inteligencia Artificial para acelerar la redacción y predecir focos de violencia, pero la **Ley N° 21.719** y la **Ley N° 19.628** prohíben que datos sensibles de niños salgan del recinto escolar. Lo resolvimos diseñando una arquitectura de **Privacidad por Diseño con DLP (Data Loss Prevention)**, donde ningún nombre ni RUT viaja a las APIs de Google Gemini; los datos se anonimizan con tokens sintácticos y se reinyectan localmente solo en el PDF final."*

### 9. «¿Qué riesgo tiene mayor probabilidad de afectar la entrega final?»
> **Respuesta:**  
> *"El riesgo con mayor probabilidad de impacto es la **resistencia al cambio o brecha digital del personal docente y asistentes de la educación** al momento de abandonar el papel. Para mitigarlo, diseñamos una interfaz con accesibilidad y diseño utilitario simple, acompañamos el sistema con un **Manual de Usuario didáctico paso a paso** y programamos sesiones de inducción guiadas con casos simulados antes del Go-Live definitivo."*

### 10. «En términos de trazabilidad, ¿Cómo pueden demostrar que lo que aparece en el informe realmente fue realizado?»
> **Respuesta:**  
> *"Mediante nuestra **Matriz de Trazabilidad Cruzada**:  
> Cada requerimiento del informe (ej. **RF-12: Asistente de Informes con IA**) se originó en la consulta operativa con Roberto Miranda (`DOCS/requerimientos/fuentes_originales/Consulta de Definición Operativa.docx`), se planificó como Historia en Jira con código **SE-67** y **SE-68** (`DOCS/sprints/sprint6.md`), se implementó en los commits de backend en Git (`siga-backend/src/services/geminiService.js`), se verificó mediante la suite automatizada de 41 pruebas Jest (`geminiDlp.test.js`, `reportesController.test.js`, `pdfService.test.js`, `emailServiceReporte.test.js`) y se documentó en el informe de avance y manual de usuario."*
