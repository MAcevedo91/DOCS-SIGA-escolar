# **PROPUESTA DE MÓDULOS INNOVADORES DE ALTO IMPACTO**

## **Hacia una Gestión de Convivencia Escolar Formativa, Preventiva y Restaurativa**

**Para:** Equipo Directivo y Coordinación de Convivencia Escolar – Escuela Coeducacional N° 1 El Salvador  
 **De:** Equipo de Desarrollo SIGA Escolar (INACAP)  
 **Fecha:** Octubre 2026  
 **Propósito:** Evaluación y validación de nuevas funcionalidades de alto impacto para la versión de entrega oficial.

---

### **Estimado Equipo Directivo y de Convivencia Escolar:**

Junto con saludar cordialmente, nos dirigimos a ustedes para presentar una propuesta estratégica orientada a la evolución de **SIGA Escolar**.

Los sistemas tradicionales presentes en el ámbito escolar suelen actuar como simples "repositorios de sanciones", limitándose a registrar los hechos cuando el daño ya ocurrió y aumentando la carga administrativa de los docentes. Nuestra meta es que SIGA Escolar sea una **herramienta viva de acompañamiento pedagógico**, alineada de manera rigurosa con la **Circular N° 482 de la Superintendencia de Educación** y la **Política Nacional de Convivencia Educativa**.

A continuación, presentamos **tres propuestas innovadoras de alto impacto**. Para cada una de ellas hemos diseñado un **flujo de trabajo detallado paso a paso con un caso de uso concreto**, con el fin de que ustedes puedan revisar si los procedimientos propuestos se ajustan a la dinámica diaria de la Escuela El Salvador o si requieren alguna adecuación específica:

---

## **📌 PROPUESTA 1: Asistente Inteligente de Mediación y Acuerdos Formativos (Enfoque Restaurativo)**

### **¿Qué problema resuelve?**

La normativa vigente exige aplicar medidas formativas y de reparación pedagógica antes de contemplar sanciones punitivas extremas (como suspensiones). Sin embargo, redactar acuerdos de compromiso reflexivo y planes de reparación adecuados para la edad del alumno consume horas valiosas al encargado de convivencia o inspector.

### **Caso de Uso Ilustrativo:**

*Dos estudiantes de 7° Básico participan en una discusión en el patio que escala a empujones y ofensas verbales frente a sus compañeros.*

### **Flujo de Trabajo Propuesto Paso a Paso:**

1. **Detección y Clic:** Desde la ficha del incidente ya registrado (`/incidentes/:id`), el encargado de convivencia o inspector pulsa el botón **«Diseñar Acuerdo Formativo / Mediación»**.  
2. **Generación Asistida del Plan:** El sistema analiza las edades de los involucrados y su historial previo (si es primera falta o reincidencia) y formula 3 opciones de acciones reparadoras basadas en el RICE:  
   * *Opción A (Formativa/Reflexiva):* Guía de reflexión guiada con la psicóloga sobre manejo de la frustración.  
   * *Opción B (Servicio Comunitario Escolar):* 3 jornadas de apoyo voluntario en el orden y catalogación de libros en la biblioteca del colegio.  
   * *Opción C (Pedagógica/Grupal):* Elaboración conjunta de un afiche sobre resolución pacífica de conflictos para su sala de clases.  
3. **Personalización del Acuerdo:** El profesional de convivencia selecciona la alternativa más apropiada (o combina aspectos de ellas), edita los plazos de cumplimiento (ej. 10 días hábiles) y define quién será el docente/tutor responsable de la supervisión.  
4. **Emisión del Acta Oficial en PDF:** El sistema genera de forma automática el **Acta de Compromiso y Mediación Escolar** con membrete institucional, marco legal de la Circular 482 y casillas para las firmas del encargado de convivencia, los dos estudiantes y sus apoderados en la entrevista.  
5. **Monitoreo y Cierre del Ciclo:** En la plataforma queda una lista de verificación (*checklist*) con semáforo. Al cumplirse el plazo, el tutor marca *"Tareas formativas cumplidas con éxito"*, lo que actualiza la ficha del estudiante y extingue el conflicto con evidencia documental auditada.

