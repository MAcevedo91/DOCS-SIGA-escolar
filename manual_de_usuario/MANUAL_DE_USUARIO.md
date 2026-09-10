# Manual de Usuario del Sistema SIGA Escolar
## Sistema Integral de Gestión y Acompañamiento Escolar

**Establecimiento:** Escuela Coeducacional N°1 El Salvador  
**Público objetivo:** Equipo Directivo, Coordinación de Convivencia Escolar, Inspectores, Docentes y Personal Administrativo  
**Acceso Web:** `https://siga-frontend-delta-six.vercel.app`  
**Versión del Manual:** 1.0 (Actualización continua con cada nueva funcionalidad)

---

## 📌 Tabla de Contenidos

1. [Introducción y Bienvenida](#1-introducción-y-bienvenida)
2. [Perfiles de Usuario y Permisos](#2-perfiles-de-usuario-y-permisos)
3. [Cómo Ingresar al Sistema (Inicio de Sesión)](#3-cómo-ingresar-al-sistema-inicio-de-sesión)
4. [El Panel de Control (Dashboard Principal)](#4-el-panel-de-control-dashboard-principal)
5. [Directorio de Estudiantes y Expediente Conductual](#5-directorio-de-estudiantes-y-expediente-conductual)
6. [Cómo Descargar el Historial de un Alumno en PDF](#6-cómo-descargar-el-historial-de-un-alumno-en-pdf)
7. [Cómo Registrar un Incidente de Convivencia](#7-cómo-registrar-un-incidente-de-convivencia)
8. [Seguimiento y Cierre de Incidentes](#8-seguimiento-y-cierre-de-incidentes)
9. [Gestión de Protocolos Normativos RICE](#9-gestión-de-protocolos-normativos-rice)
10. [Módulo de Asistencia Escolar](#10-módulo-de-asistencia-escolar)
11. [Importación Masiva de Alumnos (Uso Administrativo)](#11-importación-masiva-de-alumnos-uso-administrativo)
12. [Gestión de Usuarios del Establecimiento](#12-gestión-de-usuarios-del-establecimiento)
13. [Configuración de Plazos y Reglas Escolares](#13-configuración-de-plazos-y-reglas-escolares)
14. [Preguntas Frecuentes y Solución de Problemas](#14-preguntas-frecuentes-y-solución-de-problemas)

---

## 1. Introducción y Bienvenida

**SIGA Escolar** es la plataforma oficial diseñada especialmente para la **Escuela Coeducacional N°1 El Salvador** con el propósito de simplificar, agilizar y transparentar la gestión de la convivencia escolar.

A través de este sistema podrás:
- Registrar hechos ocurridos en el patio o salas de clases de manera inmediata desde cualquier computador o tablet.
- Localizar en segundos el historial de cualquier estudiante sin necesidad de buscar carpetas físicas en papel.
- Cumplir rigurosamente con los plazos y pasos exigidos por la **Superintendencia de Educación** en los protocolos del Reglamento Interno de Convivencia Escolar (RICE).
- Emitir fichas e informes con membrete oficial del colegio listos para imprimir y firmar en entrevistas con apoderados.

---

## 2. Perfiles de Usuario y Permisos

Para proteger la privacidad de los menores y resguardar la información sensible, cada funcionario cuenta con un perfil de acceso adecuado a sus funciones en la escuela:

| Perfil / Cargo | ¿Qué puede hacer en SIGA Escolar? |
|---|---|
| **Directivo** | Visualiza estadísticas globales del colegio, consulta fichas de alumnos, monitorea protocolos activos y descarga informes oficiales. |
| **Equipo de Formación / Convivencia** | Administra protocolos RICE, da seguimiento a medidas pedagógicas, registra incidentes y coordina derivaciones psicosociales o externas. |
| **Inspector** | Registra incidentes ocurridos durante la jornada, busca antecedentes de alumnos y revisa alertas conductuales activas. |
| **Docente** | Consulta la nómina de sus cursos, revisa antecedentes de apoyo pedagógico y registra observaciones de aula o asistencia. |
| **Administrador** | Gestiona las cuentas de los funcionarios, realiza la carga masiva de nóminas de estudiantes y configura los parámetros generales del colegio. |

---

## 3. Cómo Ingresar al Sistema (Inicio de Sesión)

1. Abre tu navegador web favorito (Google Chrome, Mozilla Firefox, Microsoft Edge o Safari).
2. Ingresa a la dirección oficial: **`https://siga-frontend-delta-six.vercel.app`**
3. En la pantalla de bienvenida verás el logotipo de la escuela y dos casillas:
   - **Email:** Escribe tu correo electrónico institucional (ejemplo: `nombre@sigaescolar.cl` o tu correo registrado).
   - **Contraseña:** Escribe tu clave secreta. Puedes hacer clic en el ícono del ojo 👁️ para verificar lo que escribiste.
4. Haz clic en el botón azul **"Acceder"**.

> 💡 **Consejo de Seguridad:**
> - El sistema cuenta con protección automática: si se ingresa la contraseña equivocada **5 veces consecutivas**, la cuenta se bloqueará por 15 minutos por seguridad.
> - Al terminar tu jornada de trabajo o si te levantas del computador, recuerda siempre hacer clic en tu nombre (arriba a la derecha) y seleccionar **"Cerrar Sesión"**.

---

## 4. El Panel de Control (Dashboard Principal)

Al iniciar sesión, la primera pantalla que verás es el **Dashboard**. Aquí se resume el estado de la convivencia del colegio en tiempo real:

### A. Tarjetas de Resumen
- **Total de Incidentes:** Cantidad total de situaciones registradas durante el año lectivo.
- **Incidentes Graves / Gravísimos:** Casos prioritarios que requieren atención de directivos o convivencia.
- **Protocolos RICE Activos:** Procedimientos normativos que están actualmente en proceso.
- **Estudiantes en Seguimiento:** Alumnos que cuentan con medidas formativas en desarrollo.

### B. Semáforo de Urgencia y Acciones Pendientes
El sistema calcula automáticamente cuántos días faltan para que venza cada etapa de un protocolo según las exigencias del Mineduc:
- 🟢 **Verde (En Plazo):** El caso se encuentra con tiempo suficiente para ser atendido.
- 🟡 **Amarillo (Por Vencer):** Quedan menos de 3 días para cumplir con el plazo normativo.
- 🔴 **Rojo (Urgente / Vencido):** El plazo expiró o vence hoy; requiere acción inmediata del equipo de convivencia.

### C. Gráficos Estadísticos (Para Directivos y Coordinación)
- **Incidentes por Curso:** Permite identificar qué niveles requieren talleres de refuerzo o mediación grupal.
- **Distribución por Gravedad:** Muestra el porcentaje de incidentes Leves, Graves y Gravísimos.
- **Tendencia Mensual:** Permite evaluar si las medidas preventivas han disminuido los casos mes a mes.

---

## 5. Directorio de Estudiantes y Expediente Conductual

Para consultar los antecedentes de un alumno:

1. En el menú lateral izquierdo, haz clic en **"Directorio Estudiantes"**.
2. **Cómo buscar un estudiante:**
   - Escribe en la barra de búsqueda el apellido, nombre o RUT del estudiante.
   - *Nota práctica:* No te preocupes por los acentos ni mayúsculas (si escribes `perez`, el sistema encontrará a `Pérez` sin problemas).
   - Si prefieres, puedes filtrar directamente por curso (ejemplo: `7° Básico A`).
3. **Ver la ficha personal:**
   - Haz clic sobre la fila o nombre del estudiante.
   - Se abrirá el **Expediente del Estudiante**, donde verás:
     - Foto o avatar identificatorio.
     - Datos personales, curso actual, RUT y fecha de nacimiento.
     - Antecedentes del **Apoderado Titular** (nombre, teléfono y correo de contacto).
     - **Línea de tiempo:** Historial cronológico de todos los incidentes, abordajes pedagógicos y protocolos en los que ha participado el alumno.

---

## 6. Cómo Descargar el Historial de un Alumno en PDF

Cuando necesites citar a un apoderado o sostener una reunión de equipo:

1. Ingresa a la ficha del estudiante siguiendo los pasos del punto 5.
2. En la esquina superior derecha de la ficha, haz clic en el botón **"Descargar historial PDF"**.
3. El sistema generará automáticamente un documento PDF que incluye:
   - Membrete oficial de la Escuela Coeducacional N°1 El Salvador.
   - Datos completos del alumno y curso.
   - Resumen cronológico de los incidentes registrados, fechas, tipos de abordaje y medidas adoptadas.
   - Espacio final formal para las firmas de:
     - Coordinador(a) de Convivencia Escolar.
     - Director(a) del Establecimiento.
     - Apoderado(a) o tutor legal.
4. Puedes imprimirlo directamente o guardarlo en tu equipo.

---

## 7. Cómo Registrar un Incidente de Convivencia

Cualquier situación relevante ocurrida en recreo, entrada, salida o aula debe ser registrada a la brevedad:

1. En el menú lateral, haz clic en **"Registro Incidentes"** y luego pulsa el botón **"+ Nuevo Incidente"**.
2. **Paso 1: Datos Generales**
   - **Fecha del Suceso:** Selecciona la fecha en que ocurrió (por defecto viene la fecha de hoy).
   - **Tipo de Abordaje:** Selecciona cómo se intervino la situación (ej. *Entrevista individual, Mediación escolar, Citación apoderado, Registro de patio, Derivación psicosocial*).
   - **Gravedad:**
     - ⚪ **Leve:** Faltas menores que se resuelven con diálogo pedagógico o amonestación verbal.
     - 🟠 **Grave:** Faltas que alteran reiteradamente la convivencia o implican agresiones verbales/físicas moderadas.
     - 🔴 **Gravísima:** Agresiones físicas severas, porte de objetos peligrosos, acoso escolar grave o vulneración de derechos.
3. **Paso 2: Selección de Estudiantes Involucrados**
   - Puedes usar dos modalidades muy sencillas:
     - **Navegación en Cascada (Recomendado):** Selecciona el Nivel (ej: `7° Básico`) $\rightarrow$ la Letra (ej: `A`) $\rightarrow$ marca a los alumnos correspondientes de la lista.
     - **Búsqueda Rápida:** Escribe directamente el nombre o apellido del alumno para agregarlo.
   - Para cada alumno seleccionado, indica su rol en la situación (*Víctima, Involucrado / Agresor, Testigo*).
4. **Paso 3: Relato de los Hechos**
   - Describe con claridad y objetividad lo sucedido (mínimo 20 caracteres). Evita juicios personales y concéntrate en los hechos observables.
5. **Paso 4: Medidas Pedagógicas Adoptadas**
   - Detalla qué acciones formativas o reparatorias inmediatas se tomaron con los estudiantes.
6. Haz clic en **"Registrar Incidente"**.

> ⚠️ **Notificación Inmediata:** Si el incidente es marcado como **Grave** o **Gravísimo**, el sistema emite una alerta visual destacada y notifica de manera automática al Coordinador de Convivencia y al Equipo Directivo.

---

## 8. Seguimiento y Cierre de Incidentes

Los incidentes no son solo un registro estático; tienen un ciclo de vida para asegurar que ningún caso quede en el olvido:

1. En el listado de **"Incidentes"**, haz clic sobre el incidente que deseas revisar.
2. En la sección superior verás el estado actual del caso:
   - **En Investigación:** Se están recabando testimonios o entrevistando a las partes.
   - **Derivado:** El caso fue derivado a Dupla Psicosocial, Inspectoría General o Dirección.
   - **Cerrado:** Se cumplieron los compromisos formativos y se dio por finalizado el proceso.
3. Para cambiar el estado:
   - Selecciona el nuevo estado en el menú desplegable.
   - Escribe una breve observación justificando el avance.
   - Presiona **"Actualizar Estado"**.
   - *Regla de integridad:* El sistema no permite retroceder estados para mantener la transparencia cronológica del proceso.

---

## 9. Gestión de Protocolos Normativos RICE

Los Protocolos RICE son los procedimientos formales exigidos por la **Superintendencia de Educación**. 

### A. Cuándo abrir un Protocolo
Debe abrirse cuando un hecho califica dentro de las tipologías normativas (ej: *Maltrato entre estudiantes, Vulneración de derechos, Situaciones de drogas/alcohol, Acoso escolar cibernético, Agresiones sexuales*).

### B. Cómo abrir un nuevo Protocolo
1. Ve a **"Protocolos RICE"** y presiona **"+ Nuevo Protocolo"**.
2. **Tipo de Protocolo:** Selecciona uno de los 10 protocolos normativos de la lista oficial.
3. **Estudiante Involucrado:** Selecciona al estudiante afectado.
4. **Incidente de Origen:** Elige el incidente previamente registrado que motivó la activación del protocolo.
5. **Fecha de Apertura:** Fecha en que la escuela toma conocimiento formal.
6. **Observaciones Iniciales:** Registro de las primeras medidas de resguardo tomadas.
7. Haz clic en **"Crear Protocolo"**. El sistema calculará automáticamente los plazos máximos legales.

### C. Checklist de Pasos Obligatorios
Al entrar al detalle de cualquier protocolo, verás una **lista de chequeo paso a paso**:
- Medidas de protección inmediatas a la víctima.
- Comunicación y citación formal a los apoderados.
- Entrevistas reservadas con los involucrados.
- Derivación a redes de apoyo externas (si corresponde: CESFAM, OPD/OLN, Tribunales de Familia o Fiscalía).
- Informe de cierre y plan de acompañamiento.

Cada paso completado queda registrado con fecha, hora y el nombre del profesional que lo marcó, garantizando respaldo total ante eventuales fiscalizaciones de la Superintendencia.

---

## 10. Módulo de Asistencia Escolar

1. En el menú lateral, selecciona **"Asistencia"**.
2. Selecciona el curso y la fecha de la jornada.
3. El sistema desplegará la lista del curso:
   - Puedes marcar rápidamente a los presentes y registrar atrasos o inasistencias justificadas.
4. El sistema alertará sobre alumnos que acumulan inasistencias reiteradas para prevenir deserción escolar o vulneración del derecho a la educación.

---

## 11. Importación Masiva de Alumnos (Uso Administrativo)

Al inicio del año escolar o ante la llegada de nuevos estudiantes:

1. Ingresa con una cuenta con perfil **Administrador**.
2. Ve a **"Estudiantes"** y pulsa el botón **"Importar Nómina"**.
3. Descarga la plantilla de ejemplo (disponible en formato CSV o Excel).
4. Asegúrate de incluir las columnas básicas:
   - `RUT` (valida automáticamente el dígito verificador chileno con Módulo 11).
   - `Nombres` y `Apellidos`.
   - `Curso` (ejemplo: `1 Básico A`, `8 Básico B`).
   - `RUT Apoderado`, `Nombre Apoderado`, `Teléfono Apoderado`.
5. Arrastra o selecciona tu archivo y pulsa **"Procesar Nómina"**.
6. El sistema informará cuántos alumnos fueron creados, cuántos actualizados y si hubo algún RUT con formato inválido para su corrección.

---

## 12. Gestión de Usuarios del Establecimiento

El administrador del colegio puede crear y gestionar los accesos del personal:

1. Ve al módulo **"Gestión de Usuarios"**.
2. Haz clic en **"+ Nuevo Usuario"**.
3. Ingresa:
   - Nombre completo del funcionario.
   - Correo electrónico institucional.
   - Rol asignado (Directivo, Equipo Formación, Inspector o Docente).
   - Contraseña inicial temporal.
4. Presiona **"Guardar Usuario"**.
5. Si un funcionario deja de trabajar en el establecimiento, el administrador puede desactivar su cuenta con un solo clic, impidiendo su acceso inmediato sin borrar los incidentes que haya registrado históricamente.

---

## 13. Configuración de Plazos y Reglas Escolares

El equipo directivo y de convivencia puede ajustar los parámetros del colegio:

1. Ingresa a **"Configuración"** en el menú lateral.
2. Podrás modificar:
   - Los días hábiles límite asignados a cada tipo de protocolo RICE.
   - Los umbrales de alerta temprana para la detección de casos reiterados.
3. Haz clic en **"Guardar Cambios"**. Todas las reglas se actualizarán para los nuevos casos que se registren.

---

## 14. Preguntas Frecuentes y Solución de Problemas

#### 1. ¿Qué hago si olvidé mi contraseña?
Comunícate con el Administrador del colegio encargado de SIGA Escolar para que restablezca tu contraseña temporal desde el módulo de usuarios.

#### 2. Escribí mal un relato en un incidente, ¿puedo corregirlo?
Para mantener la validez legal del expediente, los incidentes no pueden ser borrados. Puedes ingresar al incidente y agregar una **nueva observación aclaratoria** que quedará registrada con tu nombre y fecha actual.

#### 3. No encuentro a un estudiante en el buscador
- Verifica si el alumno fue matriculado recientemente y si su curso ya fue cargado al sistema.
- Intenta buscarlo solo por su apellido paterno o por los primeros dígitos de su RUT sin puntos.

#### 4. ¿Puedo usar el sistema desde mi teléfono celular?
Sí. El sistema cuenta con diseño adaptable (*responsive*). Si abres la plataforma en tu teléfono, el menú se adaptará automáticamente para que puedas registrar incidentes de patio cómodamente mientras te desplazas por el establecimiento.

---

*Manual elaborado y mantenido por el equipo técnico de SIGA Escolar.*  
*Cualquier nueva función incorporada a la plataforma se documentará automáticamente en este archivo.*
