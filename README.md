# Centro de Documentación — SIGA Escolar

Bienvenido al repositorio central de documentación de **SIGA Escolar** (Sistema Integral de Gestión y Acompañamiento Escolar).  
Este directorio contiene toda la información técnica, funcional, de diseño, planificación ágil y entregables académicos del proyecto.

---

## 🗺️ Estructura General del Directorio `DOCS/`

```text
DOCS/
├── README.md                                 # Índice general y guía de navegación (este archivo)
├── DESCRIPCION_PROYECTO.md                   # Resumen ejecutivo, alcance, funcionalidades y stack tecnológico
├── INFORME_EJECUCION_Y_AVANCE_PROYECTO.md    # Bitácora continua de ejecución, avances por sprint e hitos
├── schema_siga_escolar.sql                   # Definición DDL de base de datos PostgreSQL/Supabase
├── Jira.csv                                  # Exportación del backlog y seguimiento en Jira
│
├── manual_de_usuario/                       # Manuales y guías paso a paso para el usuario final / cliente
│   └── MANUAL_DE_USUARIO.md                  # [DOCUMENTO MAESTRO] Guía didáctica de uso para directivos, inspectores y docentes
│
├── requerimientos/                           # Levantamiento y especificación de requerimientos
│   ├── REQUERIMIENTOS_CONSOLIDADOS.md        # [DOCUMENTO MAESTRO] Síntesis consolidada de RF y RNF
│   └── fuentes_originales/                   # Entrevistas, minutas y documentos originales en bruto
│       ├── Entrevista de requerimientos Roberto Miranda.docx
│       ├── Toma de requerimientos 2.docx
│       ├── requerimientos.docx
│       ├── requerimientosSIGA.md
│       └── SINTESIS_REQUERIMIENTOS.md
│
├── sprints/                                  # Gestión de desarrollo ágil y sprints Scrum
│   ├── SPRINTS_CONSOLIDADOS.md               # [DOCUMENTO MAESTRO] Historial completo de Sprints 1 al 5
│   └── historico/                            # Notas individuales y exportes manuales de Jira
│       ├── SPRINT2.md
│       ├── SPRINT2_JIRA_MANUAL.md
│       ├── SPRINT3_JIRA_MANUAL.md
│       ├── SPRINT4_JIRA_MANUAL.md
│       ├── sprint4.md
│       ├── sprint5.md
│       ├── sprint5_backend.md
│       └── SPRINTS_REALIZADOS.md
│
├── uat_y_calidad/                            # Control de calidad, DoD y pruebas de aceptación
│   ├── PLAN_PRUEBAS_UAT.md                   # [DOCUMENTO MAESTRO] DoD y Plan formal de pruebas UAT
│   ├── PLAN_PRUEBAS_UAT_SIGA_ESCOLAR.docx    # Formato oficial para firma y entrega al cliente
│   └── historico/                            # Versiones intermedias de actas y criterios
│       ├── DOD_Y_UAT.md
│       └── UAT_SIGA_ESCOLAR_HISTORICO.md
│
├── arquitectura_y_api/                       # Diseño técnico, APIs, esquemas y propuestas
│   ├── api-contract.md                       # Especificación de endpoints y contratos de API REST
│   ├── API_VERSIONING.md                     # Estrategia de versionado semántico de la API
│   ├── api_asistencia.md                     # Especificación técnica del módulo de asistencia
│   ├── enterprise-features-design.md         # Diseño arquitectónico para funciones empresariales y escalabilidad
│   ├── PROPUESTA_IA_CLIENTE.md               # Propuesta técnica de analítica avanzada e IA generativa
│   ├── model-er.png                          # Diagrama Entidad-Relación de la base de datos
│   └── Insomnia_auth.yaml                    # Colección exportada de Insomnia para pruebas de endpoints
│
├── ui/                                       # Recursos de interfaz, maquetas y activos visuales
│   ├── login_screen.jpeg                     # Maqueta visual de referencia para el Login
│   ├── siga-escolar-logo.png                 # Logotipo institucional oficial de SIGA Escolar
│   ├── img_students.svg                      # Ilustración vectorial de estudiantes para vistas de acceso
│   ├── favicon.svg                           # Favicon vectorial del sistema
│   └── Gemini_Generated_Image_u3bbibu3bbibu3bb.jpeg # Arte conceptual complementario
│
└── proyecto_de_titulo/                       # Entregables académicos, guías y marcos metodológicos
    ├── PLAN DE PROYECTO _SIGA escolar_.docx  # Plan formal del proyecto de título
    ├── Evaluación 1 - Unidad 1 (Formativa).docx # Evidencia de evaluación de unidad
    ├── Plantilla_informe_Guía_Full.docx      # Formato de informe final
    ├── Guiapractica_seguridad.pdf            # Guía práctica de seguridad y buenas prácticas
    └── PMBOK_Guide_8va_Edicion.pdf           # Referencia metodológica de gestión de proyectos
```