---

## **📌 PROPUESTA 2: Sociograma Escolar Dinámico (Mapa Visual de Clima y Redes de Aula)**

### **¿Qué problema resuelve?**

El aislamiento social, el bullying silencioso y los liderazgos negativos son con frecuencia imperceptibles para los docentes hasta que detona un hecho grave. Actualmente los colegios no disponen de herramientas visuales que consoliden las interacciones registradas a lo largo de los meses.

### **Caso de Uso Ilustrativo:**

*En un 6° Básico, una alumna no tiene reportes de agresiones físicas directas, pero ha sido mencionada como víctima en 4 incidentes menores de exclusión y burlas registrados por distintos profesores de asignatura durante el semestre.*

### **Flujo de Trabajo Propuesto Paso a Paso:**

1. **Acceso al Tablero de Curso:** El Orientador, Directivo o Profesor Jefe ingresa al módulo de Analítica y selecciona la pestaña **«Sociograma y Clima de Aula»**, escogiendo el curso deseado (ej. *6° Básico A*).  
2. **Visualización Gráfica Interactiva:** La plataforma despliega un grafo donde cada estudiante es un nodo y las líneas representan los incidentes en los que interactuaron:  
   * *Líneas rojas:* Conflictos o agresiones entre pares.  
   * *Nodos en color ámbar/rojo:* Alumnos con reiteradas menciones de involucramiento.  
   * *Nodos aislados:* Estudiantes que aparecen de forma recurrente como víctimas sin red de pares o apoyo observable.  
3. **Identificación de Focos Críticos:** Con un clic sobre un estudiante, el sistema abre un panel lateral con el resumen confidencial de alertas: *"Estudiante en riesgo de aislamiento social reiterado en los últimos 60 días"*.  
4. **Plan de Acción Pedagógica en Jefatura:** Con esta información diagnóstica en mano, el profesor jefe puede actuar de manera preventiva en consejo de curso:  
   * Reorganizar la distribución de bancos en la sala.  
   * Reestructurar grupos de trabajo para fomentar la integración del estudiante aislado.  
   * Derivar el caso de forma temprana al equipo psicosocial (PIE o Dupla) antes de que la situación derive en deserción o crisis de salud mental.

---

## **📌 PROPUESTA 3: Gestor Empático de Citaciones a Familias (Canal Digital Directo)**

### **¿Qué problema resuelve?**

Las citaciones a apoderados por temas conductuales suelen redactarse de forma rígida y fría, generando que los padres asistan a la escuela a la defensiva, con hostilidad o negación, lo que entorpece la entrevista y desgasta a los profesionales del colegio. Además, coordinar y constatar la entrega de la citación en papel es lento y difícil de auditar.

### **Caso de Uso Ilustrativo:**

*Un estudiante de 4° Básico protagoniza un desborde emocional en el patio y daña mobiliario escolar. Inspectoría necesita citar con urgencia a su apoderado titular para el día siguiente.*

### **Flujo de Trabajo Propuesto Paso a Paso:**

1. **Generación de la Citación:** Al finalizar el registro del incidente, el funcionario hace clic en **«Citar Apoderado»**.  
2. **Redacción Asistida con Inteligencia Emocional:** El sistema propone automáticamente un texto formal pero orientado a la alianza formativa:

    *"Estimado(a) apoderado(a) de \[Nombre Alumno\]: Junto con saludar, nos comunicamos desde la Escuela Coeducacional N° 1 El Salvador para invitarle a una reunión de colaboración pedagógica el día \[Fecha\] a las \[Hora\]. Deseamos abordar conjuntamente una situación ocurrida durante la jornada de hoy y acordar las mejores estrategias de apoyo formativo para el bienestar de su hijo(a)..."*

3. **Selección del Canal de Envío:**  
   * *Vía Correo Electrónico:* Envío institucional con formato membretado y botón de confirmación de asistencia para el apoderado.  
   * *Vía Mensajería Rápida (WhatsApp):* Genera un enlace directo para enviar el texto oficial preformateado desde el teléfono institucional de inspectoría con un solo toque.  
   * *Vía Colilla Imprimible:* Para casos sin conectividad, emite la colilla estándar para la libreta de comunicaciones.  
