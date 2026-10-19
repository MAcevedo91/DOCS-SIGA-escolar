# ESPECIFICACIÓN FORMAL DE CASOS DE USO UML 2.5
## Sistema de Gestión y Acompañamiento Escolar (SIGA Escolar)
**Cliente Institucional:** Escuela Coeducacional N° 1 El Salvador, Atacama, Chile  
**Entidad Académica:** Universidad Tecnológica de Chile INACAP (Proyecto de Título)  
**Referencia Técnica:** *UML Distilled (3rd Edition / Martin Fowler)*, Alistair Cockburn (Writing Effective Use Cases), IEEE 830, Modelo 4+1 Vistas (Kruchten)  
**Versión:** 2.1 (Modelo Exhaustivo PlantUML / Estándar Fowler)  
**Fecha:** Octubre 2026  

---

## 1. INTRODUCCIÓN Y CONVENCIONES DE MODELADO

Este documento contiene la especificación técnica y formal de la **totalidad de los Casos de Uso del Sistema SIGA Escolar (Modelo Exhaustivo)**. Los diagramas están formulados en **PlantUML**, optimizados para su renderizado directo e importación vectorial en **Draw.io** (`+` $\rightarrow$ `Avanzado` $\rightarrow$ `PlantUML`) o cualquier herramienta CASE (Visual Paradigm, Enterprise Architect, Lucidchart).

### Convenciones UML 2.5 / Estándar Fowler:
* **Nombres de Casos de Uso en los Óvalos:** Siguiendo la regla de oro de Martin Fowler (*UML Distilled*), cada óvalo contiene únicamente una **frase verbal activa representativa de la meta del usuario** (ej. *"Registrar Incidente Escolar"*). Se eliminan prefijos o códigos alfanuméricos dentro de los óvalos para evitar saturación gráfica.
* **Alias Técnicos:** Cada caso de uso conserva un identificador interno inmutable (`as CU101`, `as CU301`) para conectar relaciones y preservar trazabilidad biunívoca con la matriz de requerimientos del proyecto de título.
* **Límite del Sistema (*System Boundary*):** Rectángulo que delimita el alcance funcional del software frente a actores humanos y sistemas externos.
* **Relación `<<include>>` (Inclusión obligatoria):** El caso de uso base requiere incondicionalmente la ejecución del caso de uso incluido: `Base ..> Incluido : <<include>>`.
* **Relación `<<extend>>` (Extensión condicional):** Modela comportamientos opcionales o excepcionales activados bajo un punto de extensión específico: `Extension ..> Base : <<extend>>`.
* **Generalización de Actores:** Herencia de capacidades y permisos desde un actor general abstracto hacia actores especializados (`<|--`).

---

## 2. TAXONOMÍA Y JERARQUÍA DE ACTORES

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false
skinparam monochrome true

actor "Usuario Escolar\n<<Abstracto>>" as User
actor "Docente" as Doc
actor "Inspector" as Insp
actor "Equipo de Formación\n(Dupla / Convivencia)" as EF
actor "Directivo\n(Director / UTP)" as Dir
actor "Administrador" as Admin
actor "Apoderado\n<<Móvil sin Login>>" as Apod

actor "Google Gemini Flash\n<<API Externa>>" as Gemini
actor "Red de Apoyo Externa\n(Tribunales, Salud, OLN)" as RedExt
actor "Superintendencia\nde Educación" as SuperEduc
actor "Especialista Externo\n(Neurólogo / Psiquiatra)" as Medico

