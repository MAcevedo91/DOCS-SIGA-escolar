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
10. [Importación Masiva de Alumnos (Uso Administrativo)](#10-importación-masiva-de-alumnos-uso-administrativo)
11. [Gestión de Usuarios del Establecimiento](#11-gestión-de-usuarios-del-establecimiento)
12. [Configuración de Plazos y Reglas Escolares](#12-configuración-de-plazos-y-reglas-escolares)
13. [Asistente de Redacción Normativa con IA (Gemini Flash) y Reportes Oficiales](#13-asistente-de-redacción-normativa-con-ia-gemini-flash-y-reportes-oficiales)
14. [Analítica Escolar y Mapa de Calor por Cursos (Evolución del Clima de Aula)](#14-analítica-escolar-y-mapa-de-calor-por-cursos-evolución-del-clima-de-aula)
15. [Cierre de Año Lectivo y Promoción de Cursos](#15-cierre-de-año-lectivo-y-promoción-de-cursos)
16. [Módulo de Mediación Escolar y Acuerdos Formativos (Enfoque Restaurativo)](#16-módulo-de-mediación-escolar-y-acuerdos-formativos-enfoque-restaurativo)
17. [Módulo Copiloto RAG Normativo RICE](#17-módulo-copiloto-rag-normativo-rice)
18. [Navegación Unificada y Acceso Rápido Permanente](#18-navegación-unificada-y-acceso-rápido-permanente)
19. [Sociograma Escolar y Redes de Convivencia de Aula (Matriz de Co-ocurrencias)](#19-sociograma-escolar-y-redes-de-convivencia-de-aula-matriz-de-co-ocurrencias)
20. [Expediente Escolar Sanitizado para Especialistas de Salud Externa](#20-expediente-escolar-sanitizado-para-especialistas-de-salud-externa)
21. [Preguntas Frecuentes y Solución de Problemas](#21-preguntas-frecuentes-y-solución-de-problemas)

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
| **Docente** | Consulta la nómina de sus cursos, revisa antecedentes de apoyo pedagógico (PIE), contactos de emergencia e historial conductual, y registra incidentes de aula directamente. |
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

Al iniciar sesión, la primera pantalla que verás es el **Panel Principal (Dashboard)**, estructurado en una sola plana sin necesidad de desplazamiento vertical para brindar máxima visibilidad operativa inmediata:

### A. Columna Izquierda: Acciones Pendientes y Acciones Rápidas
1. **Pizarra Activa de Acciones Pendientes (Pizarra Blanca):**
   - Muestra las alertas y medidas formativas urgentes simulando una pizarra blanca escolar esmaltada con notas adhesivas (post-its) cuadradas.
   - Si existen múltiples alertas, la pizarra cuenta con **desplazamiento vertical interno (scroll)** para consultar todas las notas sin alterar la altura fija de la pantalla.
   - Cada nota adhesiva detalla el nombre del estudiante, el motivo del protocolo, la tarea asignada y el semáforo normativo (`VENCIDO`, `POR VENCER` o `EN PLAZO`).
   - Al pie de la pizarra se ubica la leyenda explicativa del semáforo con enlaces directos para revisar todos los protocolos.
2. **Módulo de Acciones Rápidas:**
   - Ubicado en la base inferior izquierda, permite acceder con un solo clic a las dos acciones más críticas del sistema:
     - ⚠️ **Registrar Incidente:** Abre el formulario de ingreso inmediato de incidentes de convivencia.
     - 🛡️ **Activar Protocolo RICE:** Permite iniciar un protocolo formal ante situaciones tipificadas por la Superintendencia.

### B. Columna Derecha: Indicadores Clave y Clima Escolar por Cursos
1. **Tarjetas de Resumen (KPIs Superiores):**
   - **Incidentes Totales:** Total acumulado de situaciones de convivencia registradas en el año lectivo.
   - **Incidentes Graves:** Situaciones de alta prioridad que requieren intervención del equipo directivo.
   - **Protocolos RICE Activos:** Procedimientos normativos en tramitación con plazos perentorios en curso.
   - **Estudiantes en Seguimiento:** Alumnos con acuerdos o medidas formativas vigentes.
2. **Clima Escolar por Cursos (Mapa de Calor):**
   - Matriz mensual que cubre de Marzo a Diciembre, permitiendo identificar en tiempo real el estado de cada curso (Estable, En Alerta o Crítico).
   - Incluye filtros por año lectivo y por ciclo formativo (Parvularia, 1° Ciclo, 2° Ciclo).
   - Diagnóstico interactivo: al hacer clic sobre cualquier celda mensual, se abre el desglose de intervenciones del aula.
   - Cumple con la normativa de privacidad de datos agregados y anónimos (Ley N° 19.628).

> **Nota:** Todos los gráficos estadísticos detallados (tendencias temporales, distribución por gravedad y reincidencias) han sido centralizados en el módulo **Analítica** accesible desde el menú lateral.

---

## 5. Directorio de Cursos, Estudiantes y Expediente Conductual

El sistema cuenta con un flujo de navegación escolar jerárquico e intuitivo diseñado según la estructura pedagógica del colegio:  
**Inicio ➔ Cursos ➔ Estudiantes ➔ Perfil del Estudiante**

### A. Navegación Jerárquica Paso a Paso
1. **Paso 1: Inicio (Panel Principal)**  
   Desde el panel de bienvenida o cualquier pantalla, haz clic en el ítem **"Cursos"** en el menú lateral izquierdo (icono de birrete 🎓).
2. **Paso 2: Directorio de Cursos**  
   Accederás al catálogo visual de todos los cursos del año escolar (1° Básico a 8° Básico). Cada tarjeta muestra:
   - Nombre del curso y total de estudiantes matriculados.
   - Profesor Jefe asignado (o botón para asignarlo/cambiarlo con verificación de clave).
   - Indicadores de incidentes del año diferenciados por gravedad (Leve, Grave, Gravísima).
   - Para ingresar a la nómina, haz clic en cualquier tarjeta o en el enlace **"Ver estudiantes ↗"**.
3. **Paso 3: Nómina de Estudiantes del Curso**  
   Al seleccionar un curso, el sistema despliega el Hero Banner del curso con su Profesor Jefe, matrícula activa y alumnos con apoyo PIE. En la parte superior verás las migas de pan interactivas:  
   `Inicio > Cursos > Estudiantes`  
   - Puedes alternar entre vista de **Lista** y vista de **Tarjetas**.
   - Puedes exportar la nómina a **Excel** o **PDF**.
   - Para volver al directorio general en cualquier momento, pulsa sobre **"Cursos"** en las migas de pan o en el botón **"← Volver a cursos"**.
4. **Paso 4: Ficha y Perfil del Estudiante**  
   Al hacer clic en **"Ver Perfil"** o **"Ver Ficha del Estudiante"**, se abre el expediente completo del alumno con la ruta completa en las migas de pan:  
   `Inicio > Cursos > Estudiantes > Perfil {Nombre del Alumno}`  
   - Si pulsas en **"Estudiantes"** en las migas de pan o en **"← Volver a Estudiantes"**, volverás exactamente a la nómina del curso al que pertenece el estudiante.
   - Si pulsas en **"Cursos"**, regresarás al directorio general de todos los cursos.

### B. Búsqueda Rápida desde la Barra Superior (Navbar)
- En la cabecera superior de cualquier pantalla, escribe el nombre, apellido o RUT del alumno en el buscador global.
- Con solo **2 caracteres** se desplegará una ventana emergente en vivo con los resultados coincidentes y acceso directo a la ficha del estudiante.

### C. Expediente Personal del Estudiante
Al ingresar a la ficha del estudiante verás:
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

Cualquier situación relevante ocurrida en recreo, entrada, salida o aula debe ser registrada a la brevedad mediante la nueva interfaz moderna en 2 columnas:

1. En el menú lateral, haz clic en **"Registro Incidentes"** y luego pulsa el botón **"+ Nuevo Incidente"**.
2. **Estructura en Pantalla Dividida (2 Columnas):**
   - **Columna Izquierda (Tarjetas Temáticas con Gradientes):**
     - **1. Datos del Incidente (Azul/Índigo):**
       - **Tipo de Abordaje:** Selecciona directamente mediante cápsulas interactivas cómo se intervino la situación (ej. *Entrevista individual, Mediación escolar, Citación apoderado, Registro de patio, Derivación psicosocial*).
       - **Fecha del Suceso:** Selecciona la fecha del hecho.
       - **Gravedad Reglamentaria:**
         - ⚪ **Leve:** Faltas menores que se resuelven con diálogo pedagógico o amonestación verbal.
         - 🟠 **Grave:** Faltas que alteran reiteradamente la convivencia o implican agresiones verbales/físicas moderadas.
         - 🔴 **Gravísima:** Agresiones físicas severas, porte de objetos peligrosos, acoso escolar grave o vulneración de derechos.
     - **2. Estudiantes Involucrados (Verde Esmeralda/Teal):**
       - Agrega participantes mediante el **Selector en Cascada** (Nivel $\rightarrow$ Letra $\rightarrow$ Alumnos) o buscador directo.
       - Configura para cada alumno su condición de víctima y descargo individual, pudiendo quitarlos individualmente con el botón `×`.
     - **3. Relato y Medidas Adoptadas (Púrpura/Violeta):**
       - **Relato Objetivo:** Describe los hechos en tercera persona (mínimo 20 caracteres con contador reactivo).
       - **Medidas Formativas:** Detalla las acciones reparatorias inmediatas adoptadas.
   - **Columna Derecha (Barra Lateral Sticky de Control):**
     - **Progreso en Vivo:** Barra reactiva que avanza del 0% al 100% según completas los campos.
     - **Checklist de Requisitos:** Marca en verde el cumplimiento de abordaje, fecha, gravedad, estudiantes y relato.
     - **Resumen de Alumnos:** Lista compacta de los estudiantes seleccionados para verificación rápida.
3. **Confirmación Segura:**
   - Haz clic en **"Registrar Incidente"** (se habilita solo al completar los requisitos).
   - Se abrirá un **Modal de Confirmación** con el resumen del expediente. Revisa los datos y presiona **"Confirmar Registro"**.
   - Si pulsas "Cancelar" teniendo datos ingresados, un diálogo de seguridad te preguntará si deseas descartar para evitar pérdidas accidentales.

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

### 8.1 Informes Oficiales Diferenciados y Versionado (Sprint 6)
Para asegurar el estricto cumplimiento de la **Ley N° 19.628** de Protección de la Vida Privada y las directrices de la **Circular N° 482** de la Superintendencia de Educación:
- **Informes Individualizados por Estudiante:** Cuando un incidente involucra a dos o más alumnos, el sistema genera y almacena informes independientes para cada estudiante. Esto garantiza que cada apoderado reciba única y exclusivamente la información correspondiente a su pupilo sin divulgar datos sensibles ni vulnerar la privacidad de las otras partes.
- **Trazabilidad y Control de Versiones:** Los reportes cuentan con gestión de versiones estructuradas en 5 secciones normativas (Contexto, Hechos objetivos, Medidas adoptadas, Compromisos/Acuerdos y Plan de seguimiento). El borrador sugerido por IA se conserva inmutable, registrando quién realizó ediciones intermedias y quién efectuó la aprobación final.
- **Bloqueo Estricto tras Aprobación:** Una vez que un informe adquiere el estado **"Aprobado"**, el sistema bloquea cualquier edición posterior, garantizando que el documento descargado en PDF o despachado al apoderado sea inalterable y posea plena validez probatoria.

### 8.2 Derivaciones con Observaciones Individuales por Estudiante (Hallazgo 5)
En incidentes que involucran a múltiples alumnos (riñas, agresiones o conflictos entre pares), las medidas pedagógicas y de apoyo no son idénticas para cada estudiante. SIGA Escolar incorpora la gestión individualizada de derivaciones:
1. **Derivación al Cambiar de Estado:**
   - En el panel lateral derecho del caso, selecciona el estado **"Derivado"** y pulsa **"Actualizar Estado"**.
   - En el modal de confirmación, se desplegará automáticamente la sección *"Observaciones Individuales de Derivación por Alumno"*.
   - Por cada estudiante involucrado (mostrando si es víctima o agresor/involucrado), ingresa la medida o profesional asignado correspondiente (ej: *Estudiante A derivado a psicólogo por contención y desregulación; Estudiante B derivado a orientación y entrevista con apoderado*).
   - Presiona **"Confirmar Actualización"**. El estado del caso avanzará y las observaciones se guardarán de forma individual en el expediente de cada alumno.
2. **Edición o Agregado Puntual desde la Tarjeta del Estudiante:**
   - En la vista de detalle del incidente, cada estudiante cuenta con un recuadro azul donde se visualiza su observación individual de derivación.
   - El equipo de convivencia puede presionar **"Editar Observación"** (o **"+ Agregar Observación Individual"**) para actualizar o complementar la medida en cualquier momento sin necesidad de reiniciar el flujo del caso.
   - La información queda registrada con auditoría institucional y reflejada de inmediato en la ficha del caso.

---

## 9. Gestión de Protocolos Normativos RICE

Los Protocolos RICE son los procedimientos formales exigidos por la **Superintendencia de Educación**. 

### A. Cuándo abrir un Protocolo
Debe abrirse cuando un hecho califica dentro de las tipologías normativas reglamentarias del establecimiento (ej: *Acoso escolar*, *Ciberacoso*, *Maltrato entre adultos*, *Vulneración de derechos* —el cual canaliza denuncias graves, violencia intrafamiliar y agresiones sexuales conforme a la normativa educacional—, *Accidente escolar*, *Drogas o alcohol*, entre otras).

### B. Cómo abrir un nuevo Protocolo (Nueva Interfaz 2 Columnas)
1. Ve a **"Protocolos RICE"** y presiona **"+ Nuevo Protocolo"**.
2. **Formulario en Secciones Temáticas:**
   - **1. Clasificación RICE (Índigo/Azul):** Selecciona directamente la tipología reglamentaria mediante las cápsulas interactivas oficiales. Cada tipología incluye su definición orientadora para una rápida identificación pedagógica.
   - **2. Estudiante Titular (Esmeralda/Teal):** Elige al estudiante involucrado con el selector en cascada. El sistema evaluará automáticamente si existen alertas de escalada preventiva (`AlertaEscaladaBanner`) y mostrará su ficha con RUT y condición PIE.
   - **3. Fecha de Apertura y Antecedente Relacionado (Ámbar/Naranja):** Define la fecha de inicio formal y vincula opcionalmente incidentes previos del alumno con un solo clic.
   - **4. Observaciones y Diligencias Iniciales (Púrpura/Violeta):** Describe las primeras medidas de resguardo y antecedentes recibidos.
3. **Barra Lateral de Control:**
   - Supervisa el cumplimiento de los 5 requisitos normativos y el porcentaje de completitud en la barra reactiva.
4. **Confirmación y Activación:**
   - Haz clic en **"Aperturar Protocolo RICE"** y valida los antecedentes consolidados en el **Modal de Confirmación**. El sistema registrará el caso e iniciará el cómputo automático de plazos máximos legales.

### C. Checklist de Pasos Obligatorios y Evidencias Probatorias
Al entrar al detalle de cualquier protocolo, verás una **lista de chequeo paso a paso**:
- Medidas de protección inmediatas a la víctima.
- Comunicación y citación formal a los apoderados.
- Entrevistas reservadas con los involucrados.
- Derivación a redes de apoyo externas (si corresponde: CESFAM, OPD/OLN, Tribunales de Familia o Fiscalía).
- Informe de cierre y plan de acompañamiento.

#### Carga y Gestión de Archivos de Respaldo (Evidencias):
1. **Al Certificar un Paso:** Al presionar el botón **"Completar"**, el modal permite no solo ingresar la glosa u observación obligatoria, sino también **adjuntar directamente el documento probatorio** (PDF escaneado de citación firmada, acta de entrevista, informe médico o comprobante de derivación en formato PDF, Word o imagen de hasta 10 MB).
2. **Visualización y Descarga:** Cada evidencia adjunta aparece en la tarjeta del paso con su nombre oficial, tamaño en KB/MB y un botón directo para previsualizar o descargar el archivo en una pestaña segura.
3. **Incorporación Posterior:** Si el profesional requiere adjuntar documentos complementarios a un paso ya certificado, dispondrá del botón **"+ Adjuntar evidencia probatoria"** directamente en la tarjeta del paso mientras el caso continúe abierto.
4. **Descarga del Expediente Oficial RICE en PDF (Para Auditorías de la Superintendencia):**
   - En la cabecera superior de la ficha del caso, haz clic en el botón **"Descargar Expediente RICE (PDF)"**.
   - El sistema generará y descargará un documento institucional oficial que compila de forma consolidada:
     - **Carátula:** Folio oficial, tipo de protocolo, fechas de apertura y cierre, antecedentes del estudiante titular y contacto de su apoderado.
     - **Trazabilidad de Pasos:** Tabla con el detalle cronológico de cada paso normativo cumplido, fechas, observaciones y funcionario responsable.
     - **Anexo Probatorio de Evidencias:** Tabla forense que individualiza cada archivo respaldado en los pasos, fecha y hora de subida, tamaño en KB y profesional que lo certificó.
     - **Firma Única Institucional:** Bloque centrado exclusivo para la firma y timbre del/de la **Encargado(a) de Convivencia Escolar**, dando fe del debido proceso formativo ante los inspectores de la Superintendencia de Educación.

---

## 10. Importación Masiva de Alumnos (Uso Administrativo)

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

## 11. Gestión de Usuarios del Establecimiento

El administrador del colegio puede crear y gestionar los accesos y credenciales del personal escolar:

1. Ve al módulo **"Gestión de Usuarios"** en el menú lateral.
2. Haz clic en **"+ Nuevo Usuario"**.
3. Completa los antecedentes del funcionario:
   - **Foto de Perfil:** (Opcional) Haz clic en **"Subir foto"** para cargar la fotografía institucional del profesional.
   - **Nombre y Apellido:** Nombres oficiales del funcionario.
   - **Correo Electrónico Institucional:** Email corporativo único del usuario.
   - **Rol Asignado:** Administrador, Equipo de Formación, Directivo, Inspector o Docente.
   - **Contraseña Inicial:** Clave temporal de acceso (mínimo 6 caracteres).
4. Presiona **"Crear Usuario"**.
5. Si un funcionario deja de trabajar en el establecimiento, el administrador puede desactivar su cuenta con un solo clic, impidiendo su acceso inmediato sin alterar los incidentes o antecedentes que haya registrado históricamente.

### 11.1 Carga y Actualización de Foto de Perfil (Avatar Institucional)

Para que los profesionales aparezcan visualmente identificados en el directorio de usuarios, en la barra superior de sesión y en las tarjetas de cursos del Directorio de Estudiantes:

1. **Al Crear un Usuario:**  
   - En el formulario de **"Nuevo Usuario"**, el componente circular superior te permite hacer clic en **"Subir foto"** o pulsar directamente sobre el círculo de previsualización.
   - Selecciona un archivo en formato **JPEG, PNG o WebP** con un tamaño máximo de **2 MB**.
   - Podrás ver de inmediato la vista previa circular. Al presionar **"Crear Usuario"**, la fotografía se subirá automáticamente a **Supabase Storage**.
2. **Al Editar un Usuario Existente:**  
   - En la tarjeta del funcionario en **"Gestión de Usuarios"**, pulsa el botón **"Editar"** (icono de lápiz).
   - Verás la fotografía actual del usuario (o sus iniciales si aún no tenía una).
   - Puedes presionar **"Reemplazar foto"** para cargar una nueva imagen, o bien pulsar **"Quitar foto"** para eliminarla y volver al avatar por defecto con iniciales.
   - Al hacer clic en **"Guardar Cambios"**, la nueva foto se asociará al usuario y la versión anterior se purgará automáticamente de la nube.
3. **Puntos de Visualización en SIGA Escolar:**  
   - **Directorio de Usuarios:** Cada tarjeta profesional muestra la fotografía en alta calidad con borde institucional.
   - **Barra de Navegación Superior (Header):** El usuario conectado verá su propia fotografía en miniatura junto a su nombre y rol.
   - **Directorio de Estudiantes (Cursos):** La foto del Profesor/a Jefe se visualiza en la tarjeta de cada curso asignado. Si no cuenta con foto cargada, se mostrarán las iniciales con el color distintivo de su rol.

---

## 12. Configuración de Plazos y Reglas Escolares

El equipo directivo y de convivencia puede ajustar los parámetros del colegio:

1. Ingresa a **"Configuración"** en el menú lateral.
2. Podrás modificar:
   - Los días hábiles límite asignados a cada tipo de protocolo RICE.
   - Los umbrales de alerta temprana para la detección de casos reiterados.
3. Haz clic en **"Guardar Cambios"**. Todas las reglas se actualizarán para los nuevos casos que se registren.

---

## 13. Asistente de Redacción Normativa con IA (Gemini Flash) y Reportes Oficiales

Para optimizar el tiempo administrativo de inspectores, dupla psicosocial y directivos, SIGA Escolar incorpora un **Asistente de Redacción Normativa basado en Inteligencia Artificial (Google Gemini Flash)** que transforma relatos informales en actas estructuradas de acuerdo con la **Circular N° 482 de la Superintendencia de Educación**.

### ¿Cómo funciona la generación de informes con IA?

1. **Protección Estricta de la Privacidad (DLP Escolar):**
   - Antes de procesar el texto con la IA, el sistema enmascara automáticamente los RUTs, teléfonos, correos y nombres reales de los alumnos y apoderados (`[ESTUDIANTE_FOCO]`, `[INVOLUCRADO_N]`). Ningún dato de carácter personal sensible abandona el servidor institucional.
2. **Estructura Normativa en 5 Secciones:**
   - La IA sintetiza y formatea el caso en cinco apartados obligatorios:
     - **Contexto:** Ubicación, horario y circunstancias del hecho.
     - **Hechos Objetivos:** Relato formal, neutro y cronológico en tercera persona (sin adjetivos calificativos ni prejuicios).
     - **Medidas Adoptadas:** Acciones inmediatas de contención o activación protocolar.
     - **Acuerdos y Compromisos:** Deberes formativos asumidos por el estudiante y su familia.
     - **Plan de Seguimiento:** Cronograma de monitoreo pedagógico y psicosocial.
3. **Informes Diferenciados por Alumno:**
   - En incidentes que involucran a más de un estudiante, el sistema genera **un informe individual para cada uno**, garantizando que un apoderado solo lea el nombre y medidas de su propio pupilo, manteniendo en reserva la identidad de los demás involucrados.
4. **Revisión Humana y Aprobación Oficial:**
   - Todo borrador generado por la IA es revisable y editable por inspectores o dupla psicosocial.
   - Solo la dirección o coordinación de convivencia escolar puede emitir la **aprobación formal**, la cual bloquea modificaciones posteriores para garantizar inmutabilidad legal.

### Guía Paso a Paso para Funcionarios (Inspectoría y Convivencia)

1. **Paso 1: Localizar el Incidente**  
   - Dirígete al módulo **"Incidentes"** y haz clic sobre el caso que deseas documentar.
2. **Paso 2: Generar Borrador con IA**  
   - En la pestaña o sección de informes, haz clic en **"Generar Informe con IA"**.
   - El sistema anonimizará los datos, consultará a Gemini Flash y presentará las 5 secciones estructuradas por cada alumno involucrado en pocos segundos.
3. **Paso 3: Revisión y Ajustes (Human-in-the-Loop)**  
   - Revisa el texto propuesto. Puedes ajustar compromisos formativos, fechas de citación o medidas específicas en la sección editable antes de finalizar.
   - Haz clic en **"Guardar Borrador"** para conservar los cambios sin alterar el registro histórico.
4. **Paso 4: Aprobación Formal (Directivos y Encargados de Convivencia)**  
   - Una vez validado el contenido, la jefatura autorizada presiona **"Aprobar Informe Oficial"**.
   - El estado cambia a **Aprobado** y el contenido queda blindado contra futuras modificaciones.
5. **Paso 5: Emisión de PDF y Envío a la Familia**  
   - El sistema habilita de inmediato el botón **"Descargar PDF Oficial"** y simultáneamente despacha el informe por correo al apoderado titular registrado.

### Emisión y Descarga del Documento PDF Oficial

Una vez que el informe cuenta con la **Aprobación Formal** de la jefatura:
1. El sistema habilita el botón de descarga del **PDF Oficial**.
2. El documento se genera en formato estándar A4 con:
   - **Membrete Oficial:** Con identificación de la *Escuela Coeducacional N° 1 El Salvador*, RBD, dirección y fecha de emisión.
   - **Folio Único Correlativo:** Código de trazabilidad institucional (ej. `INF-2026-A1B2C3`).
   - **Ficha del Alumno y del Caso:** Datos del estudiante foco, curso, apoderado titular, fecha y gravedad.
   - **Desarrollo Normativo:** Las 5 secciones estructuradas y redactadas formalmente.
   - **Líneas de Firma Física:** Espacios designados para la firma y timbre del Coordinador/a de Convivencia Escolar y del Director/a o Inspector/a General.
3. **Regla de Seguridad e Inmutabilidad:** Los informes en estado *Borrador* no pueden descargarse en PDF, garantizando que ningún documento provisional o no aprobado circule fuera del establecimiento.

### Notificación Automática por Correo Electrónico al Apoderado Titular

De manera complementaria a la descarga física, el sistema agiliza la comunicación con la familia:
1. **Despacho Inmediato al Aprobar:** En el mismo instante en que el Coordinador/a de Convivencia o Dirección oficializa el reporte, SIGA Escolar despacha un correo electrónico formal al apoderado titular del alumno.
2. **Contenido del Correo:**
   - Saludo institucional respetuoso y empático (no estigmatizante).
   - Resumen del caso (fecha, folio oficial y alumno foco).
   - **Copia íntegra del informe en PDF adjunto**, idéntico al documento impreso en el colegio.
3. **Casos sin Correo Registrado:** Si la familia no cuenta con email en la ficha escolar, el sistema alertará visualmente al personal para proceder con citación presencial y entrega de la copia física.

---

## 14. Analítica Escolar y Mapa de Calor por Cursos (Evolución del Clima de Aula)

El módulo de **Analítica y Clima Escolar** proporciona a la Dirección, Inspectoría General y al Equipo de Convivencia una vista panorámica preventiva sobre el comportamiento y la convivencia en las aulas a lo largo del año académico.

### 14.1 Acceso al Mapa de Calor por Cursos
1. En el menú lateral izquierdo, haz clic en **Analítica**.
2. Por defecto se abrirá la pestaña **Mapa de Calor** (con icono de flama). También puedes alternar a la pestaña **Tendencias Globales** para consultar gráficos acumulados de gravedad y resoluciones.

### 14.2 Interpretación de la Matriz de Clima Escolar
La matriz cruza los **Cursos de la Escuela** (desde Pre-Kínder hasta 8° Básico) en las filas, contra los **Meses Lectivos** (Marzo a Diciembre) en las columnas:

* 🟢 **Celda Verde (Clima Favorable):** 0 o 1 incidente leve en el mes. Indica que el aula se encuentra estable y sin conflictos recurrentes.
* 🟡 **Celda Amarilla (Alerta Preventiva):** Entre 2 y 4 incidentes leves, o 1 incidente de gravedad Grave. Indica una señal de alerta temprana para coordinar actividades con el Profesor Jefe.
* 🔴 **Celda Roja (Intervención Urgente):** 5 o más incidentes en el mes, 2 o más incidentes graves o al menos 1 incidente gravísimo. Indica que el curso requiere intervención prioritaria de la Dupla Psicosocial y activación de protocolos normativos.

### 14.3 Filtros por Año y por Ciclo
En la esquina superior derecha del mapa de calor puedes:
* **Cambiar el Año Académico:** Consultar el año actual (ej. 2026) o años históricos (ej. 2025) para balances de gestión escolar.
* **Filtrar por Ciclo Escolar:** Filtrar rápidamente por *Todos los Niveles*, *Educación Parvularia*, *Primer Ciclo Básico (1° a 4°)* o *Segundo Ciclo Básico (5° a 8°)*.

### 14.4 Drill-Down: Diagnóstico Pedagógico del Curso (Al hacer Clic)
Al hacer clic sobre cualquier celda de la tabla (por ejemplo, *6° Básico B en Octubre*):
1. Se abrirá una ventana emergente con el **Diagnóstico Pedagógico y Situacional**.
2. **Contenido del Diagnóstico:**
   * **Total de Casos y Severidad:** Conteo exacto de incidentes Leves, Graves y Gravísimas.
   * **Tipologías Frecuentes:** Gráfico de barras que ilustra los motivos principales de los conflictos (ej. *Rencillas en recreos*, *Faltas de respeto*, *Disrupción de aula*).
   * **Orientación de Convivencia Escolar:** Recomendación pedagógica sugerida para el equipo directivo y el Profesor Jefe.
3. **Protección de la Privacidad (Ley N° 19.628):** Este diagnóstico es **completamente anónimo** y agregado a nivel de grupo curso, resguardando la identidad de los estudiantes y evitando estigmatizaciones individuales.

### 14.5 Dashboard de Analítica Integral y Trazabilidad Institucional
Al acceder a la sección de **Analítica**, el equipo directivo cuenta con un panel analítico integral organizado en cuadrículas equilibradas:

1. **Tarjetas de Resumen Ejecutivo (KPIs Superiores):**
   * **Incidentes del Mes:** Total acumulado con porcentaje de variación frente al mes anterior.
   * **Casos Abiertos:** Situaciones activas en etapa de indagación o seguimiento formativo.
   * **Estudiantes en Riesgo:** Alumnos que concentran reiteración de casos y requieren focalización prioritaria.
2. **Tendencia Temporal y Severidad (Fila Central 1):**
   * Curva histórica de 12 meses desglosando incidentes Leves, Graves y Gravísimas para identificar estacionalidades y picos preventivos.
   * Gráfico donut con el porcentaje de distribución por gravedad de las situaciones atendidas.
3. **Frecuencia por Aula y Protocolos Formativos (Fila Central 2):**
   * Gráfico de barras por curso que visibiliza qué niveles presentan mayor demanda pedagógica.
   * Gráfico de barras horizontales detallando las tipologías de abordaje aplicadas (entrevistas, compromisos formativos, mediaciones y derivaciones).
4. **Focalización Prioritaria y Trazabilidad de Funcionarios (Fila Inferior):**
   * **Tabla de Focalización:** Listado de estudiantes con reiteración de casos, sus cursos, nivel de riesgo y acceso directo a su expediente mediante el botón de ficha.
   * **Actividad de Funcionarios:** Registro institucional que detalla el rol de cada profesional y el volumen de casos reportados, garantizando debida diligencia.

### 14.6 Emisión del Reporte Mensual Ejecutivo en PDF con Copiloto IA
El sistema cuenta con un motor inteligente de generación de informes directivos oficiales en PDF:

1. **Cómo generar el reporte:**
   * En la cabecera superior de Analítica, haz clic en el botón verde institucional **"Reporte Mensual PDF"**.
   * Se abrirá el **Modal Interactivo del Reporte Mensual** con diseño de hoja 3D, el sello del mes en curso (*ej. Noviembre 2026*) y un mini gráfico ilustrativo.
   * Haz clic en **"Descargar PDF"**.
2. **Proceso del Copiloto IA:**
   * El sistema captura automáticamente en alta resolución los 4 gráficos que visualizas en pantalla.
   * El botón muestra el avance secuencial (*"Analizando datos…"*, *"Redactando conclusiones…"*, *"Maquetando el PDF…"*) hasta confirmar con *"Listo ✓"* y celebrar con chispas visuales.
3. **Estructura del Documento Oficial (4 Páginas sin Amontonamiento):**
   * **Página 1 (Portada y Síntesis):** Membrete oficial de la Escuela Coeducacional N° 1 El Salvador, 4 indicadores KPIs y Síntesis Ejecutiva Global del Clima redactada por la IA.
   * **Página 2 (Tendencia y Severidad):** Imagen en alta resolución del Gráfico de Tendencia seguida de su interpretación directiva con IA, e imagen del Gráfico de Gravedad con su correspondiente análisis normativo.
   * **Página 3 (Aulas y Abordajes):** Imagen del Gráfico de Frecuencia por Aula seguida de su diagnóstico pedagógico por niveles, e imagen de los Abordajes con su evaluación formativa.
   * **Página 4 (Focalización y Cierre):** Tabla de estudiantes focalizados con datos reales de la base de datos, directrices RICE conforme a la Circular N° 482 y cuadro de firmas tripartitas (Inspectoría, Convivencia Escolar y Dirección).

---

## 15. Cierre de Año Lectivo y Promoción de Cursos

El módulo de **Cierre de Año Lectivo y Promoción** permite a los usuarios con rol **Administrador** y **Directivo** culminar ordenadamente el período escolar vigente, proyectar la oferta educativa del año venidero y promover o egresar a los estudiantes de manera masiva o individual con total trazabilidad histórica.

### 15.1 Acceso al Asistente
1. En el menú lateral izquierdo, haz clic en **Cierre de Año**.
2. El sistema detectará automáticamente el **Período Académico Activo** (ej. 2026), el total de estudiantes matriculados y el año escolar sugerido para apertura (ej. 2027).

### 15.2 Paso 1: Configuración del Período Académico
* **Nuevo Año Escolar:** Define el año lectivo entrante (por defecto el año siguiente).
* **Fechas Oficiales del Año:** Configura la *Fecha de Inicio* (ej. 01 de marzo) y *Fecha de Término* (ej. 31 de diciembre) del período escolar.
* **Oferta Educativa Institucional:** Selecciona si el establecimiento imparte **Solo Enseñanza Básica** (Pre-Kínder a 8° Básico) o si incluye **Enseñanza Media** (hasta 4° Medio).
  > **Nota de Negocio:** Al marcar *Solo Enseñanza Básica*, todos los alumnos de 8° Básico son clasificados automáticamente con destino a **Egresado**.

### 15.3 Paso 2: Configuración de Cursos y Profesores Jefes
* El sistema proyecta la nómina de cursos para el nuevo año replicando los niveles y letras existentes.
* Puedes modificar la letra, nivel o agregar nuevos cursos según la matrícula proyectada.
* **Asignación de Jefaturas:** En el selector de profesor jefe, el sistema muestra exclusivamente a los docentes habilitados con su fotografía de perfil para facilitar una asignación rápida y sin errores.

### 15.4 Paso 3: Nómina de Alumnos y Promoción
* **Pestañas por Curso:** Filtra por curso de origen (*Pre-Kínder A*, *1° Básico A*, etc.) o visualiza la nómina completa (*Todos los Cursos*).
* **Promoción Automática:** Por defecto, cada alumno regular es sugerido como **Promovido** a su nivel superior (ej. de 1° Básico A a 2° Básico A).
* **Egreso Automático:** Los alumnos que culminan el último nivel (8° Básico en Básica o 4° Medio en Media) son sugeridos automáticamente como **🎓 Egresado**.
* **Acciones Masivas Rápidas:**
  * Botón **"Marcar curso como Egresados"**: Útil para marcar a toda una sección de 8° Básico como egresada con un solo clic.
  * Botón **"Restaurar todos a Promovidos"**: Vuelve a promover a todos los alumnos del curso.
* **Ajustes Individuales por Alumno:**
  * En la columna *Estado*, puedes cambiar la condición a **Repitente** (el destino se ajustará automáticamente a su mismo nivel), **Egresado** o **Retirado**.
  * Al alternar de *Repitente* a *Promovido*, el sistema restaura instantáneamente el curso superior sugerido.

### 15.5 Paso 4: Resumen y Confirmación Transaccional
* Revisa las métricas globales del proceso: Total de Alumnos, Promovidos, Repitentes, Egresados y Retirados.
* Haz clic en **Confirmar Cierre de Año Escolar**. Se desplegará un modal de seguridad para confirmar la acción definitiva.
* Al confirmar, una función transaccional atómica en la base de datos:
  1. Cierra el período anterior (`activo = false`).
  2. Crea y activa el nuevo período escolar (`activo = true`).
  3. Crea los cursos del nuevo año y asigna sus profesores jefes.
  4. Asigna el nuevo curso a los alumnos promovidos/repitentes y desvincula el curso activo de los egresados/retirados (`curso_id = null`, `estado_matricula = 'Egresado'`).
  5. Guarda en la tabla `matriculas` el registro histórico oficial de cada estudiante.

### 15.6 Consulta de Nóminas y Navegación por Año Lectivo
* En la pantalla **Estudiantes** (`/estudiantes`):
  * **Selector de Año Lectivo:** En la cabecera puedes alternar el selector `Año lectivo: [ 2027 (Vigente) ▼ ]` para revisar tanto el nuevo año como años anteriores.
  * **Navegación Limpia por Curso:** Al ingresar a una tarjeta de curso, el selector se reemplaza por el badge informativo `Año lectivo 2027` para mantener el foco en la nómina de ese curso.
  * **Distintivos de Estado:** En la columna curso, los alumnos que finalizaron su ciclo se identifican claramente con los badges **🎓 Egresado** o **📁 Retirado**.
* En el **Perfil del Estudiante** (`/estudiantes/:id`):
  * Puedes consultar el historial completo de trayectoria académica año por año con los cursos y estados finales registrados.

---

## 16. Módulo de Mediación Escolar y Acuerdos Formativos (Enfoque Restaurativo)

### ¿Qué es la Mediación Escolar y por qué es fundamental?
El **Módulo de Mediación Escolar** de SIGA Escolar es un espacio formal y formativo diseñado para promover la resolución pacífica, dialogada y constructiva de los conflictos entre estudiantes, evitando escaladas punitivas y favoreciendo la reparación del vínculo en coherencia con la **Circular N° 482 de la Superintendencia de Educación** y el Reglamento Interno (RICE).

---

### ¿Quiénes pueden utilizar este módulo?
* **Equipo de Formación y Convivencia Escolar:** Apertura de expedientes de mediación, designación de mediadores, citación a sesiones, redacción de compromisos y seguimiento.
* **Inspectores y Directivos:** Visualización de expedientes, derivaciones preventivas y monitoreo del cumplimiento de acuerdos.
* **Docentes:** Consulta de estados formativos de los alumnos de su jefatura.

---

### Paso a Paso: Cómo Iniciar una Mediación Escolar

1. **Ingresar al Módulo de Mediaciones:**
   * En el menú lateral izquierdo, haz clic en **Mediación Escolar**.
   * Presiona el botón **+ Nueva Mediación**.

2. **Completar los Datos del Encuentro:**
   * **Origen de la Mediación:** Selecciona si es una iniciativa preventiva de convivencia, una solicitud espontánea de los estudiantes, una petición de apoderados o derivada de un incidente previo.
   * **Motivo u Objetivo:** Describe con lenguaje pedagógico y neutro la situación o desacuerdo a abordar (mínimo 10 caracteres).
   * **Fecha y Hora Programada:** Define cuándo tendrá lugar la sesión de diálogo.
   * **Lugar de la Sesión:** Por defecto se asigna la *Oficina de Convivencia Escolar* (o sala habilitada para resguardo y privacidad).
   * **Mediador/a a Cargo:** Se asigna automáticamente el funcionario que registra la sesión o el especialista seleccionado.

3. **Vincular a los Estudiantes Participantes (Regla de Oro):**
   * El sistema **exige incorporar al menos dos (2) estudiantes distintos**.
   * Para cada alumno, selecciona su rol en el diálogo: `Parte 1`, `Parte 2`, `Afectado`, `Mediador Par` u `Observador`.
   * *El sistema bloqueará intentos de guardar mediaciones con un solo alumno o con el mismo alumno duplicado.*

4. **Guardar y Generación de Folio Único:**
   * Al presionar **Crear Mediación**, el sistema genera automáticamente un **Folio Oficial Correlativo** e irrepetible con formato `MED-YYYY-XXXX` (por ejemplo: `MED-2026-0007`), garantizando trazabilidad legal inalterable.

---

### Aviso Previo y Formal a Apoderados

La normativa educacional exige que los apoderados sean oportunamente informados cuando un estudiante participa en procesos formativos de diálogo:

1. Dentro del expediente de la mediación creada, haz clic en el botón **Notificar a Apoderados**.
2. Selecciona el medio de aviso:
   * **Correo Electrónico (Automático):** Despacha un correo formal institucional al apoderado titular con el folio, fecha, hora, lugar, objetivo y garantías de confidencialidad del alumno.
   * **Comunicación Escrita o Llamada Telefónica:** Si el contacto se realiza por libreta o llamada, el sistema registra la constancia.
3. Puedes agregar un mensaje personalizado complementario.
4. Presiona **Enviar Aviso**:
   * El sistema actualiza en tiempo real la marca temporal (`fecha_aviso_apoderado`) de cada alumno.
   * El estado del aviso cambia visualmente a **Notificado** con fecha y hora exacta, quedando respaldado en la bitácora de auditoría ante eventuales fiscalizaciones de la Superintendencia.

---

### Ciclo de Estados de una Mediación Escolar

| Estado | Significado Formativo |
| :--- | :--- |
| **Borrador** | Expediente en preparación previo a fijar fecha definitiva. |
| **Programada** | Fecha y lugar definidos, a la espera de la sesión formativa con apoderados notificados. |
| **En Sesión** | Diálogo restaurativo en desarrollo en presencia del mediador/a. |
| **Acordada** | Las partes llegaron a acuerdos y compromisos mutuos de reparación y respeto. |
| **Sin Acuerdo** | Tras el diálogo no hubo consenso; se programan sesiones adicionales o medidas de apoyo. |
| **Derivada a Inspectoría** | Incumplimiento reiterado o situación grave que requiere aplicación del protocolo sancionatorio RICE. |

---

### Registro y Seguimiento de Acuerdos y Compromisos Formativos (TASK 7.2.2.1)

Una vez llevada a cabo la sesión de mediación, el mediador o equipo de formación registra los compromisos adquiridos voluntariamente por las partes:

1. **Tipos de Compromisos Regulados:**
   * **Reparación Relacional:** Acuerdos directos de trato digno, disculpa privada sincera y cese de hostilidades.
   * **Disculpa Comunitaria:** Acciones reparatorias frente al curso o comunidad escolar cuando el conflicto afectó la convivencia colectiva.
   * **Cuidado de Espacios:** Colaboración activa en la mantención y orden del patio escolar, salas de clases o biblioteca.
   * **Actitud en Aula:** Pautas concretas de autorregulación, respeto a las normas de clase y escucha activa.
   * **Apoyo Académico:** Compromisos formativos de ayuda entre pares o reforzamiento pedagógico mutuo.
   * **Otro:** Acciones específicas acordadas entre las partes orientadas al bienestar escolar.

2. **Reglas de Integridad y Validación Temporal:**
   * **Fecha Límite Obligatoria:** Cada compromiso debe indicar una fecha límite concreta (`YYYY-MM-DD`). Por coherencia jurídica y formativa, el sistema **no permite ingresar fechas retroactivas o anteriores a la fecha en que se celebró la mediación**.
   * **Transición Automática a "Acordada":** Al registrar exitosamente el lote de compromisos, el expediente de mediación transiciona automáticamente al estado **Acordada** y programa una fecha de seguimiento formativo.
   * **Seguridad Transaccional:** El guardado se procesa de forma atómica con reversión automática ante fallos de conexión, evitando estados inconsistentes o pérdida de acuerdos previos.

---

### Emisión y Descarga del Acta Oficial de Mediación Escolar (PDF — TASK 7.2.3.1)

Una vez formalizados los acuerdos, el sistema permite generar un documento legal e institucional en formato PDF para el expediente físico del colegio o para la firma de las partes:

1. **Cómo Descargar el Acta:**
   * Ingresa al detalle del expediente de la mediación.
   * Haz clic en el botón **Descargar Acta Oficial (PDF)** en la barra superior.
   * El sistema compilará el documento en tiempo real y lo abrirá en tu navegador listo para imprimir o guardar.

2. **Elementos del Documento Oficial:**
   * **Membrete Institucional:** Identificación formal de la **Escuela Coeducacional N° 1 El Salvador**, **RBD: 9876-5**, dependencia y fecha/hora de emisión.
   * **Folio Único Inalterable:** Código de trazabilidad con formato `MED-YYYY-XXXX` para fiscalizaciones de la Superintendencia de Educación.
   * **Tabla de Participantes:** Identificación de los alumnos, sus cursos, RUT y roles en el proceso.
   * **Cuadro de Acuerdos:** Detalle de cada compromiso formativo y su fecha límite.
   * **Cláusula Legal:** Certificación de voluntariedad, confidencialidad y enfoque restaurativo conforme a la **Circular N° 482** y el **RICE**.
   * **Cuadrantes de Firma:** Espacio delimitado para la firma del Mediador/a y los estudiantes convocados.
   * **Hash SHA-256 de Autenticidad:** Código criptográfico de 64 caracteres en el pie de página de cada hoja que certifica que el contenido del documento no ha sufrido modificaciones fraudulentas posteriores.

---

### Despacho Transaccional de Correos con Acta Adjunta (Apoderados y Docentes — TASK 7.2.3.2)

Una vez formalizada la mediación y generada el acta, el sistema permite notificar de manera simultánea e inmediata a los responsables formativos de cada estudiante:

1. **Destinatarios Automáticos:**
   * **Apoderado/a Titular:** El sistema localiza automáticamente al apoderado marcado como titular (`es_titular = true`) de cada estudiante participante para remitirle copia oficial del acuerdo.
   * **Profesor/a Jefe:** El sistema identifica al docente a cargo del curso de cada alumno involucrado a través del directorio institucional (`cursos.profesor_jefe_id`).

2. **Desduplicación Inteligente:**
   * Si ambos estudiantes pertenecen al mismo curso o tienen el mismo Profesor Jefe asignado, el docente **recibe exactamente un único correo consolidado** que menciona a ambos alumnos.
   * Si los estudiantes involucrados son hermanos y comparten el mismo apoderado titular, el apoderado tampoco recibe correos duplicados.

3. **Contenido del Correo Electrónico:**
   * Saludo institucional personalizado según el rol del destinatario (*Apoderado/a Titular* o *Profesor/a Jefe*).
   * Resumen de la sesión: folio del expediente (`MED-YYYY-XXXX`), fecha, lugar, nombre del mediador responsable y fecha programada de seguimiento.
   * **Archivo Adjunto:** El documento oficial `Acta_Mediacion_[FOLIO].pdf` generado en formato PDFKit.
   * **Código de Verificación SHA-256:** Estampado en el cuerpo del mensaje para que el destinatario pueda validar la autenticidad e inmutabilidad del archivo recibido.

4. **Trazabilidad y Seguridad Legal:**
   * Cada despacho queda registrado en la bitácora de auditoría inmutable del establecimiento (`auditoria`), incluyendo la lista exacta de destinatarios, la fecha/hora en formato ISO y el hash criptográfico del acta despachada.

---

### Evaluación de Compromisos, Cierre Inmutable y Enlace RICE (TASK 7.2.4.1)

En la fase de seguimiento posterior a la mediación escolar, el equipo de convivencia cuenta con herramientas para certificar el cumplimiento de los acuerdos y formalizar el cierre del expediente:

1. **Evaluación Formativa de Compromisos:**
   * Permite calificar el grado de cumplimiento de cada acuerdo alcanzado por los estudiantes:
     * **Cumplido:** El estudiante honró plenamente el compromiso formativo acordado. El sistema registra automáticamente la fecha y hora de cumplimiento.
     * **Parcial:** El compromiso fue abordado de forma incompleta o intermitente, permitiendo ingresar observaciones pedagógicas de seguimiento.
     * **Incumplido:** El estudiante desatendió el compromiso acordado en el plazo establecido.
   * La evaluación queda registrada con el usuario responsable en la bitácora de auditoría inmutable.

2. **Sellado Inmutable y Cierre del Expediente:**
   * Al concluir el seguimiento, el/la mediador/a o directivo procede al cierre definitivo del caso, registrando las **Conclusiones de Cierre** obligatorias (mínimo 10 caracteres).
   * **Inmutabilidad y Blindaje Legal:** Una vez cerrado el expediente, el caso queda **sellado y bloqueado contra modificaciones posteriores**, protegiendo la integridad del proceso y evitando alteraciones maliciosas o inconsistencias ante auditorías de la Superintendencia de Educación.
   * **Derivación a Inspectoría y Apertura de Protocolo RICE:** Si las partes no lograron un acuerdo restaurativo o incurrieron en faltas graves reglamentarias que impiden la mediación, el caso puede cerrarse como **Derivada a Inspectoría**, permitiendo opcionalmente **enlazar y aperturar de inmediato un Protocolo Normativo RICE** para el estudiante involucrado, garantizando la continuidad del debido proceso escolar.

3. **Consulta de Historial Conductual y Restaurativo por Alumno:**
   * Mediante el endpoint especializado (`/api/v1/mediaciones/estudiante/:estudianteId`), el personal docente y formativo puede consultar en cualquier momento la trayectoria completa de un alumno en mediaciones escolares:
     * Tasa porcentual de cumplimiento de compromisos.
     * Resumen de casos acordados, sin acuerdo o derivados a inspectoría.
     * Detalle cronológico de acuerdos individuales pactados y sus fechas límite.

---

## 17. Preguntas Frecuentes y Solución de Problemas


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

## 17. Módulo Copiloto RAG Normativo RICE

### 17.1 Propósito y Fundamento Legal
El **Copiloto Normativo RICE** es un sistema inteligente de Generación Aumentada por Recuperación (RAG) que permite contrastar cualquier consulta o situación de convivencia escolar directamente con el **Reglamento Interno y de Convivencia Escolar (RICE)** oficial y vigente de la **Escuela Coeducacional N° 1 El Salvador**, en estricta conformidad con la **Circular N° 482 de la Superintendencia de Educación**.

Su objetivo primordial es:
1. **Garantizar el Debido Proceso:** Recordar los plazos de citación a apoderados, el derecho del estudiante a ser escuchado y la gradualidad de medidas formativas antes de cualquier sanción.
2. **Asegurar la Legalidad en Casos Críticos:** Alertar de forma inmediata sobre la obligación legal de denunciar hechos constitutivos de delito ante el Ministerio Público, Carabineros o PDI dentro de un plazo fatal de **24 horas** (Art. 175 letra e del Código Procesal Penal).
3. **Cero Alucinaciones Normativas:** Toda orientación entregada está estrictamente anclada (*grounded*) a los artículos y páginas del reglamento institucional oficial, señalando con transparencia cuándo un hecho no cuenta con tipificación expresa.

---

### 17.2 Carga y Activación del RICE Oficial (Exclusivo Administrador)
Para asegurar que el sistema opere con la versión oficial aprobada por el Consejo Escolar, únicamente el usuario con rol **Administrador** puede cargar y actualizar el documento:

1. Ingresa a la sección **Configuración** (`/configuracion`).
2. En la cabecera superior, pulsa el botón **«Administrar RICE Oficial»**.
3. Se abrirá el modal de gestión con el estado del reglamento actualmente activo:
   * Nombre del archivo, año lectivo de vigencia y total de fragmentos indexados.
4. Para actualizar la versión:
   * Define el **Año de Vigencia Escolar** (ej. 2026).
   * Adjunta el archivo del reglamento en formato **PDF oficial (.pdf)** o **Markdown estructurado (.md)** (máximo 25 MB).
   * Pulsa el botón **«Confirmar y Activar RICE»**.
5. El sistema procesará el documento en memoria, eliminará ruido tipográfico, generará los fragmentos semánticos por artículo e indexará sus vectores en Supabase (`pgvector`). Las versiones anteriores pasarán automáticamente a estado histórico obsoleto.

---

### 17.3 Consulta Normativa Global (Copiloto RICE)
Cualquier funcionario autenticado (**Directivo, Encargado de Convivencia, Inspector o Docente**) puede consultar el reglamento en lenguaje natural desde cualquier pantalla del sistema:

1. En la barra superior de navegación, haz clic en el botón **«Copiloto RICE»** (icono de destellos).
2. Se desplegará el asistente interactivo con sugerencias rápidas de consulta:
   * *«¿Cuál es el protocolo y plazo ante agresión física o ciberacoso reiterado?»*
   * *«¿Qué medidas formativas deben aplicarse antes de una suspensión?»*
   * *«¿Cómo proceder ante sospecha de porte de armas o sustancias ilícitas?»*
   * *«¿Cuáles son los plazos para citar al apoderado y otorgar derecho a descargos?»*
3. Escribe tu consulta específica o selecciona una sugerencia y pulsa **«Consultar»**.
4. El asistente responderá con:
   * **Marco Normativo:** Artículos, Capítulos y páginas exactas del RICE de la escuela.
   * **Procedimiento y Debido Proceso:** Pasos obligatorios y plazos requeridos.
   * **Fuentes y Artículos Citados:** Acordeón desplegable en la parte inferior con los extractos textuales recuperados desde el documento para verificación inmediata.
   * **Botón Copiar:** Permite copiar la recomendación completa al portapapeles con un clic para incorporarla en minutas o citaciones.

---

### 17.4 Consulta Asistida desde el Registro de un Incidente
Al revisar un incidente conductual específico en la pantalla de detalle (`/incidentes/:id`):

1. En la botonera superior encontrarás el botón **«Consultar RICE»** junto al generador de informes.
2. Al pulsar este botón, el Copiloto se abrirá precargando automáticamente el relato y circunstancias del hecho registrado.
3. **Seguridad y Privacidad (DLP):** Antes de procesar la consulta, el motor de sanitización elimina automáticamente cualquier dato personal de los menores (RUTs, nombres reales, teléfonos o correos), garantizando estricta confidencialidad según la Ley N° 19.628 de Protección de Datos Personales.
4. El asistente indicará con precisión qué protocolo de maltrato o convivencia corresponde activar y qué medidas de apoyo aplicar.

---

### 18. Navegación Unificada y Acceso Rápido Permanente
En cualquier sección del sistema —incluso al consultar la ficha de un estudiante, registrar un nuevo incidente o revisar un protocolo RICE paso a paso— dispondrás de:
* **Menú Lateral Persistente (Sidebar):** Permite cambiar de módulo (Dashboard, Estudiantes, Incidentes, Protocolos, Cierre de Año, etc.) en un solo clic sin necesidad de volver atrás en el navegador. En dispositivos móviles se despliega mediante el botón de menú hamburguesa.
* **Barra Superior Siempre Visible (Navbar):** Permite buscar alumnos rápidamente por nombre o RUT desde cualquier pantalla, cambiar entre modo claro y oscuro, consultar el Copiloto RICE y revisar las notificaciones en tiempo real.

---

## 19. Sociograma Escolar y Redes de Convivencia de Aula (Matriz de Co-ocurrencias)

### 19.1 Acceso Integrado desde la Ficha del Curso
Para facilitar una experiencia de usuario fluida y centralizar la gestión pedagógica del aula en un único espacio, el Sociograma Escolar se encuentra integrado directamente dentro de la vista de cada curso:

1. **Paso 1: Ingreso a Cursos:** Haz clic en **"Cursos"** en el menú lateral izquierdo (icono de birrete 🎓).
2. **Paso 2: Selección del Curso:** Pulsa sobre la tarjeta del curso que deseas analizar (por ejemplo, *5° Básico A*, *8° Básico B*).
3. **Paso 3: Selector de Modo (Switch Contextual):**
   - En la parte superior de la nómina, debajo del banner del curso, encontrarás un selector segmentado:
     - **[ 👥 Nómina de estudiantes ]**: Vista habitual con el listado oficial, filtros PIE/Riesgo, exportación a Excel/PDF y accesos a perfiles individuales.
     - **[ 🕸️ Sociograma de aula ]**: Activa inmediatamente el lienzo interactivo del sociograma, calculando en tiempo real las métricas de red y el grafo relacional del curso seleccionado.

> [!NOTE]
> **Permisos de Visualización:** El acceso a la pestaña de Sociograma de aula está disponible para los roles con atribuciones formativas y de convivencia (`Administrador`, `Directivo`, `Equipo de Formación`, `Inspector`, `Docente`), manteniendo la confidencialidad de la información según el perfil institucional.

---

### 19.2 Propósito y Fundamento Formativo
El **Sociograma Escolar** es una herramienta analítica avanzada basada en teoría de grafos y matrices de adyacencia ponderada. Permite al Equipo Directivo, Dupla Psicosocial y Profesores Jefes visualizar y comprender la topología relacional de un curso completo:
1. **Identificar Dinámicas Grupales Ocultas:** Detectar patrones de conflicto reiterado entre pares que pasan desapercibidos en incidentes aislados.
2. **Detección Temprana de Estudiantes Aislados:** Identificar estudiantes que no presentan interacción ni conflicto registrado, orientando intervenciones preventivas para evitar marginación o soledad escolar.
3. **Ponderación Objetiva por Gravedad y Mediación:** El algoritmo pondera matemáticamente los hechos ocurridos en el aula:
   - **Falta Leve:** $+1$ punto de tensión.
   - **Falta Grave:** $+3$ puntos de tensión.
   - **Falta Gravísima:** $+5$ puntos de tensión.
   - **Mediación Escolar Acordada:** $-2$ puntos (atenúa la conflictividad acumulada, reflejando el éxito del enfoque restaurativo).

---

### 19.3 Interpretación de Métricas, Grafo y Semáforo Relacional Formativo
Al consultar el sociograma de un curso, el sistema computa y clasifica automáticamente los resultados:

* **Semáforo Relacional Formativo (Color de Aristas):**
  - **Verde Esmeralda (`#10b981`, trazo discontinuo):** *Acuerdo Restaurativo* (peso neto $< 0$); refleja la superación exitosa de tensiones previas mediante mediación escolar.
  - **Rojo Intenso (`#ef4444`):** *Conflicto Severo* (peso acumulado $\ge 5$); alerta prioritaria de convivencia que requiere mediación o protocolo RICE.
  - **Naranja (`#f97316`):** *Conflicto Moderado* (peso acumulado entre $3$ y $4$); roces persistentes que requieren acompañamiento docente.
  - **Ámbar Cálido (`#f59e0b`):** *Conflicto Leve* (peso acumulado entre $1$ y $2$); fricciones menores en observación preventiva.
  - **Morado Violeta (`#8b5cf6`, trazo discontinuo):** *Mediación en Proceso*; caso en abordaje con compromisos vigentes.
  - **Gris Slate (`#94a3b8`):** *Interacción Registrada*; vínculo documentado sin escalamiento.

* **Métricas Globales del Clima de Aula (Análisis de Redes SNA):**
  - **Estudiantes en Red:** Número de estudiantes del curso que presentan interacciones activas.
  - **Densidad de la Red ($0 \text{ a } 100\%$):** Porcentaje de vínculos activos respecto al máximo combinatorio del grupo curso.
  - **Tasa de Integración ($0 \text{ a } 100\%$):** Porcentaje de estudiantes integrados socialmente en el aula.
  - **Índice Integral de Cohesión de Aula ($0 \text{ a } 100$):** Indicador sintético que combina inclusión relacional, transitividad (Watts-Strogatz) y balance restaurativo, con diagnósticos institucionales constructivos.

* **Herramientas de Exportación y Análisis:**
  - **Exportar PNG / PDF:** Permite descargar el diagrama del grafo para carpetas de acompañamiento o informes de jefatura.
  - **Panel de Orientaciones Pedagógicas:** Sugerencias formativas automáticas basadas en la topología de la red sin etiquetas peyorativas.
  - **Modal de Detalle del Estudiante:** Al hacer clic en cualquier nodo, se despliegan sus vínculos con compañeros y clasificaciones formativas.

---

### 19.4 Enfoque Ético y Protección contra la Estigmatización Escolar
En estricto cumplimiento con la **Ley N° 19.628 de Protección de Datos Personales** y la **Política Nacional de Convivencia Educativa**:
1. **Terminología Formativa y Respetuosa:** El sistema prohíbe y suprime etiquetas estigmatizantes (`agresor`, `víctima`, `problemático`, `conflictivo`). Cada situación es tipificada según su nivel de acompañamiento pedagógico:
   - *Acompañamiento formativo prioritario*
   - *Apoyo formativo focalizado*
   - *Observación preventiva formativa*
   - *Convivencia positiva y armónica*
2. **Confidencialidad Médica y Pedagógica:** El sociograma no expone antecedentes de salud, diagnósticos clínicos ni pertenencia al Programa de Integración Escolar (PIE), resguardando plenamente la dignidad e intimidad del estudiante y su grupo familiar.

---

## 20. Expediente Escolar Sanitizado para Especialistas de Salud Externa

### 20.1 Propósito y Fundamento Legal (Ley N° 19.628 y Ley N° 20.584)
Cuando un estudiante es derivado a evaluación médica, psicológica o neurológica externa (CESFAM, Cosam, neurólogos infantiles, psiquiatras o terapeutas), el establecimiento educacional debe remitir un reporte fidedigno de su desempeño y convivencia escolar.

Sin embargo, en los relatos de incidentes y mediaciones suelen figurar nombres y circunstancias de otros niños y niñas (compañeros de curso o testigos). La **Ley N° 19.628 de Protección de la Vida Privada** y la **Circular N° 482 de la Superintendencia de Educación** prohíben estrictamente divulgar datos personales de terceros a entidades externas.

Para resolver este desafío, SIGA Escolar incorpora el **Extractor y Sanitizador de Expedientes para Salud**:
1. **Preserva la Identidad del Alumno Derivado:** Los datos del paciente (estudiante foco) se mantienen íntegros y claros para el especialista médico.
2. **Anonimización Automática por Iniciales Genéricas:** Todo nombre de compañeros o terceros en los relatos es sustituido en tiempo real por iniciales con punto (ej. *"Juan Carlos Pérez"* $\to$ *"J. C. P."*, *"Camila Soto"* $\to$ *"C. S."*).
3. **Censura de PII de Terceros:** Se suprimen automáticamente números de RUT, teléfonos y correos electrónicos de terceros.
4. **Control Estricto RBAC:** Acceso restringido exclusivamente a **Directivos, Administrador y Equipo de Formación/Psicosocial**. Profesores o inspectores no tienen acceso a esta extracción para resguardar el secreto profesional y la confidencialidad.
5. **Auditoría Inmutable:** Cada generación queda registrada en la bitácora institucional con el nombre del funcionario emisor, fecha/hora y especialista destinatario.

### 20.2 Emisión y Descarga de la Ficha Médica/Psicológica Oficial (PDF Institucional de 2 Páginas)
Para hacer entrega formal del expediente al especialista de salud tratante (neurólogo, psiquiatra, psicólogo o médico de cabecera), el sistema compila instantáneamente una **Ficha Médica y Psicológica Oficial en PDF** con diseño sobrio y membrete formal.

#### Estructura del Documento Oficial (Exactamente 2 Páginas)
* **Membrete Institucional Oficial (Página 1):** Encabezado con la identidad de la *Escuela Coeducacional N° 1 El Salvador* (RBD 9876-5, Diego de Almagro, Región de Atacama), Unidad de Convivencia Escolar / Dupla Psicosocial y aviso legal de confidencialidad estricta amparado en la Ley N° 19.628 y Ley N° 20.584.
* **Sección I — Identificación del Estudiante y Contexto:** Nombre del estudiante, RUT, curso, fecha de nacimiento, estado de matrícula, fecha de emisión, funcionario emisor, especialista destinatario y motivo formal de la derivación.
* **Sección II — Hábitos, Conducta y Atención Observada en Aula:** Registro pedagógico formativo sobre períodos de atención, focalización en tareas, autorregulación frente a frustración y articulación con apoyos de aula PIE (Decreto N° 83/2015).
* **Sección III — Historial de Convivencia Escolar y Mediaciones (Página 2):** Detalle cronológico de incidentes disciplinarios relevantes y procesos de mediación formativa, donde los nombres de cualquier compañero de curso o testigo aparecen 100% reemplazados por iniciales genéricas.
* **Sección IV — Conclusiones Institucionales y Cuadrantes de Doble Firma:** Sugerencias para el trabajo colaborativo escuela-salud y cuadrantes formales para la firma de la *Unidad de Convivencia Escolar / Dupla Psicosocial* y la *Dirección del Establecimiento*.
* **Código Hash Criptográfico SHA-256 en Pie de Página:** Ambas carillas llevan impreso un hash criptográfico de 64 caracteres calculado sobre los datos canónicos de emisión (`Hash SHA-256 de Certificación: [hash]`), lo que permite al centro médico o tribunal certificar que el informe impreso o digital no ha sido adulterado.

#### Paso a Paso para la Emisión de la Ficha Oficial
1. Ingresa a la plataforma con un usuario autorizado (**Administrador**, **Directivo** o **Equipo de Formación**).
2. Dirígete al módulo de **Estudiantes** y selecciona al estudiante correspondiente.
3. En la pestaña de antecedentes formativos o en el botón de acciones rápidas, haz clic en **"Descargar Ficha Médica/Psicológica"** (o solicita el informe ingresando el especialista y motivo).
4. El navegador abrirá o descargará inmediatamente el documento `Ficha_Medica_Oficial_[Nombre].pdf` listo para imprimir, firmar y remitir bajo sobre cerrado o canal confidencial al profesional de salud.

### 20.3 Historial de Informes Médicos y Fichas Emitidas
Cada vez que se genera o descarga una ficha oficial para un especialista externo, el sistema almacena de forma inalterable un registro en la tabla institucional de informes médicos (`estudiante_informes_medicos`).

#### Información Registrada en el Historial
* **Especialista y Centro de Destino:** Identificación del médico, neurólogo, psicólogo o centro de salud (CESFAM, COSAM, Hospital).
* **Motivo y Notas Clínicas:** Justificación pedagógico-clínica de la emisión y observaciones complementarias.
* **Usuario Emisor:** Nombre, correo y rol del funcionario institucional que tramitó el informe (ej. *Constanza Valenzuela - Equipo de Formación*).
* **Hash SHA-256 de Certificación:** Código inmutable de 64 caracteres para corroborar que el informe en manos del especialista corresponde con el emitido originalmente por el colegio.
* **Fecha y Hora de Emisión:** Marca de tiempo oficial de la entrega documental.

#### Consulta Paginada del Historial
Los usuarios con permisos de **Administrador**, **Directivo** o **Equipo de Formación** pueden consultar la nómina completa de informes emitidos para un alumno mediante el endpoint paginado `GET /api/v1/estudiantes/:id/informes-medicos?page=1&limit=10`, lo que garantiza auditoría continua y seguimiento cronológico de las derivaciones médicas del estudiante.

---

## 21. Módulo de Citaciones Formativas y Alianza Familia-Escuela

### ¿Qué es el Gestor de Citaciones Formativas?
Es la herramienta institucional para convocar a los apoderados a entrevistas pedagógicas y formativas bajo un **enfoque colaborativo y no punitivo**, eliminando la percepción de castigo o angustia en las familias.

El sistema envía una colilla digital con un **enlace móvil criptográfico de acceso directo** (validez estricta de 72 horas), permitiendo que el apoderado confirme su asistencia, proponga una reprogramación o justifique su inasistencia **en 1 solo clic desde su teléfono celular, sin necesidad de recordar contraseñas ni iniciar sesión**.

---

### Paso a Paso para Docentes y Directivos: Cómo Programar una Citación

1. **Ingresar a la Ficha del Estudiante:**
   * Dirígete al módulo de **Estudiantes** (`/estudiantes`) y selecciona al alumno correspondiente.
2. **Presionar el Botón de Citación:**
   * En la cabecera principal del expediente (junto a *Descargar PDF*) haz clic en **`[ 📅 Citar Apoderado ]`** (también puedes presionar *"Programar Citación con este Apoderado"* dentro de la tarjeta de contacto del apoderado).
3. **Completar los Parámetros de la Convocatoria en el Modal:**
   * **Categoría Formativa:** Selecciona el objetivo del encuentro:
     * *Refuerzo Académico:* Acompañamiento colaborativo en estrategias de estudio.
     * *Hábitos y Asistencia:* Fortalecimiento de la puntualidad y rutinas.
     * *Reconocimiento y Felicitación:* Puesta en valor de avances y logros positivos.
     * *Acuerdos de Convivencia:* Diálogo restaurativo y clima escolar.
     * *Seguimiento Formativo:* Evaluación periódica de compromisos mutuos.
   * **Mensaje para la Familia:** Escribe en un tono constructivo y claro los temas a tratar (mínimo 10 caracteres).
   * **Fecha y Hora:** Elige el día y bloque horario. Si ya tienes otra citación agendada en ese mismo intervalo (ventana de 45 min), el sistema te alertará automáticamente con un conflicto de horario para resguardar tu agenda.
   * **Modalidad:** Presencial (en sala de entrevistas del colegio) o Virtual (con enlace de videollamada).
4. **Emitir y Despachar:**
   * Haz clic en **Programar y Despachar**. El sistema genera el folio oficial (ej. `CIT-2026-0042`) y despacha la notificación con el enlace seguro al correo del apoderado.

---

### Experiencia del Apoderado en su Teléfono Móvil (Sin Login)

1. **Recepción del Enlace Seguro:**
   * El apoderado recibe un mensaje de correo o SMS con un enlace seguro único con vigencia de 72 horas:  
     `https://app.escuelaelsalvador.cl/citaciones/confirmacion/[token-seguro]`
2. **Visualización Inmediata de la Convocatoria:**
   * Al abrir el enlace, el apoderado accede directamente a la tarjeta institucional con el nombre de su pupilo, fecha, hora, modalidad y el propósito formativo redactado por el profesor.
3. **Acciones Disponibles en 1-Clic:**
   * **Confirmar Asistencia:** Al presionar el botón verde *"Confirmar Mi Asistencia"*, el estado se actualiza en tiempo real en la plataforma del colegio.
   * **Guardar en su Calendario:** Inmediatamente tras confirmar, el apoderado puede presionar **`[ 📅 Guardar en mi Calendario ]`** para registrar el evento con alarma automática en la aplicación nativa de su celular (iPhone, Samsung, Xiaomi o cualquier smartphone), o seleccionar el enlace de Google Calendar.
   * **Solicitar Reprogramación:** Si el horario choca con su trabajo, puede presionar *"Solicitar Reprogramación"*, sugerir una nueva fecha y enviar un mensaje explicativo al docente.
   * **Justificar Inasistencia:** Si no podrá asistir por causas de fuerza mayor, puede justificar el motivo para que quede constancia en la bitácora escolar.

---

### Registro de Acuerdos Mutuos, Acta Oficial PDF y Despacho Automático

Una vez realizada la entrevista pedagógica entre el docente y el apoderado:

1. **Acceso desde el Expediente del Alumno (`/estudiantes/:id`):**
   * En la ficha del estudiante, desplázate hasta la sección **"Citaciones Formativas y Acuerdos Mutuos"**.
   * Identifica la citación correspondiente (identificada por su folio `CIT-YYYY-XXXX`).
   * Si la citación está en estado `Programada` o `Asistencia Confirmada`, haz clic en el botón verde **`[ ✍️ Registrar Acuerdos ]`**.

2. **Modal de Entrevista Presencial y Selección de Sugerencias (`EntrevistaCitacionModal`):**
   * Se abrirá la ventana modal de entrevista presencial dividida en 3 etapas didácticas:
     * **Paso 1 (Acuerdos Mutuos y Banco Rápido):** Cuenta con botones tipo pastilla/chip con sugerencias pedagógicas y familiares preconfiguradas (*"Adecuación curricular", "Monitoreo semanal", "Rutinas de lectura 20 min", "Control de descanso"*). Al hacer clic en una sugerencia, se añade automáticamente a la lista. Además, puedes escribir y editar libremente cualquier compromiso. Define la fecha estimada de próximo seguimiento.
     * **Paso 2 (Lienzo de Firmas Digitales a 60 FPS):** Invita a las partes a firmar con su dedo, lápiz óptico o ratón dentro del recuadro. Cuenta con pestañas independientes para la *Firma del Docente* y la *Firma del Apoderado Titular*, indicando visualmente cuándo cada firma ha sido estampada con éxito.
     * **Paso 3 (Emisión y Descarga):** Tras presionar **`[ Finalizar y Sellar Acta Oficial 🔒 ]`**, el sistema genera el sello criptográfico SHA-256 y ofrece de inmediato el botón **`[ Descargar Acta Oficial PDF ]`**.

3. **Generación del Acta Oficial de Citación (PDFKit) y Sello Criptográfico:**
   * El sistema sella el documento generando un **hash SHA-256 inmutable de 64 caracteres** que garantiza que los compromisos no puedan ser adulterados.
   * Compila un documento oficial en PDF de alta fidelidad que incorpora:
     * **Membrete Oficial:** Escuela Coeducacional N°1 El Salvador, RBD `9876-5`.
     * **Folio Único Institucional:** Formato correlativo `CIT-YYYY-XXXX`.
     * **Tabla Comparativa a 2 Columnas:** Compromisos asumidos por el Colegio versus compromisos asumidos por la Familia.
     * **Cuadrantes de Firma con Trazo Digital:** Espacios oficiales donde quedan estampadas las firmas manuscritas capturadas en pantalla.
     * **Código Forense SHA-256:** Estampado al pie del documento.

4. **Dispatcher Automático de Copias por Correo Electrónico:**
   * Inmediatamente tras guardar:
     * **Copia al Apoderado Titular:** Se despacha un correo formal con el resumen de compromisos y el archivo `Acta_Citacion_[Folio].pdf` adjunto.
     * **Copia Informativa al Profesor Jefe:** Se remite una copia idéntica al Profesor Jefe del curso del alumno.
     * **Bitácora de Auditoría:** Queda constancia inmutable en `auditoria_logs` con la acción `CIERRE_CITACION_ACUERDOS`.
   * El estado de la citación cambia automáticamente a **`✓ Realizada con Acuerdos`**, habilitando en la plataforma el botón **`[ 📄 Acta Oficial PDF ]`** para descarga inmediata en cualquier momento.

### Analítica de Adherencia Parental y Consulta de Historial por Estudiante

Para brindar al Equipo Directivo, Convivencia Escolar y Docentes una visión cuantitativa y cualitativa del compromiso familiar:

1. **Métricas Globales de Adherencia Parental (`/api/citaciones/metricas`):**
   * **Tasa de Asistencia Efectiva:** Mide el porcentaje de citaciones completadas exitosamente respecto a las convocatorias evaluadas (`realizadas / (realizadas + inasistencias)`), permitiendo detectar oportunamente brechas de ausentismo parental.
   * **Tasa de Adherencia Temprana:** Monitorea la proporción de familias que interactúan activamente antes de la fecha (confirmando, reprogramando o justificando en 1 clic).
   * **Distribución de Motivos Formativos:** Grafica la frecuencia relativa de convocatorias por cada categoría (Refuerzo Académico, Hábitos y Asistencia, Reconocimiento/Felicitación, Acuerdos de Convivencia y Seguimiento Formativo) para orientar planes de acción institucional.
   * **Tasa de Efectividad de Acuerdos:** Supervisa el porcentaje de entrevistas realizadas que culminaron con compromisos mutuos sellados formalmente.
   * **Filtros Temporales y por Docente:** Permite segmentar el análisis por rangos de fecha (`fecha_desde`, `fecha_hasta`) y docente citador.

2. **Historial Cronológico Enriquecido por Alumno (`/api/citaciones/estudiante/:estudianteId`):**
   * **Expediente Integral:** Centraliza todas las citaciones formativas del alumno ordenadas cronológicamente, con sus respectivos motivos, estados, comentarios del apoderado y conclusiones.
   * **Resumen de Desempeño Familiar:** Entrega indicadores rápidos del estudiante: total de citaciones, entrevistas efectivas, inasistencias, tasa individual de asistencia y número de compromisos con seguimiento vigente.
   * **Acceso Inmediato a Documentación Oficial:** Cada citación cerrada dispone de enlace directo a su Acta Oficial PDF sellada con código SHA-256 para consulta pedagógica o supervisión ministerial.

### Tablero de Control de Citaciones y Pestaña en Expediente (`/citaciones`)

Para facilitar el trabajo cotidiano de los equipos directivos, de inspectoría y convivencia escolar:

1. **Acceso Directo desde la Barra Lateral:**
   * Haz clic en el nuevo acceso **Citaciones** (ícono de calendario con visto bueno) en la barra de navegación lateral izquierda de SIGA Escolar.
   * La vista despliega una cabecera minimalista con el total de citaciones activas del establecimiento.

2. **Tarjetas de KPIs Institucionales:**
   * **Total Citaciones:** Conteo consolidado de convocatorias emitidas.
   * **Asistencia Efectiva:** Porcentaje de entrevistas realizadas con éxito versus inasistencias.
   * **Adherencia Móvil:** Porcentaje de familias que han confirmado, reprogramado o justificado desde su celular mediante el enlace seguro de 1-clic.
   * **Efectividad Acuerdos:** Proporción de citaciones concluidas con actas oficiales y compromisos suscritos.

3. **Filtros Rápidos mediante Botones Píldora (Pills):**
   * Filtra con un solo clic entre estados: *Todos*, *Programadas*, *Confirmadas*, *Realizadas*, *Reprogramadas* o *Inasistencias*.
   * Utiliza el buscador en tiempo real para encontrar de inmediato cualquier citación por folio oficial (`CIT-2026-XXXX`), nombre del estudiante o del apoderado.
   * Segmenta por categoría formativa o rango de fechas con los selectores compactos.

4. **Programación Intuitiva de Citaciones:**
   * Presiona el botón azul **`[ + Programar Citación ]`**.
   * **Buscador en Cascada Integrado:** Si programas desde la bandeja general, puedes buscar al alumno por nivel y letra de curso o directamente por su RUT/Nombre. El sistema asociará automáticamente a su apoderado titular.
   * **Chips Temáticos:** Selecciona el propósito de la citación haciendo clic en chips de colores (*Refuerzo Académico*, *Hábitos y Asistencia*, *Acuerdos de Convivencia*, *Reconocimiento*, *Seguimiento Formativo*).
   * **Alternador de Modalidad:** Cambia entre *Presencial* (indicando sala) y *Online* (ingresando enlace Google Meet/Zoom).
   * Al hacer clic en **`[ Programar y Despachar ]`**, se genera el folio correlativo y se notifica de inmediato a la familia por correo y móvil.

5. **Pestaña en Ficha de Estudiante (`TabCitacionesEstudiante`):**
   * En el perfil de cualquier estudiante (`/estudiantes/:id`), la pestaña de citaciones presenta sus métricas individuales, la lista cronológica de entrevistas, el botón para emitir nuevas citaciones directas y la descarga de actas oficiales con 1 solo clic.

---

*Manual elaborado y mantenido por el equipo técnico de SIGA Escolar.*  
*Cualquier nueva función incorporada a la plataforma se documentará automáticamente en este archivo.*