4. **Trazabilidad y Respaldo Legal:** En el expediente digital del incidente queda estampada la marca temporal: *"Apoderado notificado el día 10/10/2026 a las 11:30 hrs vía correo"*. Al presentarse el apoderado, el inspector registra la asistencia con un clic, cumpliendo de manera transparente con los plazos perentorios exigidos por la Superintendencia de Educación.

---

### **Preguntas para la Evaluación del Establecimiento:**

Agradecemos nos puedan retroalimentar sobre los siguientes puntos:

1. **Sobre los flujos de trabajo:** ¿Los pasos descritos en cada propuesta se ajustan a la forma en que su equipo opera en la escuela, o existe alguna etapa que deba modificarse para reflejar mejor sus protocolos internos?  
2. **Sobre la prioridad:** Considerando las necesidades más urgentes del establecimiento para este cierre de año y el inicio del próximo período, ¿cuál de las tres propuestas consideran que aportaría el mayor valor práctico inmediato?

Quedamos a su entera disposición para reunirnos a revisar estos flujos o incorporar las adecuaciones que estimen necesarias.

Atentamente,  
 **Equipo de Proyecto SIGA Escolar**  
 *Escuela Coeducacional N° 1 El Salvador – INACAP*

*«Hola. En función de las propuestas que aparecen y las preguntas también que se… que se redactan al final para reflexionar sobre la utilidad del… de la aplicación, podríamos considerar lo siguiente: con respecto a la primera pregunta, que dice: "¿Los pasos descritos en cada propuesta se ajustan a la forma en que su equipo opera?", etcétera.*

*Bueno, estuvimos revisando las tres propuestas que aparecen y, eh, yo creo que un aspecto que puede ser importante con respecto a la propuesta uno, que es eh frente a estos acuerdos de mediación, considerar como una etapa también el que el apoderado sea informado. En el sentido de que, más allá de que yo lo tenga como un registro como archivo propio, eh también que el apoderado sepa de que su hijo fue parte de una mediación. Obviamente, me imagino que eso significa de que eh se informa previamente; o sea, no sé, pues, ponte tú, hay una pelea entre niños o niñas, ¿cierto?, tratas de resolverla, se pregunta si hay voluntad de mediar, ¿cierto?, eso tú le comunicas al apoderado, y posteriormente, cuando se haga la mediación, ese acuerdo que se genera, que aparece acá en la propuesta uno, también le les llegue a ellos. Espero haberme haberme expresado bien, no sé, igual me di como la media vuelta.*

*Con respecto eh… Entonces, perdón, con con la pregunta uno, considerar entonces la copia de correo al apoderado eh y también, yo creo que eh es importante, me imagino debe venir por añadidura, que considere el correo como de reporte al profe jefe, ¿sí? "Profesor Roberto, eh se llevó a cabo una mediación entre sus estudiantes por tal motivo, acá están los acuerdos firmados", etcétera.*

*Con respecto a la propuesta dos, eh respecto a los sociogramas, ¿sabes que yo tengo una una consulta respecto a esto? ¿Cómo se obtendrían? ¿Qué qué haríamos? ¿Cómo cómo eh la aplicación tendría los los datos? ¿Tendría que aplicarlos yo tal vez de forma manual a los niños y después pasarlos a a alguna base de datos, o hacer un Google Form y que yo te paso el link de Google Form con respecto a las preguntas que salen y que eso lo los analice la la IA? Eh tengo esa esa duda, no no sé qué operatividad se se podría relacionar ahí.*

*Eh yo creo que también se podría considerar el que eh a partir del diagnóstico, como una en la fase de ayuda al profesor jefe, eh junto con que le entregue información, ¿cierto?, conclusiones y toma de acciones, también eh la posibilidad, que lo hacen algunas otras aplicaciones así, como entregar propuestas. Por ejemplo: "Profesor, ¿sabe qué? A partir del diagnóstico de los sociogramas se establece que su curso se encuentra atomizado en pequeños grupos que eh que interactúan muy poco entre sí. Para esto, le sugerimos trabajar el valor de la empatía con tal material", ¿cachái? Tal vez no la planificación completa para que el profe lo ajuste, ¿cachái?, pero sí como que le dé ciertas ciertas ideas.*