User <|-- Doc
User <|-- Insp
User <|-- EF
User <|-- Dir
User <|-- Admin
@enduml
```

---

## 3. MAPA GENERAL DE PAQUETES DE CASOS DE USO

El sistema se estructura de forma modular en **10 paquetes cohesivos**:

* **PKG-01:** Seguridad, Autenticación y Auditoría (RBAC & Multi-tenant)
* **PKG-02:** Gestión de la Comunidad Educativa, Cursos y Estudiantes
* **PKG-03:** Bitácora de Convivencia y Registro de Incidentes (Mobile-First)
* **PKG-04:** Protocolos Normativos RICE y Redes de Derivación Externa
* **PKG-05:** Inteligencia Artificial Generativa y Analítica Predictiva
* **PKG-06:** Cierre de Año Escolar y Promoción de Estudiantes
* **PKG-07:** Configuración Institucional, Notificaciones y Analítica Avanzada
* **PKG-08:** Mediación Escolar y Acuerdos Restaurativos (Sprint 7.2)
* **PKG-09:** Dinámicas Socioemocionales y Colaboración Externa (Sprint 8)
* **PKG-10:** Citaciones Formativas y Alianza Familia-Escuela (Sprint 10)

---

## 4. PKG-01: SEGURIDAD, AUTENTICACIÓN Y AUDITORÍA

### 4.1 Diagrama de Casos de Uso (PlantUML)

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false

actor "Usuario Escolar" as User
actor "Administrador" as Admin

rectangle "SIGA Escolar: Seguridad y Auditoría" {
  usecase "Iniciar Sesión con\nCredenciales" as CU101
  usecase "Bloquear Cuenta por\nFuerza Bruta" as CU102
  usecase "Gestionar Usuarios y\nAsignar Roles" as CU103
  usecase "Consultar Bitácora\nde Auditoría" as CU104
  usecase "Validar Token JWT\ny Tenant" as CU105
  usecase "Registrar Evento de\nAuditoría JSONB" as CU106
}

User --> CU101
Admin --> CU103
Admin --> CU104

CU101 ..> CU105 : <<include>>
CU102 ..> CU101 : <<extend>>
CU103 ..> CU106 : <<include>>
CU104 ..> CU105 : <<include>>
@enduml
```

### 4.2 Tabla de Especificación Técnica

| Código | Caso de Uso | Actores | Tipo / Relación | Requerimiento Trazable | Descripción Técnica |
| :--- | :--- | :--- | :--- | :---: | :--- |
| **CU-101** | Iniciar Sesión con Credenciales | Usuario Escolar | Caso Base | RF-01 | Autenticación con email/contraseña, verificación bcrypt y emisión de JWT (8h). |
| **CU-102** | Bloquear Cuenta por Fuerza Bruta | Sistema | `<<extend>>` de CU-101 | RF-01 | Se activa si se registran 5 intentos fallidos consecutivos. Bloquea cuenta por 15 min. |
| **CU-103** | Gestionar Usuarios y Asignar Roles | Administrador | Caso Base | RF-02, RF-04 | CRUD de cuentas con validación de RBAC y salvaguarda del último admin activo. |
| **CU-104** | Consultar Bitácora de Auditoría | Administrador | Caso Base | RF-03 | Visualización de eventos de auditoría con filtrado por fecha, actor y tabla. |
| **CU-105** | Validar Token JWT y Tenant | Sistema | `<<include>>` de CU-101/104 | RF-01, RNF-01 | Extracción criptográfica de `user_id`, `rol` y `tenant_id` en cada petición HTTP. |
| **CU-106** | Registrar Evento de Auditoría JSONB | Sistema | `<<include>>` de CU-103 | RF-03 | Registro asíncrono e inmutable (`setImmediate`) de eventos CRUD con IP y metadata. |

---

## 5. PKG-02: GESTIÓN DE LA COMUNIDAD EDUCATIVA, CURSOS Y ESTUDIANTES

### 5.1 Diagrama de Casos de Uso (PlantUML)

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false

actor "Administrador" as Admin
actor "Equipo de Formación /\nDirectivo" as EF
actor "Docente" as Doc

rectangle "SIGA Escolar: Comunidad, Cursos y Ficha del Estudiante" {
  usecase "Importar Nómina Masiva\n(CSV / Excel)" as CU201
  usecase "Validar RUT con\nMódulo 11" as CU202
  usecase "Consultar Ficha Integral\ndel Estudiante" as CU203
  usecase "Marcar Pertenencia a\nPrograma PIE" as CU204
  usecase "Descargar Historial\nConductual en PDF" as CU205
  usecase "Registrar Apoderado\nTitular / Suplente" as CU206
  usecase "Filtrar Estudiantes por\nCurso Asignado" as CU207
  usecase "Asignar Profesor Jefe\na Curso" as CU208
}

Admin --> CU201
Admin --> CU208
EF --> CU203
EF --> CU204
EF --> CU205
Doc --> CU203
Doc --> CU205

