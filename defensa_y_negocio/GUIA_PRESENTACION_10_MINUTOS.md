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
  * **Fase de Formulación y Análisis:** **100% completada** y aprobada.
  * **Desarrollo y Ejecución (Sprints 1 al 5 en Jira):** **100% completado** (63 de 63 incidencias finalizadas, 134 Story Points certificados).
  * **Despliegue a Staging / Pruebas:** **100% verificado** con base de datos real y pruebas UAT.

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
  * Estructurada en **5 semanas de ejecución técnica iterativa** (del 06 de junio al 10 de julio de 2026), precedida por la fase de formulación (mayo 2026).
* **Métricas de Control de Cronograma (EVM - Earned Value Management):**
  * **SPI (Schedule Performance Index):** $\text{SPI} = \frac{\text{EV}}{\text{PV}} = \mathbf{1.0}$ (El proyecto marcha exactamente en línea con el cronograma planificado, sin retrasos críticos).
  * **Hitos de Control Cumplidos:**
    * **H-01:** Kickoff y levantamiento de diagnóstico (Completado).
    * **H-02:** Congelamiento de SRS IEEE 830 + EDT (Completado el 28/05/2026).
    * **H-03:** Core multi-tenant, base de datos y Auth JWT (Sprint 1 - Completado).
    * **H-04:** Registro de incidentes, importación masiva 483 alumnos y 10 protocolos RICE (Sprint 2 - Completado).
    * **H-05:** Dashboard analítico, generación de actas PDF y UAT con el cliente (Sprints 3 y 4 - Completado).
    * **H-06:** Analítica avanzada, IA con DLP y endurecimiento de seguridad (Sprint 5 - Completado).
* **Evidencia a Mostrar:** Sección 6.2 del documento maestro `FORMULACIÓN DEL PROYECTO DE TÍTULO` con la tabla de hitos y la Carta Gantt asociada.

---

### SECCIÓN 5: ESTRUCTURA DE DESGLOSE DEL TRABAJO (EDT / WBS) (Minuto 3:15 - 4:00)
* **Nivel 1:** Proyecto SIGA Escolar.
* **Nivel 2 (5 Fases Principales):**
  * **1.0 Gestión del Proyecto:** Project Charter, Plan de Proyecto, Cronograma Gantt y Gestión de Riesgos. [TERMINADO]
  * **2.0 Análisis y Diseño:** Levantamiento con SME, SRS IEEE 830, Modelo ER, Arquitectura Multi-Tenant y Wireframes UI. [TERMINADO]
  * **3.0 Construcción y Desarrollo (Sprints Scrum):**
    * 3.1 Módulo Core & Autenticación RBAC / JWT. [TERMINADO]
    * 3.2 Módulo Alumnos e Importador CSV/Excel (483 estudiantes). [TERMINADO]
    * 3.3 Módulo Registro de Incidentes & Alertas Graves. [TERMINADO]
    * 3.4 Módulo Protocolos RICE (10 flujos normativos). [TERMINADO]
    * 3.5 Módulo Reportería PDF & Dashboard Estadístico. [TERMINADO]
    * 3.6 Módulo Inteligencia Artificial con Sanitización DLP. [TERMINADO]
  * **4.0 Aseguramiento de Calidad y Testing:** Pruebas unitarias Jest, Pruebas de integración, Validación RLS y Pruebas de Aceptación UAT. [TERMINADO]
  * **5.0 Despliegue y Cierre:** Despliegue PaaS en Render/Vercel, Manual de Usuario, Capacitación y Firma de Acta UAT. [EN PROCESO / CIERRE FINAL]

---

### SECCIÓN 6: REQUERIMIENTOS, HISTORIAS DE USUARIO Y TRAZABILIDAD (Minuto 4:00 - 5:30)
* **Requerimientos Funcionales (14 RFs Clave):**
  * **RF-01 a RF-03 (Seguridad):** Autenticación JWT con bcrypt, Matriz RBAC (5 roles) y Bitácora de Auditoría inmutable (*Audit Log*).
  * **RF-04 y RF-05 (Estudiantes):** Importación masiva CSV de 483 alumnos con algoritmo Módulo 11 para RUT y Ficha Unificada del Estudiante.
  * **RF-06 y RF-07 (Incidentes):** Formulario móvil en cascada (3 clics) y disparo de notificaciones automáticas ante faltas graves/gravísimas.
  * **RF-08 y RF-09 (Protocolos RICE):** Activación de los 10 protocolos de la Res. Exenta 781 con semáforos de plazos fatales (<24h / <48h).
  * **RF-10 y RF-11 (Reportería):** Dashboard analítico en tiempo real y generación de actas oficiales PDF con membrete y firmas en <3 segundos.
  * **RF-12 a RF-14 (Inteligencia & Formación):** Bandeja matutina de casos vencidos, alertas de reincidencia (ventana 45 días) y asistente IA con DLP (Ley N° 21.719).