---

## 📑 Documentos Maestros Consolidados

Para facilitar la lectura y evitar la redundancia de archivos dispersos, la información crítica ha sido unificada en los siguientes documentos markdown de referencia:

1. [**MANUAL_DE_USUARIO.md**](manual_de_usuario/MANUAL_DE_USUARIO.md):  
   Manual didáctico y operativo para el cliente (Escuela N°1 El Salvador), explicando paso a paso cómo ingresar, usar el dashboard, registrar incidentes con el selector en cascada, gestionar protocolos RICE normativos, descargar informes PDF y operar cada módulo escolar.

2. [**REQUERIMIENTOS_CONSOLIDADOS.md**](requerimientos/REQUERIMIENTOS_CONSOLIDADOS.md):  
   Consolida los 14 requerimientos funcionales (RF-01 a RF-14), requerimientos no funcionales (seguridad, rendimiento, normativos), la matriz de trazabilidad y los antecedentes de las entrevistas realizadas al Coordinador de Convivencia de la Escuela N°1 El Salvador.

3. [**SPRINTS_CONSOLIDADOS.md**](sprints/SPRINTS_CONSOLIDADOS.md):  
   Detalla el ciclo de vida completo del desarrollo ágil desde el Sprint 1 hasta el Sprint 5, incluyendo objetivos, historias de usuario completadas, estimaciones en puntos de historia (SP), commits asociados y lecciones aprendidas.

4. [**PLAN_PRUEBAS_UAT.md**](uat_y_calidad/PLAN_PRUEBAS_UAT.md):  
   Define el *Definition of Done* (DoD) en todos sus niveles (tarea, HU, sprint, release) y presenta los 10 casos de prueba de aceptación de usuario (CP-01 a CP-10), criterios de aprobación, matriz de severidad y el formato del acta de conformidad.

5. [**DESCRIPCION_PROYECTO.md**](DESCRIPCION_PROYECTO.md):  
   Presenta el contexto del establecimiento beneficiario, alcance del sistema, stack tecnológico utilizado (Node.js 22, Express 5, React 18, Tailwind CSS, Supabase PostgreSQL 15) y decisiones clave de diseño de software.

6. [**INFORME_EJECUCION_Y_AVANCE_PROYECTO.md**](INFORME_EJECUCION_Y_AVANCE_PROYECTO.md):  
   Bitácora oficial de avance del proyecto, actualizada continuamente con cada incremento funcional verificado y certificado.

---

## 🔒 Consideraciones de Seguridad y Normativa

- **Protección de Datos Sensibles:** Los expedientes disciplinarios y antecedentes de menores de edad están protegidos por aislamiento multi-tenant estricto (`tenant_id`), cifrado en tránsito (HTTPS/TLS) y en reposo (PostgreSQL).
- **Normativa Mineduc / RICE:** Los flujos de incidentes y protocolos normativos se apegan rigurosamente a las exigencias de la Superintendencia de Educación de Chile, garantizando debido proceso y plazos máximos normativos.