CU201 ..> CU202 : <<include>>
CU201 ..> CU206 : <<include>>
CU207 ..> CU203 : <<extend>>
CU205 ..> CU203 : <<include>>
@enduml
```

### 5.2 Tabla de Especificación Técnica

| Código | Caso de Uso | Actores | Tipo / Relación | Requerimiento Trazable | Descripción Técnica |
| :--- | :--- | :--- | :--- | :---: | :--- |
| **CU-201** | Importar Nómina Masiva (CSV/Excel) | Administrador | Caso Base | RF-05 | Ingesta masiva por lotes de estudiantes, cursos y apoderados sin detenerse por errores. |
| **CU-202** | Validar RUT con Módulo 11 | Sistema | `<<include>>` de CU-201 | RF-05 | Validación algorítmica del dígito verificador; reporta filas erróneas a log de fallos. |
| **CU-203** | Consultar Ficha Integral del Estudiante | Equipo Formación, Directivo, Docente | Caso Base | RF-05 | Vista 360° con datos biográficos, apoderados, cursos y línea de tiempo de incidentes. |
| **CU-204** | Marcar Pertenencia a Programa PIE | Equipo Formación | Caso Base | RF-05, RF-15 | Indicador de necesidades educativas especiales para contextualizar mediaciones. |
| **CU-205** | Descargar Historial Conductual en PDF | Equipo Formación, Docente, Directivo | Caso Base | RF-11 | Emisión de informe oficial con membrete del colegio, firmas y cronología de faltas. |
| **CU-206** | Registrar Apoderado Titular / Suplente | Sistema | `<<include>>` de CU-201 | RF-05 | Creación y vinculación del tutor legal y contactos de emergencia del alumno. |
| **CU-207** | Filtrar Estudiantes por Curso Asignado | Sistema | `<<extend>>` de CU-203 | RF-02 | Restringe la visualización del docente únicamente a sus cursos asignados. |
| **CU-208** | Asignar Profesor Jefe a Curso | Administrador | Caso Base | RF-02 | Configuración de jefaturas pedagógicas para control jerárquico de acceso. |

---

## 6. PKG-03: BITÁCORA DE CONVIVENCIA Y REGISTRO DE INCIDENTES

### 6.1 Diagrama de Casos de Uso (PlantUML)

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false

actor "Docente" as Doc
actor "Inspector" as Insp
actor "Equipo de Formación" as EF
actor "Directivo" as Dir

rectangle "SIGA Escolar: Bitácora de Convivencia e Incidentes" {
  usecase "Registrar Incidente\nEscolar" as CU301
  usecase "Tipificar Abordaje\ny Gravedad" as CU302
  usecase "Asociar Estudiantes y\nRoles (Víctima/Agresor/Testigo)" as CU303
  usecase "Disparar Alerta Temprana\nen Dashboard" as CU304
  usecase "Consultar Dashboard\nAnalítico en Tiempo Real" as CU305
  usecase "Sincronizar Cola\nOffline (PWA)" as CU306
}

Doc --> CU301
Insp --> CU301
EF --> CU301
EF --> CU305
Dir --> CU305

CU301 ..> CU302 : <<include>>
CU301 ..> CU303 : <<include>>
CU304 ..> CU301 : <<extend>>
CU306 ..> CU301 : <<extend>>
@enduml
```

### 6.2 Tabla de Especificación Técnica

| Código | Caso de Uso | Actores | Tipo / Relación | Requerimiento Trazable | Descripción Técnica |
| :--- | :--- | :--- | :--- | :---: | :--- |
| **CU-301** | Registrar Incidente Escolar | Docente, Inspector, Equipo Formación | Caso Base | RF-06 | Formulario móvil/desktop para registrar fecha, lugar, medidas tomadas y relato. |
| **CU-302** | Tipificar Abordaje y Gravedad | Sistema / Usuario | `<<include>>` de CU-301 | RF-06 | Clasificación según RICE: Indagación, Mediación, Conflicto y gravedad (Leve, Grave, Gravísimo). |
| **CU-303** | Asociar Estudiantes y Roles | Sistema / Usuario | `<<include>>` de CU-301 | RF-06 | Vincula a los involucrados clasificándolos como Víctima, Agresor o Testigo. |
| **CU-304** | Disparar Alerta Temprana en Dashboard | Sistema | `<<extend>>` de CU-301 | RF-07 | Se activa si gravedad es Grave o Gravísima, notificando a Coordinación y Dirección. |
| **CU-305** | Consultar Dashboard Analítico en Tiempo Real | Equipo Formación, Directivo | Caso Base | RF-10 | Panel con indicadores en tiempo real: distribución por abordaje, cursos críticos y gráficos. |
| **CU-306** | Sincronizar Cola Offline (PWA) | Sistema | `<<extend>>` de CU-301 | RNF-05 | Si falla la conexión en patio, almacena en IndexedDB y sincroniza al recuperar red. |

