# Protocolo y Guía de Pruebas de Aceptación del Usuario (UAT)
**Proyecto:** SIGA Escolar (Sistema Integral de Gestión y Acompañamiento Escolar)  
**Beneficiario:** Escuela Coeducacional N° 1 El Salvador  
**Coordinadora UAT:** Claudia Infante Soto  
**Participantes Evaluadores:** Equipo Directivo, Inspectoría General y Convivencia Escolar  
**Versión:** 1.0 (Validación Final de Sistema)  

---

## 1. INTRODUCCIÓN Y METODOLOGÍA UAT
Las pruebas de aceptación del usuario (**User Acceptance Testing — UAT**) tienen como propósito validar que SIGA Escolar cumple a cabalidad con las necesidades cotidianas del establecimiento y con las exigencias del Reglamento Interno de Convivencia Escolar (RICE).

Cada prueba se ejecutará en una sesión guiada por **Claudia Infante Soto**, donde los funcionarios del colegio interactuarán directamente con la plataforma a través de los casos de uso definidos a continuación.

---

## 2. GUÍA PASO A PASO DE PRUEBAS EN TERRENO

### CASO DE PRUEBA UAT-01: Acceso, Navegación y Perfil de Usuario
* **Objetivo:** Verificar ingreso seguro, roles y visualización del perfil institucional.
* **Pasos:**
  1. Ingresar a la URL del sistema e iniciar sesión con credenciales de **Inspector General**.
  2. Observar la barra superior: verificar avatar con foto institucional y badge de rol.
  3. Ir a *Gestión de Usuarios* y editar la fotografía de perfil propia.
* **Criterio de Aceptación:** El sistema autentica sin errores y refleja el avatar en toda la interfaz en tiempo real.
* **Resultado:** `[ ] Conforme` | `[ ] No Conforme` | Observaciones: __________________

---

### CASO DE PRUEBA UAT-02: Directorio de Estudiantes y Ficha Integral
* **Objetivo:** Localizar estudiantes, validar programa PIE y revisar historial formativo.
* **Pasos:**
  1. Navegar al menú *Estudiantes*.
  2. Filtrar por curso (ej. *7° Básico A*) y buscar un alumno por su RUT o apellido.
  3. Verificar que los alumnos pertenecientes al Programa de Integración Escolar muestren su distintivo **PIE**.
  4. Hacer clic en *"Ver Ficha"* para examinar el historial cronológico y datos del apoderado.
* **Criterio de Aceptación:** Búsqueda rápida (< 1 seg), datos fidedignos y visualización clara del expediente.
* **Resultado:** `[ ] Conforme` | `[ ] No Conforme` | Observaciones: __________________

---

### CASO DE PRUEBA UAT-03: Registro y Gestión de Incidente de Convivencia
* **Objetivo:** Registrar una situación conflictiva asociando múltiples involucrados según protocolo RICE.
* **Pasos:**
  1. Hacer clic en *"Nuevo Incidente"*.
  2. Seleccionar fecha, lugar del hecho y tipo de abordaje (ej. *Maltrato entre pares*).
  3. Definir gravedad como **Grave** o **Gravísima**.
  4. Redactar el relato fáctico y registrar las medidas inmediatas de resguardo adoptadas.
  5. Vincular a dos estudiantes del colegio, indicando quién asume el rol de afectado y de agresor.
  6. Guardar el incidente.
* **Criterio de Aceptación:** El incidente queda registrado en la bitácora, genera alerta inmediata y aparece en la ficha de ambos estudiantes.
* **Resultado:** `[ ] Conforme` | `[ ] No Conforme` | Observaciones: __________________

---

### CASO DE PRUEBA UAT-04: Activación y Trazabilidad de Protocolo RICE
* **Objetivo:** Iniciar un protocolo normativo de la Superintendencia y registrar avances de etapas.
* **Pasos:**
  1. En el incidente registrado, presionar *"Activar Protocolo RICE"*.
  2. Seleccionar el protocolo correspondiente (ej. *Protocolo de Agresiones Físicas o Psicológicas*).
  3. Cambiar el estado de *En Investigación* a *Derivado* agregando la observación requerida.
  4. Verificar el semáforo de días hábiles transcurridos.
* **Criterio de Aceptación:** El protocolo queda abierto con trazabilidad inmutable de usuario y fecha.
* **Resultado:** `[ ] Conforme` | `[ ] No Conforme` | Observaciones: __________________

---

### CASO DE PRUEBA UAT-05: Asistente IA, Human-in-the-Loop y Reporte Oficial PDF
* **Objetivo:** Generar informe pedagógico con apoyo de IA y emitir documento formal para apoderado.
* **Pasos:**
  1. En el detalle del incidente, seleccionar a un estudiante involucrado y pulsar *"Asistente IA - Redactar Informe"*.
  2. Revisar la propuesta redactada por Gemini Flash: comprobar que anonimiza datos sensibles y mantiene tono formativo.
  3. Modificar o complementar el texto según el criterio del profesional.
  4. Aprobar el informe con firma digital institucional.
  5. Presionar *"Descargar PDF Oficial"*.
* **Criterio de Aceptación:** Se descarga un PDF impecable con membrete oficial de la Escuela Coeducacional N° 1 El Salvador, firmas y formato institucional.
* **Resultado:** `[ ] Conforme` | `[ ] No Conforme` | Observaciones: __________________

---

### CASO DE PRUEBA UAT-06: Analítica Estratégica y Mapa de Calor por Cursos
* **Objetivo:** Evaluar la nueva herramienta de inteligencia preventiva de clima escolar.
* **Pasos:**
  1. Navegar a *Analítica*.
  2. Visualizar la pestaña *"Mapa de Calor por Cursos"*.
  3. Verificar la matriz de cursos (Pre-Kínder a 8° Básico) por meses (Marzo a Diciembre).
  4. Probar los filtros por Ciclo (*Parvularia*, *1° Ciclo*, *2° Ciclo*).
  5. Hacer clic en una celda roja o amarilla para abrir el modal de **Diagnóstico Pedagógico**.
  6. Comprobar que el modal desglosa tipologías, severidad y sugerencias de convivencia sin exponer nombres de menores.
* **Criterio de Aceptación:** Matriz clara, navegación fluida y diagnóstico útil para la toma de decisiones del Consejo de Profesores.
* **Resultado:** `[ ] Conforme` | `[ ] No Conforme` | Observaciones: __________________

---

## 3. ACTA DE CONFORMIDAD FINAL (UAT)

Habiéndose ejecutado las pruebas de aceptación del usuario en dependencias de la **Escuela Coeducacional N° 1 El Salvador**, los representantes del establecimiento certifican que el sistema **SIGA Escolar**:

1. Cumple con los requerimientos funcionales y normativos acordados.
2. Resguarda de forma segura los datos personales y escolares de los estudiantes.
3. Se encuentra en condiciones de operar en régimen regular.

| Rol Evaluador | Nombre y Apellidos | Firma / V°B° | Fecha |
| :--- | :--- | :---: | :---: |
| **Director(a)** | | | |
| **Inspector(a) General** | | | |
| **Encargado(a) Convivencia** | | | |
| **Coordinadora QA / UAT** | Claudia Infante Soto | | |