* **Historias de Usuario y Backlog en Jira (`DOCS/Jira.csv`):**
  * 63 incidencias registradas en Jira con clave `SE`.
  * 134 Story Points estimados mediante Planning Poker (secuencia Fibonacci) y ejecutados al 100%.
* **Matriz de Trazabilidad Integral:**  
  Demostrar que cada Requerimiento de la Entrevista ➔ Tiene un RF en el SRS IEEE 830 ➔ Tiene una Historia de Usuario en Jira ➔ Tiene un Commit en Git ➔ Tiene un Caso de Prueba UAT.

---

### SECCIÓN 7: ORGANIZACIÓN DOCUMENTAL Y CONTROL DE VERSIONES (Minuto 5:30 - 6:15)
* **Estructura Modular del Directorio `DOCS/`:**
  * `DOCS/defensa_y_negocio/`: Guía estratégica de negocio, mercado y glosario.
  * `DOCS/manual_de_usuario/`: Manual de usuario didáctico para inspectores y docentes.
  * `DOCS/requerimientos/`: Requerimientos consolidados y entrevistas originales.
  * `DOCS/sprints/`: Historial de los 5 sprints Scrum con historias y commits.
  * `DOCS/uat_y_calidad/`: Plan de pruebas UAT, DoD y criterios de aceptación.
  * `DOCS/arquitectura_y_api/`: Contrato de API REST, versionado y diseño ER.
  * `DOCS/proyecto_de_titulo/`: Documento maestro de formulación, Project Charter y PMBOK.
* **Control de Versiones (Git):**
  * 3 repositorios desacoplados: `siga-backend`, `siga-frontend` y `DOCS`.
  * Flujo de trabajo GitFlow con ramas `main` y `develop`, políticas de commits semánticos (`feat:`, `fix:`, `docs:`, `test:`).

---

### SECCIÓN 8: EVIDENCIA TÉCNICA DE AVANCE (Minuto 6:15 - 7:30)
* **Mostrar en Vivo / Capturas Reales:**
  1. **Código y Repositorio:** Estructura limpia en Node.js/Express y React/Vite.
  2. **Base de Datos Supabase:** Tablas con clave `tenant_id` y políticas Row Level Security (RLS) activas.
  3. **Pantallas Operativas:**
     * *Login seguro* con bloqueo de cuenta tras 5 intentos fallidos.
     * *Dashboard analítico* con métricas en tiempo real y gráficos Recharts.
     * *Formulario de incidentes* con selector en cascada (Tipo de Abordaje ➔ Protocolo ➔ Falta).
     * *Tablero Kanban de Protocolos RICE* con semáforos de plazos.
     * *Exportación PDF en 3 segundos* de la ficha del alumno con membrete institucional.
  4. **Pruebas Automatizadas:** Ejecución de suites Jest de backend pasando al 100%.

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
> *"Nuestra última reunión formal con la contraparte técnica fue el levantamiento de la **'Consulta de Definición Operativa'** con don Roberto Miranda, Coordinador de Convivencia. De esta sesión surgieron dos requerimientos críticos: primero, la necesidad de que la **Bandeja de Entrada Matutina (RF-12)** ordenara los casos por un semáforo de urgencia legal (<24h para delitos y <48h para citaciones); y segundo, la exigencia de que el **Asistente de IA (RF-14)** redactara borradores en formato de acta oficial con párrafos numerados y espacio para firmas institucionales, ahorrándole al colegio los 20 minutos que demoraba cada acta en Word."*

### 2. «¿Qué requerimiento cambió después del levantamiento inicial?»
> **Respuesta:**  
> *"El requerimiento de registro de incidentes (**RF-06**). En el levantamiento original se concibió como un formulario web tradicional de escritorio con múltiples campos de texto abierto. Sin embargo, en la observación en terreno constatamos que los inspectores de patio no podían cargar notebooks en el recreo. El requerimiento cambió a una **interfaz Mobile-First con selectores en cascada cerrados (Área ➔ Protocolo ➔ Gravedad)**, permitiendo ingresar el hecho en menos de 2 minutos desde un smartphone, eliminando el texto libre ambiguo."*

### 3. «¿Qué actividades presentan retraso respecto al cronograma?»
> **Respuesta:**  
> *"Ninguna actividad crítica presenta retraso. Nuestro **SPI (Índice de Desempeño del Cronograma) es de 1.0**. Todas las 63 incidencias comprometidas en los Sprints 1 al 5 en Jira están en estado 'Done' (134 Story Points completados). Lo que gestionamos como un desvío menor controlado fue la configuración inicial de las políticas RLS en Supabase durante el Sprint 1, pero se mitigó aplicando pair programming y se niveló dentro del mismo sprint sin afectar la fecha de entrega del release."*