---

## 7. PKG-04: PROTOCOLOS NORMATIVOS RICE Y REDES DE DERIVACIÓN

### 7.1 Diagrama de Casos de Uso (PlantUML)

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false

actor "Equipo de Formación" as EF
actor "Directivo" as Dir
actor "Red de Apoyo Externa\n(Tribunales, Salud, OLN)" as RedExt
actor "Superintendencia\nde Educación" as SuperEduc

rectangle "SIGA Escolar: Protocolos RICE y Normativa" {
  usecase "Activar Protocolo\nNormativo RICE" as CU401
  usecase "Validar Pertenencia de\nEstudiante a Incidente" as CU402
  usecase "Gestionar Checklist\nNormativo por Pasos" as CU403
  usecase "Controlar Plazos Fatales\nde Superintendencia" as CU404
  usecase "Derivar Caso a\nEntidad Externa" as CU405
  usecase "Registrar Acta de\nCierre de Protocolo" as CU406
}

EF --> CU401
EF --> CU403
EF --> CU405
Dir --> CU406

CU405 --> RedExt
CU404 --> SuperEduc

CU401 ..> CU402 : <<include>>
CU403 ..> CU404 : <<include>>
CU406 ..> CU403 : <<include>>
@enduml
```

### 7.2 Tabla de Especificación Técnica

| Código | Caso de Uso | Actores | Tipo / Relación | Requerimiento Trazable | Descripción Técnica |
| :--- | :--- | :--- | :--- | :---: | :--- |
| **CU-401** | Activar Protocolo Normativo RICE | Equipo de Formación | Caso Base | RF-08 | Apertura formal de uno de los 10 protocolos normativos Superintendencia. |
| **CU-402** | Validar Pertenencia de Estudiante a Incidente | Sistema | `<<include>>` de CU-401 | RF-08 | Regla de integridad: el alumno debe haber sido parte del incidente origen. |
| **CU-403** | Gestionar Checklist Normativo por Pasos | Equipo de Formación | Caso Base | RF-09 | Flujo secuencial interactivo con registro de observaciones obligatorias por etapa. |
| **CU-404** | Controlar Plazos Fatales de Superintendencia | Sistema | `<<include>>` de CU-403 | RF-09 | Cálculo en días hábiles frente al vencimiento normativo para evitar sanciones. |
| **CU-405** | Derivar Caso a Entidad Externa | Equipo de Formación, Red Externa | Caso Base | RF-08 | Registro de derivación formal a Fiscalía, Tribunales, CESFAM, OLN o Mejor Niñez. |
| **CU-406** | Registrar Acta de Cierre de Protocolo | Directivo | Caso Base | RF-09 | Clausura del caso con informe de medidas restaurativas y compromisos familiares. |

---

## 8. PKG-05: INTELIGENCIA ARTIFICIAL GENERATIVA Y ANALÍTICA PREDICTIVA

### 8.1 Diagrama de Casos de Uso (PlantUML)

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false

actor "Equipo de Formación\n(Dupla / Convivencia)" as EF
actor "Directivo" as Dir
actor "Google Gemini Flash\n<<API Externa>>" as Gemini

rectangle "SIGA Escolar: Inteligencia Artificial y Prevención" {
  usecase "Solicitar Borrador de\nInforme de Incidente" as CU501
  usecase "Ejecutar Pipeline DLP\n(Sanitización PII)" as CU502
  usecase "Editar Modularmente Borrador\n(Human-in-the-Loop)" as CU503
  usecase "Oficializar Reporte con\nCódigo Verificador" as CU504
  usecase "Evaluar Riesgo\nConductual Predictivo" as CU505
  usecase "Generar Plan de Acción\nFormativo / Restaurativo" as CU506
  usecase "Activar Degradación Grácil\n(Circuit Breaker)" as CU507
}

EF --> CU501
EF --> CU503
Dir --> CU504
EF --> CU505

CU501 --> Gemini
CU506 --> Gemini

CU501 ..> CU502 : <<include>>
CU507 ..> CU501 : <<extend>>
CU504 ..> CU503 : <<include>>
CU506 ..> CU505 : <<extend>>
@enduml
```

