# SÍNTESIS CONSOLIDADA DE LEVANTAMIENTO DE REQUERIMIENTOS
## Proyecto: SIGA Escolar (Sistema de Gestión y Acompañamiento Escolar)
**Organización:** Escuela Coeducacional N.° 1 El Salvador  
**Fuente de Elicitación:** Carpeta `DOCS/requerimientos`  
**Documentos Analizados:**
1. `Entrevista de requerimientos Roberto Miranda.docx` (Transcripción de entrevista al Coordinador de Convivencia)
2. `requerimientos.docx` (Consolidación de requerimientos en 5 pilares funcionales)
3. `Toma de requerimientos 2.docx` (Cuestionario estructurado de fricción operativa y propuesta de valor)

---

## 1. RESUMEN EJECUTIVO Y PATROCINIO INSTITUCIONAL

El levantamiento de requerimientos se sustentó en un proceso de elicitación directo y continuo con los actores clave del establecimiento:
* **Validación Directiva:** En la entrevista inicial con Roberto Miranda Vivanco (Coordinador de Convivencia Escolar), se constató la anuencia y respaldo formal del **Director del establecimiento (Rodrigo Pacheco Contreras)**, quien validó la pertinencia de la plataforma y comprometió la firma de cartas de patrocinio y convenios de colaboración académica.
* **Diagnóstico de Necesidad:** El equipo escolar requiere transitar desde un registro administrativo artesanal (papel y planillas) hacia un sistema centralizado de **inteligencia de datos** que no solo registre hechos, sino que reduzca la fricción operativa, controle plazos fatales y guíe la toma de decisiones preventivas.
* **Benchmarking de Mercado:** El cliente identificó soluciones existentes en el ecosistema educacional chileno (*Lirmi*, *Papinotas*, *Pulso Escolar*), pero destacó que no resuelven la profundidad procedimental de los protocolos RICE, el aislamiento de confidencialidad psicosocial ni el control de derivaciones externas.

---

## 2. PILARES FUNDAMENTALES DEL SISTEMA

Del análisis cruzado de los documentos se desprenden **5 pilares operativos esenciales**:

### Pilar 1: Gestión Integral de la Comunidad Educativa
El sistema debe extenderse más allá de los alumnos para incluir a toda la comunidad escolar:
* **Estudiantes y Cursos:** Estructura jerárquica por nivel y letra, asignados a su respectivo Profesor Jefe. Fichas de estudiantes con RUT, antecedentes de salud y condición de vulnerabilidad/PIE.
* **Red de Apoderados:** Directorio de apoderados titulares y suplentes con vínculos de parentesco y datos de contacto actualizados.
* **Funcionarios:** Registro de personal docente, directivo, paradocente y auxiliares de aseo. Habilita el registro de entrevistas laborales, relaciones internas, acuerdos y contención emocional entre funcionarios.

### Pilar 2: Bitácora de Intervenciones y Casos (Categorizada y Ágil)
Diseñada para un registro rápido y compatible con dispositivos móviles (*Mobile-First*):
* **Tipología de Abordajes con Estudiantes y Apoderados:**
  1. *Indagación y denuncias:* Registro de hechos, participantes y recepción formal de reclamos.
  2. *Conflictos puntuales / Incidentes:* Hechos aislados entre pares en patio o sala.
  3. *Contención emocional:* Espacios de contención frente a desregulaciones, crisis de llanto o angustia.
  4. *Mediación escolar:* Acuerdos guiados y compromisos formativos entre las partes.
* **Tipología de Abordajes con Funcionarios:** Entrevistas de contención, indagaciones internas, entrega formal de información y mediación de conflictos laborales.
* **Privacidad Estricta (RBAC):** Aislamiento de información sensible. Un profesor jefe solo visualiza antecedentes de su curso; develaciones graves o informes clínicos quedan restringidos exclusivamente al Equipo de Formación y Dirección.

### Pilar 3: Flujos Normativos RICE y Redes de Derivación Externa
Soporte procedimental estructurado para formalizar actuaciones y garantizar el debido proceso:

#### Catálogo Oficial de Protocolos RICE (10 Protocolos)
1. Maltrato, acoso escolar o violencia (*Bullying* y *Ciberbullying*).
2. Agresiones sexuales y hechos de connotación sexual.
3. Vulneración de derechos de niños, niñas y adolescentes.
4. Consumo, porte o tráfico de alcohol y drogas (Ley N.° 20.000).
5. Señales de depresión, ideación suicida y autolesiones.
6. Salidas pedagógicas y giras de estudio.
7. Accidentes escolares (Seguro Escolar D.S. N.° 313).
8. Retención escolar de estudiantes embarazadas, madres y padres adolescentes.
9. Reconocimiento de identidad de género (estudiantes Trans / Circular 812).
10. Desregulaciones emocionales y conductuales severas.

#### Catálogo de Redes de Apoyo y Derivación Externa (10 Entidades)
* **Salud:** CESFAM / Consultorio general, COSAM (Salud Mental).
* **Protección y Niñez:** OLN (Oficina Local de la Niñez), Mejor Niñez (ex SENAME).
* **Justicia y Orden:** Fiscalía (Ministerio Público), Tribunales de Familia, Carabineros de Chile, Policía de Investigaciones (PDI).
* **Programas de Apoyo:** Habilidades para la Vida (JUNAEB), SENDA Previene, PIE institucional.

### Pilar 4: Panel Estadístico y Soporte a la Toma de Decisiones
Transformación de registros en inteligencia accionable:
* **Ficha Individual (Dashboard por Estudiante):** Gráficos de tendencias conductuales (proporción entre mediaciones, incidentes y contención) disponibles de forma inmediata para fundamentar entrevistas con apoderados con evidencia objetiva.
* **Monitoreo Grupal por Curso y Nivel:** Identificación de focos de conflicto en aulas específicas para guiar intervenciones pedagógicas grupales.
* **Evaluación de Impacto Institucional:** Curvas temporales para medir si los planes de prevención logran disminuir la tasa de activación de protocolos graves a lo largo de los semestres.

### Pilar 5: Seguridad, Privacidad y Roles de Acceso
* Matriz de permisos jerárquica: Administrador, Directivo/Sponsor, Equipo de Formación (Psicólogo/Trabajador Social), Inspectoría General y Profesores Jefes.
* Auditoría obligatoria de eventos sobre datos de menores.

---

## 3. NECESIDADES OPERATIVAS Y FUNCIONALIDADES DE NUEVA GENERACIÓN (TOMA DE REQUERIMIENTOS 2)

El documento `Toma de requerimientos 2.docx` profundiza en la **fricción operativa real** del equipo de convivencia y define las funcionalidades críticas de mayor valor:

| Problema Identificado en Terreno | Causa Raíz | Solución Requerida en SIGA Escolar |
| :--- | :--- | :--- |
| **Pérdida de tiempo en contingencias y búsqueda de antecedentes.** | La información de un alumno está dispersa en múltiples cuadernos y carpetas. | **Ficha Unificada del Estudiante:** Historial cronológico consolidado accesible en menos de 5 segundos. |
| **Inseguridad y sobrecarga al redactar actas y reportes.** | Redacción manual repetitiva (demora 20 minutos por caso). | **Generador Automático de Borradores de Reportes:** Prellenado automático con identificación, motivo, relato y acuerdos; el funcionario solo revisa y oficializa (tiempo reducido a 3 minutos). |
| **Dificultad para controlar plazos legales y normativos.** | Se gestionan por memoria, notas adhesivas o mensajes informales de WhatsApp. | **Bandeja de Entrada Inteligente Matutina:** Panel que lista los casos ordenados por urgencia de vencimiento normativo (hoy, próximos, atrasados). |
| **Falta de guía en casos complejos.** | Inseguridad técnica al momento de oficializar denuncias o aplicar sanciones. | **Checklist Normativo RICE Paso a Paso:** Flujo que indica requisitos legales obligatorios cumplidos y pendientes según la Superintendencia. |
| **Dificultad para detectar reincidencias tempranas.** | Casos leves dispersos no permiten notar el patrón acumulativo. | **Motor de Alertas Preventivas:** Detección automática de patrones (ej. *"Este estudiante registra 3 incidentes en los últimos 45 días; evaluar protocolo de acoso escolar"*). No automatiza sanciones, sugiere análisis profesional. |