*Bien. Yo creo también con respecto a la propuesta dos que, eh como el sociograma va a generar estos nudos críticos, ¿cierto?, o inexistencia de lazos, creo que eso también sería importante que, ya sea el encargado de convivencia, el equipo de formación y el profe jefe, puedan acceder a como a datos que permitan elaborar un perfil del estudiante. ¿A qué voy con esto? Que muchas veces eh, no sé po, el apoderado toma la decisión que va a llevar a su hijo a un especialista y el especialista le dice: "Ya, pídale a lo a la escuela que le manden un informe de perfil del estudiante: cómo es él, cómo se comporta, cómo lo hace al cómo cuál es su actitud hacia el aprendizaje". Entonces, que eh a lo mejor que la el el perfil de estudiante de estos sociogramas tú puedas, no sé, hacerle clic y diga ciertas características que permitan redactar un perfil, ya sea que lo pueda redactar de forma automática la aplicación o algunas características que la profe o el profe la pueda tomar y elaborar su propio informe, o el asistente social, según se requiera.*

*Espero que esa parte también se se haya entendido.*

*Y con respecto a la a la a la propuesta tres, que es esta como citación empática, yo creo de que también me parece súper bien. Eh bueno, obviamente son cosas a a considerar más adelante. Eh por ejemplo, creo que es importante hacer algunas distinciones de conceptos, porque por ejemplo, ahí se habla de una citación de colaboración pedagógica. Está súper bien ese concepto, ¿sabes qué? Está rebueno, huevón. Pero creo que, en función de que el equipo de formación ve aspectos socioemocionales, tal vez podría ser de colaboración pedagógica formativa, ¿cachái? Como que se diferencie, que pedagógica se puede estar relacionado eh a lo a lo académico, ¿cachái? Bueno, pero esa es una apreciación netamente eh conceptual, po. ¿Okay?*

*Entonces, eso podría decirte con respecto a cada propuesta respecto a los pasos descritos, que en realidad sí siguen una línea natural de cosas que se hacen, pero son estos ajustes. A repetir: en la uno, eh que se le pueda reportar de forma inmediata la el acuerdo de mediación y le llegue el documento a él, al profe, eh o sea, a los papás y al profe, ¿ya? La propuesta dos, ¿cierto?, considerar la el mecanismo de cómo se va a obtener los datos, eh la entrega de las propuestas de trabajo y los que pueda generar perfiles de estudiante a partir de lo que se está viendo ahí, po, que los profes lo puedan después editar, adaptar, agrandar, po, ¿cachái?*

*Bien, y la pregunta dos, con respecto a lo que es la prioridad: "¿Cuál de las tres propuestas considera que aportaría así a en lo inmediato?". Yo, por ejemplo, te podría decir que en este momento es la propuesta uno, ¿cachái? Estamos en una altura del año donde también ya eh ciertos conflictos que eran de baja intensidad tienen un poco más de efervescencia, están todos cansados de alguna u otra forma, ¿cachái? Siempre hay novedades, siempre hay cualquier cagazo se mandan, cagazo y todo, entonces eh yo creo que la la mediación podría permitir eh hacer eh llegar a acuerdos y tratar de de ir cerrando, de ir cerrando. Entonces, eso también es una herramienta que le sirve a la escuela para decir: "Miren, nosotros el niño ha pasado por cosas, nosotros hemos hecho esto, esto, esto. Ya, pues, usted en la casa también póngase póngase las pilas ahí con con su crianza".*

*Oye, eh no sé si eso te ayuda en lo que son la las respuestas a las preguntas que aparecen al último del documento. Cualquier otra otra eh cualquier otro requerimiento eh me avisas, ¿cierto? El último, ahí buscando los los tiempitos para hacerlo, ¿ya?*

*Eh, sí, pues. Creo que eran esas dos preguntas no más. Pues ya los… Ya, vale. Espero que sea de de utilidad. Nos vemos, que estés muy bien.»*