### 8.2 Tabla de Especificación Técnica

| Código | Caso de Uso | Actores | Tipo / Relación | Requerimiento Trazable | Descripción Técnica |
| :--- | :--- | :--- | :--- | :---: | :--- |
| **CU-501** | Solicitar Borrador de Informe de Incidente | Equipo de Formación, Gemini Flash | Caso Base | RF-12 | Petición a Gemini Flash para generar borrador estructurado en formato JSON. |
| **CU-502** | Ejecutar Pipeline DLP (Sanitización PII) | Sistema | `<<include>>` de CU-501 | RNF-09 | Enmascara nombres por roles sintácticos y elimina RUTs/domicilios (Ley 19.628). |
| **CU-503** | Editar Modularmente Borrador (Human-in-the-Loop) | Equipo de Formación | Caso Base | RF-13 | Interfaz interactiva para modificar secciones, regenerar o aprobar el texto. |
| **CU-504** | Oficializar Reporte con Código Verificador | Directivo | Caso Base | RF-14 | Emisión de PDF oficial inmutable con código criptográfico y bloques de firma. |
| **CU-505** | Evaluar Riesgo Conductual Predictivo | Equipo de Formación | Caso Base | RF-15 | Correlación de faltas, temporalidad y PIE para predecir focos de violencia. |
| **CU-506** | Generar Plan de Acción Formativo / Restaurativo | Gemini Flash | `<<extend>>` de CU-505 | RF-16 | Sugerencia automática de intervenciones psicosociales no punitivas ante alto riesgo. |
| **CU-507** | Activar Degradación Grácil (Circuit Breaker) | Sistema | `<<extend>>` de CU-501 | RNF-12 | Ante caída de API (HTTP 429/500), ofrece plantillas locales sin bloquear al usuario. |

---

## 9. PKG-06: CIERRE DE AÑO ESCOLAR Y PROMOCIÓN DE ESTUDIANTES

### 9.1 Diagrama de Casos de Uso (PlantUML)

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false

actor "Administrador" as Admin
actor "Directivo\n(Director / UTP)" as Dir

rectangle "SIGA Escolar: Cierre de Año Escolar y Promoción" {
  usecase "Consultar Estado del\nPeríodo Lectivo Activo" as CU601
  usecase "Generar Propuesta Algorítmica\nde Promoción" as CU602
  usecase "Ajustar Nómina y\nEstados Finales de Alumnos" as CU603
  usecase "Configurar Cursos y\nJefaturas Proyectadas" as CU604
  usecase "Ejecutar Cierre de Año\ny Promoción Masiva" as CU605
}

Admin --> CU601
Admin --> CU602
Admin --> CU603
Admin --> CU604
Admin --> CU605
Dir --> CU601
Dir --> CU605