### 4. «¿Qué entregables están terminados y cuáles faltan?»
> **Respuesta:**  
> *"Están **100% terminados:** el documento de Formulación y SRS IEEE 830, el esquema de base de datos multi-tenant en Supabase, los 14 endpoints del backend, el frontend interactivo con los 10 protocolos RICE, el módulo de IA con DLP, las pruebas unitarias y el Manual de Usuario. **Falta únicamente:** la jornada de capacitación presencial en el establecimiento y la firma del Acta de Recepción Final UAT comprometida para la entrega de cierre."*

### 5. «¿Dónde se almacena la evidencia del proyecto?»
> **Respuesta:**  
> *"La evidencia está centralizada bajo control de versiones en el repositorio del proyecto:  
> - Evidencias de reuniones y entrevistas originales en `DOCS/requerimientos/fuentes_originales/` (archivos .docx con minutas).  
> - Historias y avance ágil en `DOCS/Jira.csv` y `DOCS/sprints/`.  
> - Arquitectura y contratos en `DOCS/arquitectura_y_api/`.  
> - Pruebas y actas en `DOCS/uat_y_calidad/`.  
> - Código fuente respaldado en GitHub en los repositorios `siga-backend` y `siga-frontend` con historial inmutable de commits."*

### 6. «¿Qué funcionalidad está completamente terminada hoy?»
> **Respuesta:**  
> *"El **flujo de ciclo de vida completo de un incidente y protocolo RICE**. Hoy es posible: (1) Iniciar sesión con RBAC, (2) Importar los 483 alumnos por CSV con validación de RUT Módulo 11, (3) Registrar un incidente en patio desde el celular, (4) Disparar alertas automáticas al director, (5) Activar el protocolo RICE con checklist de la Superintendencia, y (6) Descargar el informe PDF foliado con membrete y firmas en menos de 3 segundos."*

### 7. «¿Qué validaciones reales han realizado hasta ahora?»
> **Respuesta:**  
> *"Hemos ejecutado tres niveles de validación real:  
> 1. **Validación de Datos:** Procesamiento de la nómina real de **483 alumnos** de la Escuela El Salvador en menos de 3.5 segundos, validando RUTs y detectando duplicados con upsert.  
> 2. **Validación de Seguridad:** Pruebas automatizadas de inyección y aislamiento RLS donde una consulta sin `tenant_id` retorna exactamente cero filas.  
> 3. **Validación Funcional UAT:** Los 10 casos de prueba de aceptación de usuario (CP-01 a CP-10) ejecutados y contrastados con el Coordinador de Convivencia Escolar."*

### 8. «¿Cuál ha sido el principal problema encontrado desde que comenzó el proyecto?»
> **Respuesta:**  
> *"El principal desafío fue **resolver la tensión entre innovación tecnológica y privacidad legal de menores de edad**. Queríamos incorporar Inteligencia Artificial para acelerar la redacción y predecir focos de violencia, pero la **Ley N° 21.719** y la **Ley N° 19.628** prohíben que datos sensibles de niños salgan del recinto escolar. Lo resolvimos diseñando una arquitectura de **Privacidad por Diseño con DLP (Data Loss Prevention)**, donde ningún nombre ni RUT viaja a las APIs de Google Gemini; los datos se anonimizan con tokens sintácticos y se reinyectan localmente solo en el PDF final."*

### 9. «¿Qué riesgo tiene mayor probabilidad de afectar la entrega final?»
> **Respuesta:**  
> *"El riesgo con mayor probabilidad de impacto es la **resistencia al cambio o brecha digital del personal docente y asistentes de la educación** al momento de abandonar el papel. Para mitigarlo, diseñamos una interfaz con accesibilidad y diseño utilitario simple, acompañamos el sistema con un **Manual de Usuario didáctico paso a paso** y programamos sesiones de inducción guiadas con casos simulados antes del Go-Live definitivo."*

### 10. «En términos de trazabilidad, ¿Cómo pueden demostrar que lo que aparece en el informe realmente fue realizado?»
> **Respuesta:**  
> *"Mediante nuestra **Matriz de Trazabilidad Cruzada**:  
> Cada requerimiento del informe (ej. **RF-06: Registro de Incidentes**) se originó en la entrevista grabada a Roberto Miranda (`DOCS/requerimientos/fuentes_originales/Entrevista...docx`), se planificó como Historia de Usuario en Jira con código **SE-21** (`DOCS/Jira.csv`), se implementó en el commit específico de backend `feat(incidentes)` en Git, se verificó mediante el test automatizado `incidentes.test.js` y se certificó en el caso de prueba **CP-03** del Plan UAT (`DOCS/uat_y_calidad/PLAN_PRUEBAS_UAT.md`). Cualquier persona puede auditar el camino completo desde la palabra del cliente hasta la línea de código en producción."*