---

## 4. MATRIZ DE TRAZABILIDAD: DE LA ENTREVISTA AL INFORME DE TÍTULO

Esta síntesis se vincula directamente con los capítulos del **Informe de Proyecto de Título**:

```
DOCUMENTOS FUENTE (DOCS/requerimientos/)               INFORME DE TÍTULO (IEEE 830 / PMBOK 8)
┌──────────────────────────────────────────────┐        ┌──────────────────────────────────────────────┐
│ Entrevista Roberto Miranda                   │ ───►  │ II. Descripción de la Organización y Problema│
│ (Casos reales, matrícula, dolor operacional) │        │ (Contexto SLEP, 483 alumnos, ~30 casos/sem)  │
├──────────────────────────────────────────────┤        ├──────────────────────────────────────────────┤
│ requerimientos.docx                          │ ───►  │ III. Requerimientos Funcionales (RF-01 a 11) │
│ (5 pilares, 10 protocolos, 10 derivaciones)  │        │ IV. Marco Normativo (RICE / Res. Exenta 781) │
├──────────────────────────────────────────────┤        ├──────────────────────────────────────────────┤
│ Toma de requerimientos 2.docx                │ ───►  │ III. Requerimientos Funcionales Avanzados    │
│ (Bandeja matutina, borradores PDF, checklist)│        │ (RF-12 Bandeja, RF-13 Alertas, RF-14 Check)  │
└──────────────────────────────────────────────┘        └──────────────────────────────────────────────┘
```

### Síntesis de Requisitos Mapeados al Estándar IEEE 830:
* **RF-01 a RF-03 (Seguridad y Auditoría):** Autenticación con JWT, RBAC por perfiles y bitácora no modificable de acciones.
* **RF-04 y RF-05 (Comunidad y Estudiantes):** Importación masiva desde nóminas Excel con validación de RUT chileno (módulo 11) y perfil unificado del alumno.
* **RF-06 y RF-07 (Convivencia y Notificaciones):** Registro ágil de incidentes con tipología estandarizada y alertas automáticas por correo ante faltas graves.
* **RF-08 y RF-09 (Protocolos RICE):** Activación de los 10 protocolos normativos con checklist interactivo y trazabilidad de estados.
* **RF-10 y RF-11 (Reportería y Actas):** Dashboard analítico en tiempo real y exportación de reportes PDF estructurados con membrete formal y espacio de firmas.
* **RF-12 (Bandeja Inteligente de Casos):** Vista de priorización por semáforo de urgencia y control de plazos normativos.
* **RF-13 (Alertas de Reincidencia):** Sugerencia de evaluación de acoso frente a incidentes reiterados en ventanas de 45 días.
* **RF-14 y RF-15 (Checklist y Borradores):** Guía paso a paso para fiscalizaciones de la Superintendencia y generación de borradores de citación a apoderados.

---

## 5. CONCLUSIÓN DEL ANÁLISIS

Los documentos de la carpeta `requerimientos` demuestran que el proyecto **SIGA Escolar no es una propuesta teórica abstracta**, sino una solución de ingeniería de software nacida de una necesidad operativa real y documentada en terreno. Contiene el balance exacto entre:
1. **Rigor normativo:** Cumplimiento de la Superintendencia de Educación, Ley N.° 19.628, Ley N.° 21.719 y D.S. N.° 313.
2. **Usabilidad escolar:** Reducción efectiva de tareas burocráticas (de 20 min a 3 min en actas) y apoyo en terreno para docentes durante entrevistas conflictivas.
3. **Seguridad y ética:** Protección reforzada de la intimidad de niños, niñas y adolescentes mediante aislamiento de datos por roles y multi-tenancy.