CU602 ..> CU601 : <<include>>
CU605 ..> CU603 : <<include>>
CU605 ..> CU604 : <<include>>
@enduml
```

### 9.2 Tabla de Especificación Técnica

| Código | Caso de Uso | Actores | Tipo / Relación | Requerimiento Trazable | Descripción Técnica |
| :--- | :--- | :--- | :--- | :---: | :--- |
| **CU-601** | Consultar Estado del Período Activo | Administrador, Directivo | Caso Base | Módulo Cierre | Obtiene resumen del año vigente, total de alumnos por curso y fechas lectivas. |
| **CU-602** | Generar Propuesta Algorítmica de Promoción | Administrador | `<<include>>` de CU-601 | Módulo Cierre | Aplica la secuencia oficial del MINEDUC (`SECUENCIA_NIVELES`) para sugerir pases de curso. |
| **CU-603** | Ajustar Nómina y Estados Finales | Administrador | Caso Base | Módulo Cierre | Pestañas interactivas para modificar el estado final de alumnos antes de sellar el año. |
| **CU-604** | Configurar Cursos y Jefaturas Proyectadas | Administrador | Caso Base | Módulo Cierre | Estructura los cursos del año entrante y asocia docentes a sus jefaturas. |
| **CU-605** | Ejecutar Cierre de Año y Promoción Masiva | Administrador, Directivo | Caso Base | Módulo Cierre | Transacción atómica en Supabase: archiva período anterior, crea nuevo año y promueve nómina. |

---

## 10. PKG-07: CONFIGURACIÓN INSTITUCIONAL, NOTIFICACIONES Y ANALÍTICA AVANZADA

### 10.1 Diagrama de Casos de Uso (PlantUML)

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false

actor "Administrador" as Admin
actor "Usuario Escolar" as User
actor "Equipo de Formación /\nDirectivo" as EF

rectangle "SIGA Escolar: Configuración, Notificaciones y Analítica Avanzada" {
  usecase "Configurar Parámetros\ndel Establecimiento" as CU701
  usecase "Parametrizar Reglas y\nUmbrales de Alerta" as CU702
  usecase "Consultar Notificaciones\nIn-App" as CU703
  usecase "Marcar Notificaciones\ncomo Leídas" as CU704
  usecase "Buscar Globalmente\nen el Sistema" as CU705
  usecase "Explorar Mapa de Calor\nde Incidentes" as CU706
  usecase "Auditar Métricas de\nTiempo de Resolución" as CU707
}

Admin --> CU701
Admin --> CU702
User --> CU703
User --> CU704
User --> CU705
EF --> CU706
EF --> CU707
@enduml
```

### 10.2 Tabla de Especificación Técnica

| Código | Caso de Uso | Actores | Tipo / Relación | Requerimiento Trazable | Descripción Técnica |
| :--- | :--- | :--- | :--- | :---: | :--- |
| **CU-701** | Configurar Parámetros del Establecimiento | Administrador | Caso Base | RF-02, RNF-10 | Gestión de RBD, datos de Rectoría, Coordinación, membrete y logotipo escolar. |
| **CU-702** | Parametrizar Reglas y Umbrales de Alerta | Administrador | Caso Base | RF-07, RNF-10 | Ajuste de tolerancias de inactividad, plazos fatales y ponderadores de riesgo. |
| **CU-703** | Consultar Notificaciones In-App | Usuario Escolar | Caso Base | RF-07 | Centro de avisos y campanita superior con contador reactivo de no leídas. |
| **CU-704** | Marcar Notificaciones como Leídas | Usuario Escolar | Caso Base | RF-07 | Actualización de estado de alertas y descartes individuales o masivos. |
| **CU-705** | Buscar Globalmente en el Sistema | Usuario Escolar | Caso Base | RNF-09 | Barra Omnibox en el header para localizar estudiantes por RUT, nombre o incidentes. |
| **CU-706** | Explorar Mapa de Calor de Incidentes | Equipo Formación, Directivo | Caso Base | RF-10 | Matriz analítica Curso vs. Mes escolar para detectar patrones temporales de conflicto. |
| **CU-707** | Auditar Métricas de Tiempo de Resolución | Equipo Formación, Directivo | Caso Base | RF-10 | Indicadores de cumplimiento de SLA y días promedio de tramitación de protocolos RICE. |

---

## 11. PKG-08: MEDIACIÓN ESCOLAR Y ACUERDOS RESTAURATIVOS (SPRINT 7.2)

### 11.1 Diagrama de Casos de Uso (PlantUML)

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false

actor "Equipo de Formación\n(Dupla / Convivencia)" as EF
actor "Docente\n(Profesor Jefe / Mediador)" as Doc
actor "Directivo" as Dir

rectangle "SIGA Escolar: Mediación y Acuerdos Restaurativos" {
  usecase "Abrir Proceso de\nMediación Escolar" as CU801
  usecase "Validar Vinculación de\nEstudiantes a Conflicto" as CU802
  usecase "Pactar Compromisos\nRestaurativos y Acuerdos" as CU803
  usecase "Emitir y Firmar Acta\nde Mediación en PDF" as CU804
  usecase "Evaluar Cumplimiento\ny Cerrar Mediación" as CU805
  usecase "Derivar a Protocolo RICE\npor Ruptura de Acuerdos" as CU806
}

EF --> CU801
Doc --> CU801
EF --> CU803
EF --> CU804
EF --> CU805
Dir --> CU805

CU801 ..> CU802 : <<include>>
CU804 ..> CU803 : <<include>>
CU806 ..> CU805 : <<extend>>
@enduml
```

### 11.2 Tabla de Especificación Técnica

| Código | Caso de Uso | Actores | Tipo / Relación | Épica / Requerimiento | Descripción Técnica |
| :--- | :--- | :--- | :--- | :---: | :--- |
| **CU-801** | Abrir Proceso de Mediación Escolar | Equipo Formación, Docente Mediador | Caso Base | Épica 7.2 (HU 7.2.1) | Genera expediente de mediación voluntaria con folio correlativo único `MED-2026-XXXX`. |
| **CU-802** | Validar Vinculación de Estudiantes a Conflicto | Sistema | `<<include>>` de CU-801 | Épica 7.2 | Comprueba que los estudiantes pertenezcan al mismo curso o tengan antecedentes en bitácora. |
| **CU-803** | Pactar Compromisos Restaurativos y Acuerdos | Equipo Formación | Caso Base | Épica 7.2 | Registro estructurado de compromisos formativos, tareas reparatorias y plazos de revisión. |
| **CU-804** | Emitir y Firmar Acta de Mediación en PDF | Equipo Formación | `<<include>>` de CU-803 | Épica 7.2 | Compila PDF oficial con PDFKit conteniendo acuerdos, fecha de seguimiento y firmas de partes. |
| **CU-805** | Evaluar Cumplimiento y Cerrar Mediación | Equipo Formación, Directivo | Caso Base | Épica 7.2 | Cierre formal tras sesión de seguimiento a 15/30 días marcando estado `RESUELTA`. |
| **CU-806** | Derivar a Protocolo RICE por Ruptura | Sistema / Equipo Formación | `<<extend>>` de CU-805 | Épica 7.2, RF-08 | *Punto de extensión:* Incumplimiento reiterado o agresión grave posterior. Dispara flujo RICE. |

---

## 12. PKG-09: DINÁMICAS SOCIOEMOCIONALES Y COLABORACIÓN EXTERNA (SPRINT 8)

### 12.1 Diagrama de Casos de Uso (PlantUML)

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false

actor "Equipo de Formación\n(Psicólogo / Convivencia)" as EF
actor "Directivo" as Dir
actor "Especialista Externo\n(Neurólogo / Psiquiatra)" as Medico

rectangle "SIGA Escolar: Sociograma y Perfil Especialistas" {
  usecase "Visualizar Sociograma\nDinámico de Curso" as CU901
  usecase "Filtrar Red Socioemocional\npor Rango Temporal" as CU902
  usecase "Exportar Perfil Escolar\npara Especialistas" as CU903
  usecase "Ejecutar Sanitización DLP\npara Clínicos Externos" as CU904
}

EF --> CU901
Dir --> CU901
EF --> CU903

CU903 --> Medico

CU902 ..> CU901 : <<extend>>
CU903 ..> CU904 : <<include>>
@enduml
```

### 12.2 Tabla de Especificación Técnica

| Código | Caso de Uso | Actores | Tipo / Relación | Épica / Requerimiento | Descripción Técnica |
| :--- | :--- | :--- | :--- | :---: | :--- |
| **CU-901** | Visualizar Sociograma Dinámico de Curso | Equipo Formación, Directivo | Caso Base | Épica 8 (HU 8.1.1) | Renderiza grafo interactivo de nodos (alumnos) y aristas ponderadas por co-ocurrencias en incidentes. |
| **CU-902** | Filtrar Red Socioemocional por Rango Temporal | Equipo Formación | `<<extend>>` de CU-901 | Épica 8 | Permite filtrar la red por mes, semestre o año para ver la evolución de alianzas y tensiones. |
| **CU-903** | Exportar Perfil Escolar para Especialistas | Equipo Formación, Especialista Externo | Caso Base | Épica 8 (HU 8.2) | Genera informe clínico-conductual estandarizado para neurólogos y psicólogos tratantes. |
| **CU-904** | Ejecutar Sanitización DLP para Clínicos | Sistema | `<<include>>` de CU-903 | RNF-09, Ley 19.628 | Anonimiza nombres de terceros y compañeros involucrados, protegiendo la privacidad de menores. |

---

## 13. PKG-10: CITACIONES FORMATIVAS Y ALIANZA FAMILIA-ESCUELA (SPRINT 10)

### 13.1 Diagrama de Casos de Uso (PlantUML)

```plantuml
@startuml
skinparam packageStyle rectangle
skinparam shadowing false

actor "Docente\n(Profesor Jefe)" as Doc
actor "Equipo de Formación" as EF
actor "Directivo" as Dir
actor "Apoderado\n<<Móvil sin Login>>" as Apod

rectangle "SIGA Escolar: Citaciones Formativas y Alianza Familiar" {
  usecase "Programar Citación de\nColaboración Formativa" as CU1001
  usecase "Despachar Colilla Digital\ny Token Seguro" as CU1002
  usecase "Confirmar o Justificar\nAsistencia vía Móvil" as CU1003
  usecase "Registrar Compromisos\nMutuos Familia-Escuela" as CU1004
  usecase "Emitir Acta Oficial de\nCitación en PDF" as CU1005
  usecase "Monitorear Métricas de\nAdherencia Parental" as CU1006
}

Doc --> CU1001
EF --> CU1001
Apod --> CU1003
Doc --> CU1004
Doc --> CU1005
Dir --> CU1006

CU1001 ..> CU1002 : <<include>>
CU1005 ..> CU1004 : <<include>>
@enduml
```

### 13.2 Tabla de Especificación Técnica

| Código | Caso de Uso | Actores | Tipo / Relación | Épica / Requerimiento | Descripción Técnica |
| :--- | :--- | :--- | :--- | :---: | :--- |
| **CU-1001** | Programar Citación Formativa | Docente, Equipo Formación | Caso Base | Épica 10 (HU 10.1) | Genera citación con folio `CIT-2026-XXXX`, motivo formativo positivo y fecha tentativa. |
| **CU-1002** | Despachar Colilla Digital y Token Seguro | Sistema | `<<include>>` de CU-1001 | Épica 10 | Genera token criptográfico temporal de 72h y despacha email con enlace responsive sin login. |
| **CU-1003** | Confirmar o Justificar Asistencia vía Móvil | Apoderado (Móvil) | Caso Base | Épica 10 (HU 10.1) | Interfaz pública móvil de 1-clic para confirmar asistencia o solicitar reprogramación de fecha. |
| **CU-1004** | Registrar Compromisos Mutuos Familia-Escuela | Docente | Caso Base | Épica 10 (HU 10.2) | Acta digital de la reunión con acuerdos bidireccionales (compromisos del colegio y del hogar). |
| **CU-1005** | Emitir Acta Oficial de Citación en PDF | Docente | `<<include>>` de CU-1004 | Épica 10 | Generación del documento formal con membrete del colegio y espacios de firma presencial. |
| **CU-1006** | Monitorear Métricas de Adherencia Parental | Directivo | Caso Base | Épica 10 (HU 10.3) | Dashboard analítico que mide la tasa de asistencia de apoderados por curso y ciclo escolar. |

---

## 14. GUÍA PARA EL MODELADOR VISUAL (COMPAÑERO DE EQUIPO)

Para generar los diagramas visuales en **Draw.io / diagrams.net**:

1. Abrir **Draw.io**.
2. En la barra superior o menú izquierdo hacer clic en:  
   👉 **`+` (Insertar) $\rightarrow$ `Avanzado` $\rightarrow$ `PlantUML`**.
3. Copiar el bloque `@startuml ... @enduml` del paquete deseado y pegarlo en el cuadro de diálogo.
4. Presionar el botón **Insertar**.
5. **Resultado automático:** Draw.io creará los actores con su figura reglamentaria (*stick figure*), los casos de uso como óvalos vectoriales con texto centrado limpio (sin códigos que saturen la vista), y las relaciones `<<include>>` y `<<extend>>` con líneas punteadas y estereotipos oficiales.
