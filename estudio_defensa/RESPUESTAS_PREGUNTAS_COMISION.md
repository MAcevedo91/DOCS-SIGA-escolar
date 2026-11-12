# Banco Completo de Respuestas para Defensa y Evaluación — SIGA Escolar

**Archivo origen de preguntas:** [`Preguntas.txt`](./Preguntas.txt) (51 preguntas)  
**Contexto:** Preparación conjunta para defensa de **Proyecto de Título (Ingeniería en Informática — INACAP)**, evaluación de **Innovación y Emprendimiento III** y presentación en **Feria de Innovación**.  
**Caso de aplicación real:** Escuela Coeducacional N.º 1 El Salvador (Campamento Minero El Salvador, Atacama, dependiente del SLEP Atacama, 483 estudiantes matriculados).

---

## Cómo usar este documento (Doble Nivel + Etiquetas de Rigor)

Cada una de las **51 preguntas** está agrupada por **Dominio Temático** y cuenta con dos niveles de respuesta:
1. **Respuesta breve y sencilla:** Versión directa, coloquial y lista para decir en voz alta (15–30 segundos) sin enredarse en tecnicismos.
2. **Respuesta técnica detallada (respaldo de defensa):** Argumentación completa con cifras, normativa, arquitectura y evidencia del proyecto.

Para resguardar la **honestidad académica y técnica** frente a cualquier comisión evaluadora:
- **`[MEDIDO]`**: Dato verificado directamente en el código fuente o mediante ejecución en vivo de pruebas/comandos durante esta revisión.
- **`[FUENTE]`**: Dato documentado explícitamente en los archivos formales del proyecto (`FORMULACIÓN DEL PROYECTO DE TÍTULO`, `INFORME_EJECUCION_Y_AVANCE_PROYECTO.md`, `PLAN_PRUEBAS_UAT.md`, `GUIA_DEFENSA_ESTRATEGICA_Y_NEGOCIO.md`, `MATRIZ_DE_RIESGOS_Y_DIFICULTADES.md` o informes de I+E III).
- **`[SUPUESTO]`**: Estimación comercial, financiera o de escalamiento proyectada en guías de negocio (no es un contrato firmado ni un resultado histórico medido).
- **`[VERIFICAR]`**: Punto o cifra comercial que el equipo (Marcelo, Daniel y Claudia) debe acordar o confirmar según el enfoque específico de la evaluación (Proyecto de Título vs. Innovación III).

> **Nota sobre preguntas orientadas a hardware / obras civiles (N.º 13, 23, 39, 40 y 46):**  
> El cuestionario contiene preguntas diseñadas de forma transversal para proyectos con sensores, cámaras, antenas o infraestructura física en terreno. Dado que **SIGA Escolar es una plataforma 100% Cloud SaaS** (sin hardware ni sensores dedicados en el colegio), en cada una de esas preguntas se responde aclarando primero ese alcance y explicando luego su equivalente real en arquitectura en la nube, dispositivos existentes y continuidad operativa.

---

## Mapa de Agrupación por Dominios (51 Preguntas)

| Dominio | Temática Central | Preguntas Incluidas (`Preguntas.txt`) | Cantidad |
| :--- | :--- | :--- | :---: |
| **Dominio 1** | Mercado y Modelo de Negocio | **1, 2, 3, 4, 5, 6** | 6 |
| **Dominio 2** | Seguridad, Privacidad y Confiabilidad | **7, 8, 21, 22** | 4 |
| **Dominio 3** | Propuesta de Valor, Competencia e Innovación | **9, 12, 25, 26, 27, 31, 48, 51** | 8 |
| **Dominio 4** | Ingeniería, Requerimientos, Arquitectura y Tecnologías | **10, 24, 37, 38, 42, 43** | 6 |
| **Dominio 5** | Operación, Adopción del Cliente, Costos de Entrada y Stakeholders | **11, 13, 14, 15, 16, 17, 18, 32, 33, 35, 36** | 11 |
| **Dominio 6** | SLAs, Incidentes, Hardware, Condiciones Extremas y Continuidad | **19, 20, 23, 39, 40, 46** | 6 |
| **Dominio 7** | Emprendimiento, Empresa, Escalamiento y Riesgos | **28, 29, 30, 34, 41** | 5 |
| **Dominio 8** | Pruebas, Validación, TRL 5 y Roadmap de Implementación | **44, 45, 47, 49, 50** | 5 |

---

## Dominio 1: Mercado y Modelo de Negocio (Preguntas 1 a 6)

### 1. ¿Cuál es tu mercado y de qué tamaño es?

> **Respuesta breve y sencilla:**  
> En Chile hay **10.945 colegios en total** (base 2025). Nuestro mercado directo son los **7.811 establecimientos con convenio SEP (el 71,4%)**, porque la ley les permite pagarnos con esa subvención, destacando **1.707 colegios públicos administrados por SLEP**. El primer año no dependemos solo de los 60 colegios del SLEP Atacama: atacamos en paralelo colegios SEP cercanos y referencias dentro de la red SLEP, con una meta realista de **5 a 10 colegios**.

**Respuesta técnica detallada (respaldo de defensa):**  
Nuestro mercado objetivo es el **sector educacional escolar en Chile (modelo B2B y B2G EdTech)**, específicamente los establecimientos obligados por ley a contar con un Reglamento Interno de Convivencia Escolar (RICE) y responder ante la fiscalización de la Superintendencia de Educación.

**Respaldo cuantitativo `[FUENTE: GUIA_DEFENSA_ESTRATEGICA_Y_NEGOCIO.md — Base Estadística 2025 MINEDUC]`:**
- **TAM (Mercado Total Direccionable):** **10.945 establecimientos educacionales** en Chile (`100%` del total, base estadística 2025).
- **SAM (Mercado Disponible con capacidad de pago SEP):** **7.811 establecimientos con convenio SEP (`71,4%` del total)**, habilitados para financiar plataformas de convivencia escolar vía PME (Ley N.º 20.248). Dentro de este universo destacan **1.707 establecimientos administrados por SLEP (`15,6%` del total)** como segmento público en expansión.
- **SOM (Mercado Objetivo Inicial):** Estrategia dual que **no depende únicamente de los 60 establecimientos del SLEP Atacama** (red de nuestro piloto en la Escuela Coeducacional N.º 1 El Salvador, `483` alumnos), sino que combina: (1) **carril de proximidad** en colegios particulares subvencionados y públicos con convenio SEP cercanos al equipo (venta más ágil), y (2) **carril de referencia en red** hacia el SLEP Atacama. Meta realista Año 1: **5 a 10 establecimientos** `[SUPUESTO]`.

---

### 2. ¿Cuál es el método de venta de tu proyecto: licencias de uso o una sola venta? (¿Cuál es tu modelo de negocio?)

> **Respuesta breve y sencilla:**  
> Es una **suscripción mensual o anual por colegio** (modelo SaaS), no una venta única ni un cobro por cada profesor. No se vende una sola vez porque las leyes educativas cambian y hay que actualizar protocolos y servidores en la nube; y no cobramos por usuario para que los profesores no compartan contraseñas, lo que dañaría la trazabilidad legal. Los colegios públicos pagan vía Mercado Público con fondos SEP, y los particulares con contrato directo.

**Respuesta técnica detallada (respaldo de defensa):**  
Es un modelo **SaaS (Software as a Service) B2B/B2G basado en licencias de uso por suscripción periódica (anual o mensual) por establecimiento educacional**, no una venta única de software empaquetado ni un cobro por cuenta de usuario.

**Respaldo técnico y comercial:**
- **Por qué suscripción SaaS y no venta única (`[FUENTE]`):** La normativa educacional chilena cambia (nuevas circulares de la Superintendencia, Ley 21.719) y el establecimiento requiere alojamiento cloud, copias de respaldo, mantenimiento evolutivo, actualización de protocolos y soporte continuo.
- **Por qué por colegio/tramo de matrícula y no por usuario (`[FUENTE]`):** Cobrar por usuario incentiva que docentes o inspectores compartan contraseñas para ahorrar presupuesto, lo que destruye la trazabilidad legal y la bitácora de auditoría.
- **Canales de contratación:**
  - **B2G (colegios públicos y SLEP):** A través de **Mercado Público / ChileCompra** (Compra Ágil < 30 UTM para pilotos o licitación/Convenio Marco), imputado legalmente a la acción de Convivencia Escolar del **PME con fondos Ley SEP** (Circular N.º 1 de la Superintendencia).
  - **B2B (particulares subvencionados y pagados):** Contrato directo con fundaciones o corporaciones educacionales.
- **Nota de rigor (I+E III) `[VERIFICAR]`:** En el informe de *Innovación y Emprendimiento III*, el equipo dejó explícito que la modalidad comercial definitiva y tarifa se validan frente al TCO real del cliente antes de formalizar el contrato piloto.

---

### 3. ¿Cuál es la expectativa de venta: cuánto por mes o meses?

> **Respuesta breve y sencilla:**  
> Hoy en el piloto con la Escuela El Salvador el costo es **$0 CLP** porque usamos capas gratuitas. Ya en etapa comercial, cobrando un promedio de **$200.000 a $250.000 CLP al mes por colegio** frente a un gasto fijo mensual estimado de **$455.000 CLP**, alcanzamos el punto de equilibrio con solo **3 colegios pagando** (~$600.000/mes). Con la meta realista de **5 a 10 colegios en el Año 1**, proyectamos facturar entre **$1.000.000 y $2.000.000 CLP mensuales**.

**Respuesta técnica detallada (respaldo de defensa):**  
Debemos distinguir entre el **piloto académico actual** y la **proyección comercial SaaS**:
1. **En el piloto actual con la Escuela El Salvador `[FUENTE]`:** La operación está planteada con **$0 CLP de desembolso comercial** para el colegio durante el proyecto de título, operando sobre capas gratuitas PaaS.
2. **En proyección comercial SaaS `[SUPUESTO — GUIA_DEFENSA_ESTRATEGICA_Y_NEGOCIO.md]`:** Con una tarifa promedio de **$200.000 a $250.000 CLP/mes por establecimiento**, el **punto de equilibrio (*break-even*)** frente a un OPEX inicial estimado de **$455.000 CLP/mes** se alcanza con **3 colegios pagando** (~$600.000 CLP/mes). Con la meta operativa realista de **5 a 10 colegios** en el Año 1 (combinando colegios con convenio SEP cercanos y expansión por referencia en el SLEP Atacama), se proyecta un **MRR de ~$1.000.000 a $2.000.000 CLP/mes** `[SUPUESTO / VERIFICAR]`.

> **Nota para el equipo `[VERIFICAR]`:** Al responder al profesor de Innovación, aclaren que los ingresos proyectados son una **meta comercial sujeta a validación del piloto y ventana presupuestaria escolar (octubre–diciembre)**, cuando los colegios comprometen su PME/SEP del año siguiente.

---

### 4. ¿Qué nivel de TRL tiene el proyecto? *(si es prototipo sin validación real es TRL-4)*

> **Respuesta breve y sencilla:**  
> Estamos en **TRL 4 (pasando a TRL 5)**. El sistema ya está programado de punta a punta, desplegado en la nube, probado con **799 tests automáticos** y validado en reuniones con el director y coordinador de la escuela; pero con honestidad técnica, no podemos decir TRL 5 todavía hasta terminar la marcha blanca funcionando en la rutina diaria real del colegio y medir resultados frente a Lirmi.

**Respuesta técnica detallada (respaldo de defensa):**  
Con total honestidad metodológica, el proyecto se encuentra en **TRL 4 (en transición a TRL 5)**.

**Por qué TRL 4 y no inflar a TRL 6–7 `[FUENTE]`:**
- **Lo ya demostrado (cubre TRL 3 y TRL 4):** La arquitectura completa está construida, integrada extremo a extremo y desplegada en la nube (`Vercel + Render + Supabase`), respaldada por **799 pruebas automatizadas aprobadas** (`546` en Jest backend + `253` en Vitest frontend) `[MEDIDO]` y validada funcionalmente en sesiones con la contraparte técnica (Coordinador Roberto Miranda y Director Rodrigo Pacheco, con acta de patrocinio/aceptación firmada).
- **Por qué sigue siendo TRL 4 según estándar estricto:** Tal como declaramos en *Innovación y Emprendimiento III*, la existencia del código desplegado y pruebas técnicas con datos sintéticos o pruebas controladas **no reemplaza la validación operacional sostenida en el entorno escolar real** ni la medición comparativa longitudinal frente a la alternativa vigente (Lirmi / Anexo D). Por eso nos posicionamos honestamente en **TRL 4**, listos para certificar **TRL 5** al cerrar el piloto supervisado en terreno.

---

### 5. Si quiero comprarte la idea y el prototipo, ¿en cuánto lo venden? *(considerar gastos hasta ahora y expectativa de ganancia futura limitada)*

> **Respuesta breve y sencilla:**  
> En efectivo gastamos **$0 CLP** por usar capas gratuitas, pero el equipo invirtió **541 horas reales de ingeniería**, equivalentes a unos **$8.120.000 CLP** —ese es nuestro piso mínimo para no perder nuestro trabajo—. Como aún es un prototipo TRL 4 sin cartera de clientes pagando, pero entregas código completo, seguridad multi-colegio, IA con privacidad, 10 protocolos RICE, PDFs sellados y 799 tests listos, el precio justo de venta es entre **$10.000.000 y $13.000.000 CLP**.

**Respuesta técnica detallada (respaldo de defensa):**  
Para valorizar objetivamente la cesión de la idea y el prototipo en etapa **TRL 4** (donde aún no hay cartera de contratos comerciales recurrentes y el retorno futuro tiene riesgo de adopción), nos basamos en el **costo real de ingeniería documentado en la Formulación del Proyecto** (`Tabla 17`):
- **Desembolso en caja hasta hoy:** **$0 CLP** (infraestructura Cloud Free Tier y equipos propios del equipo).
- **Inversión real de ingeniería valorizada (Costo de oportunidad) `[FUENTE]`:** **541 Horas-Persona (HH)** acumuladas entre los Releases 1, 2 y 3 (Sprints 1 al 11), tasadas a tarifa estándar de ingeniería de **$15.000 CLP/HH**, lo que suma **$8.117.250 CLP**.
- **Precio de venta sugerido del prototipo + código fuente + propiedad intelectual `[SUPUESTO / VERIFICAR]`:**
  - **Piso técnico (recuperación de ingeniería invertida):** **$8.120.000 CLP**.
  - **Valor de transferencia negociable en etapa temprana (con margen acotado por riesgo TRL 4):** Entre **$10.000.000 y $13.000.000 CLP** `[VERIFICAR con Daniel y Claudia]`, considerando que el comprador recibe arquitectura multi-tenant con RLS ya codificada, 10 protocolos RICE, pipeline DLP + RAG, generación PDF con hash SHA-256, 799 tests automatizados y toda la documentación IEEE 830 / manuales.

---

### 6. ¿Cuál es el precio de la contratación de su servicio?

> **Respuesta breve y sencilla:**  
> Cobramos según el tamaño del colegio y con cuentas ilimitadas para su personal: **$150.000 CLP/mes** el Plan Básico (hasta 300 alumnos), **$250.000 CLP/mes** el Plan Pro (300 a 800 alumnos, con Copiloto IA y todas las automatizaciones) y **$200.000 CLP/mes por colegio** para redes SLEP de más de 10 recintos. Para la Escuela El Salvador el Plan Pro cuesta $3 millones al año, apenas un **1,3% de su presupuesto anual SEP**.

**Respuesta técnica detallada (respaldo de defensa):**  
Para comercialización SaaS proponemos una estructura escalonada **por tramo de matrícula del establecimiento** (sin límite de cuentas de funcionarios para garantizar trazabilidad) `[SUPUESTO — GUIA_DEFENSA_ESTRATEGICA_Y_NEGOCIO.md]`:
- **Plan Básico (hasta 300 alumnos):** **$150.000 CLP/mes** ($1.800.000 CLP/año). Incluye registro móvil de incidentes, catálogo de faltas y los 10 protocolos RICE.
- **Plan Pro (300 a 800 alumnos — segmento de la Escuela El Salvador):** **$250.000 CLP/mes** ($3.000.000 CLP/año). Suma Copiloto IA con filtro DLP, bandeja inteligente de plazos fatales, mediaciones, sociograma, citaciones móviles y actas PDF con SHA-256. Representa cerca del **1,3% del presupuesto anual SEP** estimado para una escuela de este tamaño (~$220M CLP/año).
- **Plan Red / Enterprise (SLEP o corporaciones >10 colegios):** **$200.000 CLP/mes por establecimiento**, con analítica consolidada de red.

*(Nota de transparencia: durante el piloto de Proyecto de Título con la Escuela El Salvador, la plataforma opera a **$0 CLP** para el colegio; la tarifa comercial definitiva debe considerar el TCO real medido tras el piloto `[VERIFICAR]`).*

---

## Dominio 2: Seguridad, Privacidad y Confiabilidad (Preguntas 7, 8, 21 y 22)

### 7. ¿Cómo protegen el sistema de los ciberataques?

> **Respuesta breve y sencilla:**  
> Protegemos el sistema con cuatro capas de seguridad: primero, todo el tráfico viaja cifrado con HTTPS y conexiones internas privadas; segundo, en la puerta de entrada tenemos bloqueo contra robots y ataques de fuerza bruta (máximo 5 intentos antes de bloquear 15 minutos); tercero, validamos y limpiamos todo lo que se escribe para evitar inyecciones de código o SQL; y cuarto, adentro las contraseñas van encriptadas, cada rol tiene permisos estrictos y la base de datos aísla completamente a cada colegio mediante Row-Level Security.

**Respuesta técnica detallada (respaldo de defensa):**  
Aplicamos **defensa en profundidad** en red, API, aplicación y base de datos (`[FUENTE]` y verificado en `siga-backend/package.json`):
1. **Cifrado de tránsito obligatorio:** Todo el tráfico externo viaja por **HTTPS con TLS 1.3** (puerto `443`); el puerto `80` HTTP redirige forzadamente (`301`). Las conexiones internas del backend hacia PostgreSQL (`5432`, `sslmode=require`), Redis (`6379`, `rediss://`) y SMTP (`587`, `STARTTLS`) también van cifradas y nunca se exponen al navegador.
2. **Protección perimetral de API:**
   - Cabeceras HTTP endurecidas con **Helmet** (HSTS, CSP, Frameguard, protección XSS).
   - **CORS** restringido exclusivamente a orígenes autorizados.
   - **Rate Limiting (`express-rate-limit`)** para mitigar fuerza bruta y abuso de endpoints.
   - Bloqueo automático temporal de cuentas por **15 minutos** tras **5 intentos fallidos** de inicio de sesión.
3. **Saneamiento y validación contra inyecciones:** Validación estricta de payloads con **Zod 4**, sanitización anti-XSS con **`isomorphic-dompurify`** y consultas SQL parametrizadas (protección contra SQL Injection).
4. **Control de acceso e integridad:** Contraseñas con **bcrypt**, tokens **JWT** con expiración de 8 horas, control matricial **RBAC** en rutas, aislamiento **PostgreSQL `FORCE RLS`**, prevención de IDOR verificando pertenencia al `tenant_id`, y gestión de secretos exclusivamente mediante variables de entorno fuera del repositorio Git.

---

### 8. ¿Cómo aseguran que no hay violación a la intimidad de los datos almacenados?

> **Respuesta breve y sencilla:**  
> Protegemos la privacidad de los niños desde el diseño siguiendo la Ley 21.719: la base de datos separa a cada colegio con candados nativos (`FORCE RLS`) para que nunca se mezclen expedientes; cada cargo ve solo lo que le corresponde (un docente no ve fichas de salud); antes de consultar la IA borramos nombres y RUTs para que viajen anónimos; todo acceso queda en una bitácora que nadie puede borrar; y los apoderados solo ven la fecha y lugar de su citación en un enlace temporal.

**Respuesta técnica detallada (respaldo de defensa):**  
Cumpliendo con el principio de **Privacidad por Diseño (*Privacy by Design*)** y el marco de la **Ley N.º 19.628** y **Ley N.º 21.719** sobre datos sensibles de menores `[FUENTE]`:
1. **Aislamiento multi-tenant a nivel de motor SQL (`FORCE ROW LEVEL SECURITY`):** Cada fila operativa posee `tenant_id`. PostgreSQL evalúa la política `tenant_id = current_setting('app.current_tenant_id')::uuid`, impidiendo que un colegio acceda a datos de otro incluso si existiera un error en el código del backend.
2. **Segregación estricta por rol (RBAC):** Un docente o inspector **no** puede consultar fichas clínicas ni derivaciones médicas (`GET /api/v1/estudiantes/:id/expediente-salud` y `/ficha-medica-pdf` devuelven `HTTP 403 Forbidden` salvo para *Administrador*, *Directivo* y *Equipo de Formación*). Además, el **Mapa de Calor** y el **Sociograma** operan con métricas agregadas y formativas sin exponer diagnósticos PIE ni etiquetas punitivas.
3. **Pipeline DLP antes de consultar la IA:** Antes de enviar cualquier relato a Google Gemini, el backend sustituye nombres, RUTs y teléfonos por tokens anónimos (`[ESTUDIANTE_A]`, `[RUT_ENMASCARADO]`). De igual modo, al emitir fichas para especialistas externos de salud, los nombres de compañeros involucrados se reemplazan por iniciales (ej. `J. C. P. G.`).
4. **Bitácora de auditoría inmutable (`auditoria`):** Un *trigger* en base de datos bloquea cualquier `UPDATE` o `DELETE` sobre los logs, registrando quién, cuándo, desde qué IP y qué expediente consultó o modificó.
5. **Enlaces mínimos para apoderados:** Las citaciones públicas operan con tokens UUID que expiran en **72 horas** y muestran únicamente fecha, lugar y motivo de la reunión, sin acceso al sistema interno.

---

### 21. ¿Qué grado de confiabilidad tiene el sistema? *(principalmente los que tienen IA)*

> **Respuesta breve y sencilla:**  
> La base del sistema (registros, permisos y bloqueo de pasos legales) es 100% exacta y está respaldada por **799 pruebas automáticas**. En la parte con IA, como ningún modelo es infalible, la controlamos con cuatro barreras: siempre responde citando el reglamento oficial del colegio o la Circular 482, anonimiza los datos antes de consultar a Gemini, si falla la API entrega las reglas locales sin caerse, y **nunca sanciona ni cierra casos sola** —un humano siempre revisa y aprueba—.

**Respuesta técnica detallada (respaldo de defensa):**  
Separamos la confiabilidad en dos planos claros para no vender falsas garantías:
1. **Núcleo transaccional, normativo y de acceso (Alta confiabilidad determinista):**
   - Opera sobre PostgreSQL con propiedades **ACID**, reglas de máquina de estados y bloqueos obligatorios en protocolos RICE.
   - Está respaldado por **799 pruebas automatizadas aprobadas** (`546` unitarias/integración en Jest backend —con 5 omitidas de 551— y `253` en Vitest frontend) `[MEDIDO]`.
2. **Módulos con Inteligencia Artificial (Confiabilidad acotada y controlada):**
   - Como todo Modelo de Lenguaje (LLM) es probabilístico y puede cometer imprecisiones, **no confiamos ciegamente en la salida cruda de la IA**. Blindamos su confiabilidad con 4 controles verificables `[FUENTE]`:
     - **RAG Grounding jerárquico (`pgvector`):** El Copiloto RICE consulta primero los fragmentos indexados del RICE propio del colegio y, de forma supletoria, los de la Circular N.º 482, filtrando páginas de índice y mostrando en pantalla las **citas textuales y porcentaje de similitud** para que el profesional verifique la fuente.
     - **DLP determinista:** Probado unitariamente (`geminiDlp.test.js`) para censurar PII antes de invocar la API externa.
     - **Fallback determinista:** Si falla la API de Gemini o falta `GEMINI_API_KEY`, el sistema **no cae** ni alucina: entrega directamente el fragmento normativo oficial estructurado y registra `modo: 'fallback'`.
     - **Decisión humana obligatoria (*Human-in-the-Loop*):** La IA **tiene prohibido** aplicar sanciones, cerrar protocolos o diagnosticar estudiantes; solo entrega borradores editables que deben ser revisados y aprobados por un funcionario responsable antes de generar PDF o enviar correo.

---

### 22. ¿Cómo se maneja la seguridad de acceso al sistema?

> **Respuesta breve y sencilla:**  
> Controlamos el acceso en cuatro niveles: las contraseñas se guardan encriptadas y si alguien falla **5 veces** la cuenta se bloquea por **15 minutos**; la sesión vence sola a las **8 horas**; el sistema verifica en cada acción cuál de los **5 roles** tiene permiso y a qué colegio pertenece; y los apoderados entran sin crear usuario ni contraseña mediante un enlace único que caduca a las **72 horas**.

**Respuesta técnica detallada (respaldo de defensa):**  
Mediante autenticación robusta, autorización por roles, aislamiento de inquilino y tokens externos efímeros:
1. **Autenticación:** Inicio de sesión con contraseña hasheada mediante **bcrypt** (coste 10) y bloqueo de **15 minutos tras 5 intentos fallidos**. Emisión de **JWT (JSON Web Token)** firmado con expiración de **8 horas** (`CP-01`, `CP-10`).
2. **Autorización matricial (RBAC):** Middlewares `authenticateToken` y `requireRole(...)` en Express sincronizados con guardas de ruta (`RoleRoute` / `PrivateRoute`) y renderizado dinámico del menú en React para **5 roles**: *Administrador*, *Directivo*, *Equipo de Formación*, *Inspector* y *Docente*.
3. **Contexto de institución (`setTenantContext`):** Extrae el `tenant_id` desde el JWT verificado (nunca confía en un `tenant_id` enviado libremente por el usuario) y activa la política RLS de PostgreSQL para esa petición.
4. **Acceso externo sin credenciales para familias:** Los apoderados confirman citaciones mediante un enlace único con **token UUID de 72 horas de vigencia**; pasado ese plazo, la API responde `HTTP 410 Gone`.

---

## Dominio 3: Propuesta de Valor, Competencia e Innovación (Preguntas 9, 12, 25, 26, 27, 31, 48 y 51)

### 9. ¿Cuál es el principal aporte de valor del proyecto?

> **Respuesta breve y sencilla:**  
> Transformar un manejo de convivencia hecho en papeles sueltos, cuadernos y Excel —donde solo se reacciona cuando el problema ya explotó— en un flujo único, ordenado y legalmente auditable, que guía los protocolos sin saltarse plazos, protege la privacidad de los niños y devuelve tiempo real al equipo para acompañar a los estudiantes.

**Respuesta técnica detallada (respaldo de defensa):**  
Transformar la gestión de la convivencia escolar desde un **papeleo disperso, reactivo y punitivo** hacia un **flujo centralizado, preventivo, restaurativo y jurídicamente auditable**, que asegura el **debido proceso** exigido por la Superintendencia de Educación (Circular N.º 482 / Res. Ex. N.º 781), protege la privacidad de los menores (Ley N.º 21.719) y devuelve tiempo real al equipo educativo para acompañar a sus estudiantes.

---

### 12. ¿Cuál es su principal competidor y en qué se diferencian?

> **Respuesta breve y sencilla:**  
> El referente principal en nuestro cliente es **Lirmi** (que El Salvador ya usa para notas y asistencia), además de otros ERP como Napsis o WebClass y las planillas Excel actuales. No queremos reemplazar su libro de clases: nos especializamos 100% en convivencia escolar con los 10 protocolos RICE con bloqueos legales, semáforos de 24/48 horas, mediación en 2 columnas, sociograma ético, citación móvil sellada e IA anónima —y mediremos en el piloto si superamos en valor a ampliar Lirmi—.

**Respuesta técnica detallada (respaldo de defensa):**  
El referente principal en nuestro cliente es **Lirmi** (que la Escuela El Salvador ya utiliza para el libro de clases digital y asistencia, aunque no tiene contratado su módulo de convivencia), junto con plataformas presentes en el mercado chileno como **Napsis**, **Appoderado.com**, **Kimche**, **WebClass/Colegium**, referentes de clima como **Pulso Escolar**, y la alternativa base de **carpetas físicas/Excel** `[FUENTE]`.

**Diferenciación clave (y postura honesta de evaluación):**
- **Especialización vertical (*Best-of-Breed*) vs. ERP generalista:** Los ERPs como Lirmi concentran su foco en calificaciones, libro de clases y asistencia SIGE. SIGA no compite por reemplazar el libro de notas; se especializa exclusivamente en **convivencia y acompañamiento**, articulando los **10 protocolos RICE locales con bloqueo de etapas por evidencia**, semáforos de plazos fatales (`24h`/`48h`), **mediación restaurativa en 2 columnas**, **sociograma ético por aula**, **citación móvil 1-clic con acta SHA-256** y **Copiloto IA (RAG + filtro DLP)**.
- **Honestidad metodológica (I+E III):** No damos por demostrada una inferioridad comercial de Lirmi sin probarla. Si al cotizar y ejecutar las pruebas comparativas del **Anexo D**, ampliar Lirmi resolviera las tareas del RICE local con menor esfuerzo y menor Costo Total de Propiedad (TCO), la recomendación profesional sería ampliar Lirmi. SIGA se justifica demostrando un ajuste superior al flujo normativo real de la escuela.

---

### 25. ¿Cuál es la principal innovación de la solución?

> **Respuesta breve y sencilla:**  
> Nuestra innovación es unir en un solo recorrido guiado tres cosas que hoy viven separadas: el **cumplimiento legal estricto del RICE** (alertas de 24 y 48 horas y bloqueos para no saltarse pasos), **herramientas restaurativas y de prevención** (mediación escolar, sociograma sin etiquetas y citación móvil con acta sellada), e **Inteligencia Artificial ética** que consulta el reglamento del colegio borrando antes los datos personales de los niños y dejando siempre la decisión al humano.

**Respuesta técnica detallada (respaldo de defensa):**  
Es una **innovación incremental de proceso**: unir en un solo recorrido guiado el **cumplimiento procedimental obligatorio del RICE** (semáforos `<48h`/`<24h` y bloqueos de debido proceso), herramientas de **justicia restaurativa y prevención** (mediación escolar en 2 columnas, citación móvil sin login sellada con hash **SHA-256** y sociograma relacional sin etiquetas punitivas) e **Inteligencia Artificial ética con RAG jerárquico** (RICE del colegio + Circular N.º 482 supletoria) protegida por un **pipeline DLP de anonimización de menores** (`Ley 21.719`) bajo regla estricta **Human-in-the-Loop**.

---

### 26. ¿Cuál es el problema principal que resuelven? ¿Cómo impacta en la operación actual de la empresa o cliente?

> **Respuesta breve y sencilla:**  
> Resolvemos que hoy los incidentes quedan dispersos en cuadernos de patio, actas sueltas en Word y Excel, lo que impide ver conflictos repetidos a tiempo y hace perder cientos de horas transcribiendo papeles. Con SIGA, el inspector registra en el celular en segundos, Convivencia ve alertas antes de que venzan plazos legales, la redacción de actas baja en pruebas de ~20 minutos a menos de 3 minutos y las familias reciben citaciones formales sin filtrar datos clínicos.

**Respuesta técnica detallada (respaldo de defensa):**  
Resolvemos la **gestión fragmentada y manual de los antecedentes y protocolos de convivencia escolar** (anotaciones en papel en patio, actas sueltas en Word y planillas Excel locales), que impedía detectar patrones tempranos de escalamiento, consumía horas profesionales en transcripción y exponía a la escuela a omitir plazos legales o garantías del debido proceso.

**Impacto en la operación de la Escuela El Salvador (483 alumnos, ~25–35 incidentes semanales) `[FUENTE]`:**
- **En patio e Inspectoría:** Sustituye el papel borrador por captura móvil estructurada en selectores en cascada, centralizando el historial de inmediato.
- **En Convivencia y Dirección:** Visibiliza qué casos están cerca de vencer plazos legales, bloquea cierres sin evidencias de descargo y acelera la redacción de borradores de actas y citaciones (en pruebas controladas del prototipo, la generación pasa de ~20 min manuales a <3 min entre borrador IA y PDF oficial, dato que se validará comparativamente con el equipo en el piloto Anexo D).
- **En Dupla Psicosocial y Familias:** Formaliza acuerdos restaurativos de mediación y citación con respaldo verificable y sin exponer antecedentes clínicos a roles no autorizados.

---

### 27. ¿Qué consecuencias tiene la empresa si no hace uso de esta solución? *(Idealmente en cifra de gasto o pérdidas)*

> **Respuesta breve y sencilla:**  
> Seguir con papeles y Excel expone al colegio a cuatro pérdidas concretas: multas de la Superintendencia de **50 a 1.000 UTM** (desde unos $3,3 millones hasta más de $67 millones) por incumplir protocolos; responsabilidad penal directa si pasan más de **24 horas** sin denunciar un posible delito; entre **400 y 460 horas al año** perdidas en transcripción; y cerca de un **40% de faltas leves repetidas** que pasan inadvertidas hasta escalar en violencia o pérdida de asistencia.

**Respuesta técnica detallada (respaldo de defensa):**  
Mantener la gestión fragmentada en papel y planillas expone al establecimiento a cuatro pérdidas concretas `[FUENTE: GUIA_DEFENSA_ESTRATEGICA_Y_NEGOCIO.md]`:
1. **Multas pecuniarias de la Superintendencia de Educación (Art. 73 Ley N.º 20.529):** Por incumplir el debido proceso, no activar protocolos RICE o extraviar respaldos en una fiscalización, las sanciones van de **50 a 1.000 UTM** (**~$3,3 millones a más de $67.000.000 CLP**), además de eventual retención de subvenciones.
2. **Responsabilidad penal personal (Art. 175 letra e del Código Procesal Penal):** Vencer el plazo fatal de **24 horas** para denunciar hechos con apariencia de delito acarrea responsabilidad penal directa para directivos y docentes.
3. **Desperdicio de horas profesionales remuneradas:** En el diagnóstico de ~25 a 35 incidentes semanales (~1.200–1.400 eventos/año), dedicar ~20 minutos de transcripción y papeleo manual por caso equivale a **~400 a 460 horas anuales** absorbidas en digitación en vez de intervención formativa directa.
4. **Escalamiento tardío de violencia y pérdida de matrícula/asistencia:** En el levantamiento institucional se estimó que cerca del **40% de faltas leves reiteradas pasaban inadvertidas**, escalando a conflictos graves que deterioran el clima escolar y afectan la asistencia (de la cual depende la subvención estatal).

---

### 31. ¿Existen soluciones similares ya presentes en el mercado y cómo pretenden atraer a sus clientes?

> **Respuesta breve y sencilla:**  
> Sí existen ERPs escolares generales (como Lirmi o WebClass) y apps de mensajería. Para atraer colegios no les pedimos cambiar su libro de notas: entramos como especialista en convivencia usando su misma nómina SIGE, demostramos que se financia al 100% con fondos Ley SEP (~1,3% del presupuesto SEP) vía Compra Ágil, y combinamos venta directa en colegios SEP cercanos con referencias dentro del SLEP Atacama.

**Respuesta técnica detallada (respaldo de defensa):**  
Sí, existen **ERPs escolares generalistas** (Lirmi, WebClass, Colegium, Napsis, Kimche) y plataformas de mensajería o clima escolar (Appoderado.com, Papinotas, Pulso Escolar) `[FUENTE]`.

**Estrategia de atracción y adopción (*Land & Expand* + Ley SEP):**
1. **Cero disrupción al libro de clases:** No obligamos al colegio a cambiar su ERP de notas (ej. Lirmi); entramos como módulo especialista en Convivencia compatible con exportación de nómina SIGE.
2. **Viabilidad presupuestaria vía Ley SEP:** Demostramos que es un gasto 100% elegible bajo la acción de Convivencia Escolar del **PME** (~1,3% del presupuesto anual SEP en un colegio tipo como El Salvador) y contratable rápidamente en el sector público mediante **Compra Ágil (<30 UTM)**.
3. **Estrategia dual (Proximidad + Referencia en Red):** Combinar ventas tempranas en **colegios particulares subvencionados y públicos con convenio SEP cercanos al equipo** (`7.811` recintos con SEP en el país) junto con la expansión por referencia hacia el **SLEP Atacama (60 escuelas/liceos)** y el resto del universo SLEP (`1.707` establecimientos), evitando depender de un solo sostenedor `[SUPUESTO]`.

---

### 48. ¿Cuál es la funcionalidad más relevante que genera diferenciación?

> **Respuesta breve y sencilla:**  
> Lo que más nos diferencia es tener unidos en un solo flujo los **10 protocolos RICE guiados con alertas de 24 y 48 horas y bloqueo si faltan descargos**, conectados con un **Copiloto IA que consulta el reglamento borrando antes los datos de los niños**, y cerrando el ciclo con **mediaciones en 2 columnas** y **citaciones móviles con acta sellada con SHA-256**. Otros solo guardan anotaciones en texto libre; SIGA blinda legalmente todo el proceso.

**Respuesta técnica detallada (respaldo de defensa):**  
La combinación integrada de **Orquestación Guiada de los 10 Protocolos RICE con Semáforos de Plazos Fatales (`24h`/`48h`) y Bloqueo por Debido Proceso**, conectada con el **Copiloto IA RAG (RICE local + Circular N.º 482) sanitizado por filtro DLP (`Ley 21.719`)**, que cierra además el ciclo en **Mediaciones Restaurativas en 2 columnas** y **Citaciones Móviles con Acta SHA-256**. Mientras otros sistemas solo ofrecen cajas de texto libre para "anotaciones", SIGA garantiza trazabilidad legal de punta a punta sin exponer datos de niños a modelos externos.

---

### 51. ¿De qué se trata tu proyecto, qué problema resuelve o qué valor agrega? *(Pitch resumen)*

> **Respuesta breve y sencilla (Pitch 35–45 segundos):**  
> "SIGA Escolar es un servicio digital web que facilita y ordena la gestión de la convivencia escolar en los colegios chilenos. Resuelve la dispersión de incidentes en cuadernos, actas sueltas y planillas que hoy retrasa la detección temprana de conflictos, sobrecarga de papeleo a docentes y expone a la escuela a multas de hasta 1.000 UTM por incumplir plazos del RICE. Agrega valor al conectar en un flujo único a inspectores, dupla psicosocial, dirección y apoderados: permite registrar incidentes desde el celular en terreno, guía paso a paso los 10 protocolos normativos con alertas de plazos legales, incorpora mediación restaurativa, sociograma de curso y citación móvil con acta sellada criptográficamente, e integra Inteligencia Artificial para consultar el reglamento y redactar borradores en segundos sin enviar jamás datos identificatorios de los niños y manteniendo siempre la decisión final en manos humanas."

**Respuesta técnica detallada (respaldo de defensa):**  
- **0–10 s (Qué es):** Plataforma SaaS B2B/B2G web y PWA *Mobile-First* para gestión integral de convivencia escolar y cumplimiento normativo RICE.
- **10–25 s (Problema):** Elimina los cuadernos borrador, Word sueltos y Excel paralelos que ocultan faltas reiteradas (~40% inadvertidas), consumen ~400–460 h/año en digitación y arriesgan sanciones Supereduc de 50 a 1.000 UTM o responsabilidad penal (24 h).
- **25–45 s (Diferencial técnico):** Flujo único desde patio (<90 s) hasta mediación en 2 columnas, sociograma formativo no punitivo, citación móvil por token (72 h), acta PDF sellada con SHA-256 y Copiloto IA (RAG jerárquico RICE + Circular 482 con filtro DLP Ley 21.719 y *Human-in-the-Loop*).

---

## Dominio 4: Ingeniería, Requerimientos, Arquitectura y Tecnologías (Preguntas 10, 24, 37, 38, 42 y 43)

### 10. ¿Cuántos objetivos específicos están cumplidos en su proyecto?

> **Respuesta breve y sencilla:**  
> De los **5 objetivos específicos** que fijamos al inicio, **4 ya están 100% cumplidos** (modelado normativo, arquitectura segura, desarrollo de todos los módulos e IA, y reportería PDF automática con alertas). El **5.º objetivo** ya está desplegado en la nube y probado con **799 tests automáticos**, quedando pendiente únicamente cerrar la marcha blanca comparativa en terreno y firmar el acta final con la escuela (~85%–90%).

**Respuesta técnica detallada (respaldo de defensa):**  
En la *Formulación del Proyecto de Título* (`4.3.2`) se definieron **5 objetivos específicos**. Hoy **4 están cumplidos al 100%** en ingeniería y software, y el **5.º está cumplido en su despliegue productivo técnico y pendiente únicamente del cierre formal en terreno con el cliente** `[FUENTE + MEDIDO]`:

1. **Analizar y modelar los procesos operacionales y regulatorios (IEEE 830, 10 protocolos RICE):** ✅ **100% cumplido** (15 RF / 13 RNF y diagramas BPMN As-Is/To-Be documentados).
2. **Diseñar una arquitectura segura orientada a privacidad (PERN + `pgvector`, RBAC, RLS, Audit Log, DLP Ley 21.719):** ✅ **100% cumplido**.
3. **Desarrollar los módulos transaccionales y de asistencia inteligente (usuarios, importación masiva, incidentes Mobile-First, protocolos, RAG, mapa de calor, sociograma, mediaciones y citaciones):** ✅ **100% cumplido en código y pruebas automatizadas** (los informes hasta Prueba 24 cubren Sprints 1 a 11).
4. **Automatizar la reportería formal y el control de contingencias (semáforos `<48h`, actas PDF `<3s`, hash SHA-256):** ✅ **100% cumplido**.
5. **Verificar y desplegar la solución en entorno productivo:** 🟡 **En cierre (~85%–90%)** — El sistema ya está desplegado en nube (`Vercel + Render + Supabase`) y verificado con **799 pruebas automatizadas**; falta únicamente completar la ronda final de marcha blanca comparativa con los 5 roles en la Escuela El Salvador (Anexo D) y firmar el **Acta de Recepción Final UAT**.

---

### 24. ¿Cómo se lograron los requerimientos funcionales de la solución?

> **Respuesta breve y sencilla:**  
> Seguimos cuatro pasos ordenados: primero entrevistamos en terreno al Coordinador de Convivencia y revisamos su reglamento RICE 2026; segundo traducimos todo a requisitos IEEE 830, diagramas de flujo y casos de uso; tercero programamos por sprints en Jira y GitHub con revisión de código; y cuarto ajustamos según feedback real (por ejemplo, simplificar el reporte de patio a menos de 90 segundos en el celular) y lo validamos con pruebas automáticas y UAT.

**Respuesta técnica detallada (respaldo de defensa):**  
Mediante un flujo de trazabilidad ingenieril de cuatro eslabones `[FUENTE]`:
1. **Levantamiento en terreno con Stakeholders reales:** Entrevistas documentadas con el Coordinador de Convivencia (Roberto Miranda) y revisión directa del RICE 2026 del establecimiento y la Circular N.º 482 / Res. Ex. N.º 781.
2. **Especificación formal bajo IEEE 830 y modelado:** Traducción a requerimientos funcionales y no funcionales, procesos **BPMN 2.0** y **10 paquetes de Casos de Uso UML** (`PKG-01` a `PKG-10`).
3. **Construcción ágil bajo Scrum, GitFlow y Jira:** Desarrollo incremental en **Sprints 1 al 11** con revisión de pares en Pull Requests, contratos JSON tipados con Zod y cumplimiento de *Definition of Done* (DoD).
4. **Iteración guiada por feedback real y verificación automatizada:** Por ejemplo, tras validar con el colegio el contexto de patio, `RF-06` evolucionó desde un formulario web de escritorio hacia selectores móviles en cascada (<90s), y cada historia quedó trazada hasta tests en **Jest/Vitest** y casos **UAT (`CP-01` a `CP-15`)**.

---

### 37. ¿Por qué usaron estas tecnologías? *(medio de comunicación, tipo de base de datos, lenguajes de programación)*

> **Respuesta breve y sencilla:**  
> Elegimos cada pieza por seguridad legal, presupuesto $0 en piloto y rapidez para un equipo de 3 personas: usamos **HTTPS/TLS 1.3** para que funcione en cualquier navegador escolar sin instalar programas (más WebSockets para alertas en vivo); **PostgreSQL (Supabase)** en lugar de NoSQL porque los expedientes legales exigen orden estricto, aislamiento nativo entre colegios (`FORCE RLS`) y búsqueda vectorial con `pgvector` en el mismo sitio; y **JavaScript Full-Stack (Node.js + React PWA)** para compartir lenguaje y operar fluido en celulares de patio.

**Respuesta técnica detallada (respaldo de defensa):**  
Cada decisión tecnológica responde a restricciones de seguridad legal, presupuesto inicial de piloto (`$0 CLP`) y agilidad de mantenimiento `[FUENTE: DOMINIO_ARQUITECTURA_Y_DECISIONES_TECNICAS.md]`:
- **Medio de comunicación y protocolos:**
  - **HTTPS / TLS 1.3 (puerto `443`)** como puerta única hacia el usuario final, asegurando compatibilidad universal con navegadores escolares detrás de firewalls sin instalar software cliente.
  - **WSS / Socket.io** para notificaciones críticas instantáneas ante faltas graves/gravísimas.
  - **SMTP con STARTTLS (puerto `587`)** para notificaciones oficiales con cumplimiento SPF/DKIM/DMARC hacia apoderados.
- **Tipo de base de datos — PostgreSQL 15 (Supabase) en lugar de NoSQL (MongoDB):**
  - La convivencia escolar es un proceso **jurídico y relacional (3FN)** que exige integridad referencial y transacciones **ACID** estrictas.
  - PostgreSQL provee de forma nativa **Row Level Security (`FORCE RLS`)** para aislar colegios a nivel de motor de base de datos, **`JSONB`** para auditoría y compromisos, **`unaccent`** para búsqueda rápida de alumnos sin tildes, y **`pgvector`** para el RAG normativo en la misma base de datos sin pagar infraestructura vectorial separada.
- **Lenguajes y frameworks — JavaScript Full-Stack (`Node.js 22` + `Express 5` + `React 18` + `Vite 5` + `Tailwind CSS`):**
  - Unifica frontend y backend en un solo lenguaje para un equipo de 3 desarrolladores, permite construir una SPA **Mobile-First con soporte PWA (`vite-plugin-pwa`)**, dispone de librerías probadas para auditoría y normativa (`Zod 4`, `PDFKit`, `Nodemailer`, `@google/genai`), y permite despliegue desacoplado sobre capas PaaS administradas (**Vercel** + **Render**).

---

### 38. ¿De dónde se obtuvieron los datos para entrenar a las IA utilizadas?

> **Respuesta breve y sencilla:**  
> **Nosotros NO entrenamos ninguna IA con datos de estudiantes**, porque sería muy caro y violaría la Ley 21.719. Usamos modelos ya entrenados de Google Gemini y les conectamos una "biblioteca cerrada" (RAG) que guarda únicamente dos documentos oficiales: el reglamento RICE del colegio y los 10 protocolos nacionales de la Circular 482. Y cuando redactamos actas, un filtro borra antes cualquier nombre o RUT de los alumnos.

**Respuesta técnica detallada (respaldo de defensa — aclaración técnica crucial):**  
**Nosotros NO entrenamos ni reentrenamos ningún modelo de Inteligencia Artificial o LLM con datos de estudiantes**, porque hacerlo requeriría infraestructura de cómputo prohibitiva y violaría la **Ley N.º 21.719** de protección de datos de menores.

**Cómo funciona realmente la IA en SIGA Escolar `[FUENTE]`:**
1. Utilizamos modelos fundacionales preentrenados vía API (**Google Gemini Flash / Gemini 3.8 Flash** y embeddings **`gemini-embedding-001`** de 768 dimensiones).
2. El conocimiento jurídico-escolar no proviene de entrenamiento propio, sino de una arquitectura **RAG (Retrieval-Augmented Generation)** almacenada en `pgvector` que indexa exclusivamente **dos fuentes documentales oficiales**:
   - El **Reglamento Interno de Convivencia Escolar (RICE)** vigente de la Escuela Coeducacional N.º 1 El Salvador.
   - Los **10 protocolos obligatorios nacionales de la Circular N.º 482 / Res. Ex. N.º 781 de la Superintendencia de Educación**, cargados como base supletoria en PostgreSQL (`seedCircular482.js`).
3. Para la redacción de borradores de actas, el relato pasa antes por nuestro **filtro DLP**, que enmascara todo dato personal antes de salir hacia la API de Gemini. Así, **ningún dato de ningún alumno entrena modelos externos**.

---

### 42. ¿Por qué este trabajo es de nivel de ingeniería y no de un técnico?

> **Respuesta breve y sencilla:**  
> Porque no es simplemente hacer formularios CRUD para guardar datos: tuvimos que modelar procesos legales complejos bajo estándares IEEE 830 y BPMN, separar colegios desde el propio motor de base de datos (`FORCE RLS`) para evitar fugas aunque falle el código, diseñar un filtro de privacidad para cumplir la Ley 21.719 usando IA, sellar actas con criptografía SHA-256, aplicar teoría de grafos en el sociograma y desplegar todo en arquitectura nube distribuida.

**Respuesta técnica detallada (respaldo de defensa):**  
Porque no se limita a programar pantallas CRUD; resuelve un problema organizacional, regulatorio y de privacidad mediante **diseño arquitectónico, modelado formal y control de riesgos**:
1. **Ingeniería de procesos y requisitos:** Especificación IEEE 830, modelado BPMN 2.0 (As-Is/To-Be), diseño relacional 3FN de 20 tablas, trazabilidad Jira–Git–UAT y análisis económico/PME-SEP.
2. **Arquitectura distribuida y seguridad a nivel de motor:** Desacoplamiento 3 capas (`Vercel + Render + Supabase + Redis`) con aislamiento multi-tenant garantizado mediante **PostgreSQL `FORCE RLS`**, evitando fugas de datos incluso ante un error de programación en el backend.
3. **Privacidad, auditoría forense y criptografía aplicada:** Diseño del **pipeline DLP** para cumplir la Ley N.º 21.719 con LLMs, bitácora inmutable bloqueada por *triggers* SQL, prevención de IDOR y sellado criptográfico **SHA-256** para no repudiación legal en actas PDF.
4. **IA aplicada e ingeniería matemática:** Implementación de **RAG jerárquico subsidiario** (`pgvector` + filtrado de índices + fallback determinista) y **Sociograma Escolar** basado en teoría de grafos (coeficiente de agrupamiento de Watts-Strogatz e índice de cohesión formativa).

---

### 43. ¿Es posible que un técnico de la especialidad pueda hacer este sistema?

> **Respuesta breve y sencilla:**  
> Un técnico capacitado puede hacer perfectamente pantallas o formularios simples para anotar incidentes; pero diseñar y asegurar toda esta arquitectura —multi-colegio resistente a filtraciones (`FORCE RLS`), máquinas de estado legales, IA con anonimización previa, sellado criptográfico, teoría de grafos y casi 800 pruebas automáticas— exige competencias propias de un Ingeniero en Informática.

**Respuesta técnica detallada (respaldo de defensa):**  
Un técnico calificado podría construir un módulo básico de registro o un CRUD web simple de anotaciones. Sin embargo, concebir y asegurar esta plataforma con rigor productivo exige competencias propias de **Ingeniería en Informática**: arquitectura multi-tenant resistente a fugas (`FORCE RLS`), modelado de máquinas de estado legales de debido proceso, arquitectura RAG con subsidiariedad normativa, anonimización DLP previa a modelos de lenguaje, criptografía de integridad documental (`SHA-256`), teoría de grafos no estigmatizante, pruebas automatizadas multicapa (`799` tests) y evaluación de TCO/marco regulatorio público (Ley SEP y Supereduc).

---

## Dominio 5: Operación, Adopción del Cliente, Costos de Entrada y Stakeholders (Preguntas 11, 13, 14, 15, 16, 17, 18, 32, 33, 35 y 36)

### 11. ¿Quiénes son los stakeholders y cómo se comunican con ellos?

> **Respuesta breve y sencilla:**  
> Trabajamos con siete grupos clave, encabezados por el Director Rodrigo Pacheco (sponsor) y el Coordinador Roberto Miranda (cliente experto, con quien nos reunimos cada 15 días los viernes). Además coordinamos entre los 3 del equipo usando Jira y reuniones semanales, recogemos necesidades clínicas de la dupla psicosocial, capacitamos a inspectores y profesores, y alineamos la reportabilidad para el SLEP, la Superintendencia y las familias.

**Respuesta técnica detallada (respaldo de defensa) `[FUENTE: Tabla 8 y Sección 6.3.3 de la Formulación]`:**

| Stakeholder | Rol en el Proyecto | Estrategia y Canal de Comunicación |
| :--- | :--- | :--- |
| **Rodrigo Pacheco Contreras** (Director) | Sponsor Institucional | Reportes ejecutivos de avance al cierre de fases/sprints y validación formal de patrocinio. |
| **Roberto Miranda Vivanco** (Coord. Convivencia) | Cliente Principal y SME (Usuario Experto) | Colaboración directa mediante **sincronización quincenal (viernes 15:00 h)**, Sprint Reviews y validaciones UAT. |
| **Equipo de Proyecto** (M. Acevedo, D. Flores, C. Infante) | Núcleo de Ingeniería, UX y QA | **Jira Software**, **GitHub (PRs con revisión de pares)**, Daily Stand-up semanal (lunes 09:00 h), retrospectivas cada 2 sprints y mensajería directa para contingencias. |
| **Dupla Psicosocial** (Psicólogo, Trabajador Social, PIE) | Usuarios Especializados | Sesiones de consulta y pruebas de usabilidad centradas en confidencialidad clínica y derivaciones. |
| **Inspectores de Patio y Profesores Jefes** | Usuarios Operativos en Terreno | Guías rápidas, manual didáctico (`MANUAL_DE_USUARIO.md`) y talleres prácticos de capacitación. |
| **Superintendencia de Educación / SLEP Atacama** | Ente Regulador / Sostenedor | Cumplimiento verificable mediante actas auditables y reportabilidad PME/SEP. |
| **Estudiantes, Apoderados y Redes Externas** | Beneficiarios / Receptores | Confirmación móvil tokenizada, actas PDF formales y oficios estructurados. |

---

### 13. ¿Qué tiene que hacer un cliente para comprar su servicio? *(¿necesita personal, habilitar obras civiles, cambiar procedimientos, reestructurar el negocio, etc.?)*

> **Respuesta breve y sencilla:**  
> El colegio **no tiene que hacer obras civiles, instalar servidores ni contratar personal nuevo**. Solo hace tres cosas simples: aprobar el gasto en su PME/Ley SEP (con orden de Compra Ágil en colegios públicos o contrato directo en particulares), pasarnos su lista de alumnos desde SIGE junto al PDF de su reglamento RICE, y acordar internamente empezar a registrar en SIGA en lugar de papeles sueltos.

**Respuesta técnica detallada (respaldo de defensa):**  
- **Obras civiles, servidores locales o cableado:** **Nada (Cero).** Como es una solución 100% Cloud SaaS, el colegio no modifica instalaciones físicas ni monta salas de servidores.
- **Contratar personal nuevo o reestructurar el colegio:** **No.** SIGA Escolar replica exactamente los 5 roles institucionales que la ley y el organigrama escolar ya tienen (*Director, Convivencia/Dupla, Inspectores, Docentes*).
- **Lo que SÍ debe hacer el cliente en 3 pasos:**
  1. **Gestión administrativa de compra:** En colegios públicos/SLEP, incorporar la iniciativa en la dimensión Convivencia Escolar de su **PME (Ley SEP)** y emitir Orden de Compra vía **Mercado Público (Compra Ágil <30 UTM o licitación)**; en colegios particulares subvencionados, firma directa de contrato SaaS B2B.
  2. **Entrega de insumos base:** Exportar la nómina CSV/Excel de matrícula desde **SIGE** y entregar el PDF de su **RICE vigente**.
  3. **Ajuste de hábito operativo (gestión del cambio):** Acordar institucionalmente el uso del sistema como registro oficial en lugar de cuadernos sueltos y planillas paralelas.

---

### 14. ¿Qué nivel CMMI debe tener la empresa que adopta el sistema?

> **Respuesta breve y sencilla:**  
> **Ninguno en especial; puede partir desde Nivel 1 (informal).** De hecho CMMI aplica a empresas de software, no a escuelas, y la mayoría hoy funciona con cuadernos y Excel locales. Justamente es SIGA Escolar el que ordena al colegio y lo sube hacia procesos estandarizados y medibles desde el primer día.

**Respuesta técnica detallada (respaldo de defensa):**  
**No se exige ningún nivel CMMI previo; el establecimiento puede operar desde Nivel 1 (Inicial / informal)**, que es justamente la realidad de la mayoría de las escuelas que trabajan hoy con cuadernos físicos y archivos Excel locales. *(Nota técnica: CMMI es un modelo de madurez orientado a organizaciones desarrolladoras de software, no a escuelas básicas).* En términos equivalentes de madurez de procesos, **SIGA Escolar actúa como habilitador para llevar al colegio desde procesos ad-hoc hacia procesos estandarizados, repetibles y medibles**, porque impone flujos normativos, checklists RICE, roles y bitácoras obligatorias desde el primer día.

---

### 15. ¿Qué se debe hacer antes de usar el sistema? *(preparar datos, poblar bases de datos, entrenar IA, capacitar personal, etc.)*

> **Respuesta breve y sencilla:**  
> Hacemos cuatro pasos cortos, sin entrenar ninguna IA: creamos el espacio privado del colegio en la nube, cargamos la lista de alumnos y apoderados exportada desde SIGE junto a las cuentas del personal, subimos el PDF de su reglamento RICE para que la IA lo consulte, y dictamos capacitaciones breves prácticas por cargo.

**Respuesta técnica detallada (respaldo de defensa):**  
Antes de pasar a uso productivo en un colegio se ejecutan 4 pasos acotados:
1. **Crear el entorno del colegio (`tenant_id`):** Dar de alta la institución (RBD, membrete, logo) en la base multi-tenant con RLS activo.
2. **Preparar y cargar datos maestros (sin necesidad de entrenar IA):**
   - Exportar nómina de estudiantes y apoderados desde **SIGE** (formato CSV/Excel) y cargarla mediante el importador masivo de SIGA (que valida RUT con Módulo 11 y evita duplicados).
   - Crear cursos, asignar profesores jefes y habilitar las cuentas de los funcionarios según sus 5 roles RBAC (rotando contraseñas iniciales).
3. **Indexar el RICE oficial (no entrenar LLM):** Subir el PDF/Markdown del **RICE del colegio** en `/configuracion` para vectorizar sus artículos en `pgvector` (768 dimensiones), complementando la Circular N.º 482 ya pre-cargada.
4. **Capacitación práctica por rol:** Sesiones breves diferenciadas (inspectores en uso móvil `<90s`, dupla psicosocial/convivencia en protocolos y DLP, docentes en asistencia/citaciones), respaldadas con el `MANUAL_DE_USUARIO.md`.

---

### 16. Si alguien compra el sistema, ¿en cuánto tiempo lo tienen instalado listo para usar?

> **Respuesta breve y sencilla:**  
> Técnicamente en la nube lo dejamos habilitado en **menos de 24 horas**, porque no hay que instalar nada en computadores locales. Y dejar el colegio completo operando "llave en mano" —limpiando y cargando la nómina SIGE, revisando correos y capacitando a los funcionarios— toma entre **3 y 5 días hábiles** (una semana).

**Respuesta técnica detallada (respaldo de defensa):**  
- **Habilitación técnica en la nube:** **Menos de 24 horas**, porque la arquitectura ya está desplegada en modalidad **multi-tenant SaaS**; dar de alta un nuevo colegio y vectorizar su RICE toma minutos u horas, sin instalar software en PCs locales.
- **Puesta en marcha operacional completa (llave en mano):** Entre **3 y 5 días hábiles** (1 semana calendario) `[SUPUESTO operacional]`, tiempo destinado a limpiar/importar la nómina de matrícula desde SIGE, verificar correos de apoderados y realizar la inducción práctica del personal del colegio.

---

### 17. ¿Se necesita respaldo energético, respaldo de datos o respaldo de comunicaciones para funcionar correctamente?

> **Respuesta breve y sencilla:**  
> Del lado de los servidores, el colegio **no necesita generadores ni equipos de respaldo propios**, porque todo vive en centros de datos nube con respaldos automáticos diarios. Del lado del colegio solo necesita su Wi-Fi o señal celular 4G normal y la batería común de sus teléfonos y PCs; incluso si en el patio se corta un momento el Wi-Fi, la app guarda el reporte en cola hasta que vuelva la señal.

**Respuesta técnica detallada (respaldo de defensa):**  
- **En el lado del servidor/nube:** El colegio **no** necesita grupos electrógenos ni servidores de respaldo propios. La aplicación corre en data centers Cloud administrados (**Vercel CDN**, **Render** y **Supabase AWS `sa-east-1` São Paulo**) con redundancia energética de proveedor y respaldos automáticos gestionados por PostgreSQL (en ambiente comercial Pro se habilitan backups diarios con *Point-in-Time Recovery*, complementados con exportación CSV/PDF para portabilidad del cliente).
- **En el lado del establecimiento:**
  - **Comunicaciones:** Requiere Internet escolar estándar (Wi-Fi o red móvil 4G/5G). Ante microcortes de señal en el patio, el cliente está configurado como **PWA (`vite-plugin-pwa` + Workbox)** con cola local (`offlineQueue`) que resguarda borradores temporalmente hasta recuperar conectividad.
  - **Energía:** Solo la autonomía normal de batería de los smartphones y computadores de trabajo del establecimiento.

---

### 18. ¿Es necesario cambiar algo en mi negocio o empresa para adoptar la solución?

> **Respuesta breve y sencilla:**  
> **No cambia el organigrama, ni la dotación de personal, ni el libro de clases digital (como Lirmi/SIGE).** El único cambio es de hábito en el trabajo diario: dejar de anotar incidentes en cuadernos borrador o Word sueltos y registrarlos directo en SIGA, revisando todos los días el tablero de alertas y plazos.

**Respuesta técnica detallada (respaldo de defensa):**  
**No es necesario cambiar la estructura orgánica del colegio, su planta docente ni sus sistemas académicos externos (como Lirmi/SIGE).** El único cambio requerido es **procedimental / de hábito operativo**: reemplazar el registro manual disperso en cuadernos borrador y Word locales por el ingreso directo en SIGA Escolar, e instituir la rutina diaria de revisión de la pizarra de alertas y semáforos de plazos (`<48h`) por parte de Inspectoría y Convivencia Escolar.

---

### 32. ¿Qué condiciones básicas debe tener la empresa que los contrate? *(servidores, internet, personal técnico, etc.)*

> **Respuesta breve y sencilla:**  
> Requisitos mínimos que casi cualquier colegio en Chile ya cumple: **cero servidores propios y cero informáticos de planta**. Solo necesita computadores normales de oficina, celulares Android o iPhone estándar para los inspectores en patio, Internet escolar o 4G, descargar su nómina desde SIGE y tener su archivo del reglamento RICE.

**Respuesta técnica detallada (respaldo de defensa):**  
Requisitos mínimos y ya presentes en casi cualquier escuela en Chile:
- **Servidores propios:** **Ninguno (0)**.
- **Personal informático de planta:** **No requerido** (el Coordinador/Administrador del colegio gestiona usuarios y RICE desde formularios web simples).
- **Equipos cliente:** Computadores o notebooks estándar para oficina/docentes y smartphones Android 11+ o iOS 15+ (desde 360 px) para inspectores en patio, con navegador web moderno actualizado.
- **Conectividad:** Internet institucional (Wi-Fi o datos móviles 4G).
- **Insumos:** Acceso a descarga de nómina desde SIGE, archivo del RICE vigente y 1 contraparte administrativa/convivencia para coordinar la puesta en marcha.

---

### 33. La empresa que los contrata, ¿debe despedir personal si adopta la solución?

> **Respuesta breve y sencilla:**  
> **No, en absoluto.** SIGA Escolar es una herramienta de apoyo, no un reemplazo de personas; de hecho, la ley y nuestro diseño exigen siempre al Encargado de Convivencia, Inspectores, Dupla y Director tomando decisiones y firmando actas. El tiempo administrativo ahorrado en digitación se reinvierte en atender y acompañar directamente a los estudiantes.

**Respuesta técnica detallada (respaldo de defensa):**  
**No, en absoluto.** SIGA Escolar es un asistente de gestión y acompañamiento, no un sistema de reemplazo de personas. De hecho, las leyes educativas chilenas y nuestro diseño **Human-in-the-Loop** obligan a contar con un Encargado de Convivencia, Inspectores, Dupla Psicosocial y Directivos responsables de cada criterio pedagógico y firma legal. El tiempo administrativo ahorrado en redactar actas y buscar carpetas se reinvierte en **atención directa a estudiantes, mediaciones formativas y prevención temprana**.

---

### 35. ¿Cuál es el costo de inversión de un cliente para adoptar la solución?

> **Respuesta breve y sencilla:**  
> En hardware o instalaciones el colegio invierte **$0 CLP** porque usa sus mismos PCs, teléfonos e Internet. En software, durante el piloto de título la Escuela El Salvador paga **$0 CLP**; y en etapa comercial la suscripción anual proyectada va de **$1.800.000 CLP** (Plan Básico) a **$3.000.000 CLP** (Plan Pro), todo pagable con fondos **Ley SEP** (apenas ~1,3% del presupuesto SEP de una escuela tipo).

**Respuesta técnica detallada (respaldo de defensa):**  
- **Inversión inicial en hardware / infraestructura física:** **$0 CLP** (reutiliza PCs, teléfonos e Internet del colegio).
- **Costo de suscripción y puesta en marcha (TCO anual):**
  - *En el piloto académico actual (Escuela El Salvador):* **$0 CLP** de licenciamiento; la escuela invierte únicamente horas internas de su personal para carga inicial y validación UAT.
  - *En adopción comercial SaaS `[SUPUESTO — GUIA_DEFENSA_ESTRATEGICA_Y_NEGOCIO.md]`*: Entre **$1.800.000 CLP/año** (Plan Básico ≤300 alumnos) y **$3.000.000 CLP/año** (Plan Pro 300–800 alumnos), paquete que cubre licenciamiento, configuración inicial, carga de nómina, capacitación y soporte, siendo financiable íntegramente vía **Ley SEP** (~1,3% del presupuesto SEP anual de un colegio tipo de 483 alumnos) `[SUPUESTO]`.

---

### 36. El sistema, ¿lo instala y lo usa el cliente o ustedes deben instalar?

> **Respuesta breve y sencilla:**  
> El colegio **no instala programas ni servidores**. Nosotros dejamos todo habilitado en la nube ("llave en mano"), cargamos junto a ellos su nómina SIGE y subimos su reglamento RICE; luego los funcionarios entran directo desde el navegador web o anclan el ícono de la app en su celular con un toque.

**Respuesta técnica detallada (respaldo de defensa):**  
El cliente **no instala servidores ni ejecuta instaladores técnicos**. Nosotros realizamos el **aprovisionamiento y puesta en marcha inicial en la nube ("llave en mano")**: habilitamos su `tenant_id`, cargamos junto a ellos la nómina SIGE e indexamos su RICE en `pgvector`. Luego, los funcionarios simplemente ingresan mediante su navegador web (con opción de anclar la **PWA** como ícono en el celular en un toque) y lo usan.

---

## Dominio 6: SLAs, Incidentes, Hardware, Condiciones Extremas y Continuidad (Preguntas 19, 20, 23, 39, 40 y 46)

### 19. *(En `Preguntas.txt` aparece como `10-` en línea 19)* ¿Cuáles son los SLA críticos que prometen y qué valores proponen?

> **Respuesta breve y sencilla:**  
> Comprometemos **7 niveles de servicio** claros para la jornada escolar (07:30 a 18:30 h): disponibilidad mínima de **99,5% al mes**, tableros cargando en menos de **3 segundos**, guardado móvil en menos de **1,5 segundos**, descarga de PDFs en menos de **3 segundos**, alertas graves en menos de **5 segundos**, y atención de fallas críticas en menos de **1 hora** (solución en menos de **4 horas**), respaldado comercialmente con planes nube sin hibernación.

**Respuesta técnica detallada (respaldo de defensa) `[FUENTE: Tabla 11 — Sección 4.2.4 de la Formulación]`:**  
Comprometemos **7 Acuerdos de Nivel de Servicio (SLA)** medibles y auditables para la jornada escolar (lunes a viernes de 07:30 a 18:30 hrs):

| Código | Servicio | Umbral SLA Comprometido |
| :--- | :--- | :--- |
| **SLA-01** | Disponibilidad de la plataforma (Uptime) | **≥ 99,5% mensual** en jornada escolar (07:30–18:30 h) |
| **SLA-02** | Latencia de carga de Dashboard | **< 3,0 segundos** (percentil 95) en red escolar / 4G |
| **SLA-03** | Tiempo de persistencia de incidentes (móvil) | **< 1,5 segundos** en guardado |
| **SLA-04** | Emisión y descarga de Actas PDF | **< 3,0 segundos** por expediente (hasta 10 concurrentes) |
| **SLA-05** | Latencia en notificaciones de faltas graves | **< 5,0 segundos** desde el registro |
| **SLA-06** | Atención de fallas críticas (**P1** — caída total/BD) | Diagnóstico **< 1 hora**; resolución **< 4 horas** |
| **SLA-07** | Atención de errores menores (**P2/P3**) | Diagnóstico **< 8 horas**; resolución **< 48 horas** |

> **Nota técnica de transparencia:** Para sostener contractualmente SLA-01 (≥ 99,5% sin *cold starts*) en un colegio pagado, la plataforma migra desde las capas gratuitas Free Tier hacia planes productivos básicos de Render y Supabase (~$32.000–$45.000 CLP/mes `[SUPUESTO]`).

---

### 20. ¿Cómo manejarán los incidentes de operación del uso del sistema?

> **Respuesta breve y sencilla:**  
> Atendemos fallas en cuatro frentes: clasificamos por gravedad con tiempos de respuesta comprometidos (críticos P1 en menos de 1 hora); monitoreamos automáticamente errores con Sentry y Winston; si llega a caer Gemini o Internet en el patio el sistema se degrada de forma segura con respuestas normativas locales y cola offline sin caerse; y acompañamos al administrador del colegio con soporte directo y manual paso a paso.

**Respuesta técnica detallada (respaldo de defensa):**  
Operamos con un flujo estructurado en 4 capas:
1. **Clasificación y SLAs de soporte:** Incidencias trazadas por severidad (**P1** críticas bloqueo/BD con respuesta <1h y solución <4h; **P2/P3** menores/visuales con respuesta <8h y solución <48h) gestionadas en registro de incidencias.
2. **Observabilidad proactiva en producción:** El backend registra trazas diarias con **Winston** (`winston-daily-rotate-file`), captura automática de excepciones con **Sentry (`@sentry/node`)** y chequeo de salud en `GET /api/v1/health`.
3. **Tolerancia a fallos y degradación elegante:** Si cae temporalmente la API externa de **Google Gemini**, el backend activa un **fallback determinista** que entrega los artículos RICE exactos sin lanzar error HTTP 500; si falla un envío SMTP o hay microcortes en el patio, el sistema trabaja con colas de reintento (`Bull` + Redis), alertas visuales para entrega presencial al apoderado y cola **PWA (`offlineQueue`)**.
4. **Soporte funcional:** Acompañamiento directo al administrador del colegio y documentación paso a paso en `MANUAL_DE_USUARIO.md`.

---

### 23. ¿Quién se preocupa de la mantención de componentes *(sensores, cámaras, antenas)*?

> **Respuesta breve y sencilla:**  
> **SIGA Escolar no usa ni instala sensores, cámaras ni antenas**, porque es 100% software en la nube. El colegio solo mantiene su Wi-Fi y sus PCs o celulares normales; los proveedores nube mantienen los servidores físicos; y nosotros nos encargamos del código, la seguridad y las actualizaciones legales del sistema.

**Respuesta técnica detallada (respaldo de defensa):**  
**SIGA Escolar no utiliza ni instala sensores, cámaras ni antenas propietarias**, porque es un sistema **100% software en la nube (Cloud SaaS)**. Las responsabilidades reales de mantenimiento quedan claramente delimitadas:
- **Red escolar, Wi-Fi y dispositivos finales (PCs, tablets o celulares):** Siguen bajo mantención normal del establecimiento y su sostenedor (SLEP).
- **Hardware Cloud, sistemas operativos y servidores:** Administrados 100% por nuestros proveedores PaaS/BaaS (**Vercel, Render, Supabase**).
- **Código de aplicación, parches de seguridad y actualización normativa (RICE / Circular 482):** Responsabilidad íntegra de nuestro equipo bajo el plan de mantención SaaS.

---

### 39. ¿Cómo afectan las condiciones operacionales a las capacidades del sistema *(polvo, lluvia, terremotos)*?

> **Respuesta breve y sencilla:**  
> Como no tenemos servidores locales ni sensores afuera, **el corazón del sistema no se daña ni por polvo, ni por lluvia, ni por terremotos en la zona**. Todos los expedientes viven respaldados en centros de datos en el extranjero (AWS São Paulo y red global), así que si tiembla o se corta la luz en el colegio no se pierde ningún dato; y si falla el Wi-Fi en el patio, la app guarda el registro en el celular hasta recuperar señal.

**Respuesta técnica detallada (respaldo de defensa):**  
Al no tener servidores locales ni sensores expuestos en exteriores, **el núcleo del sistema no sufre daños físicos por polvo, lluvia o sismos en la zona del establecimiento** (caso crítico de considerar en el Campamento Minero El Salvador en Atacama):
- **Terremotos o cortes eléctricos locales en el colegio:** Los expedientes, actas y respaldos residen en infraestructura distribuida fuera de la zona sísmica local (**AWS `sa-east-1` en São Paulo, Vercel Edge CDN global y Render**), por lo que **ningún sismo o falla eléctrica local provoca pérdida de datos**. Cuando regresa la energía o usando red celular 4G/5G, el equipo sigue operando de inmediato.
- **Cortes temporales de Wi-Fi en patio:** La arquitectura **PWA (`vite-plugin-pwa` / Workbox)** y su cola local permiten resguardar registros temporales en el dispositivo hasta recuperar conexión.
- **Polvo o lluvia en terreno:** Solo afectan al teléfono móvil del inspector; al requerir captura de **menos de 90 segundos** desde cualquier smartphone estándar (idealmente con funda protectora o certificación IP estándar), evita exponer notebooks en el patio.

---

### 40. ¿Cómo impiden que se roben las componentes del sistema?

> **Respuesta breve y sencilla:**  
> Primero, **no hay servidores ni equipos propios nuestros en el colegio que puedan robarse**. Segundo, si le roban el celular o notebook a un inspector o profesor, **no se roban ninguna base de datos**: la información no vive en el equipo sino cifrada en la nube, la sesión vence sola a las 8 horas y el administrador del colegio puede desactivar esa cuenta al instante.

**Respuesta técnica detallada (respaldo de defensa):**  
1. **Inexistencia de hardware propietario en el colegio:** No hay servidores locales, sensores ni equipos dedicados instalados en el recinto que puedan ser sustraídos.
2. **Protección lógica y en la nube si roban un celular o notebook del colegio:**
   - **Los datos no residen en planillas locales del equipo robado**, sino cifrados en Supabase Cloud bajo **TLS 1.3**.
   - Los tokens de sesión **JWT expiran automáticamente a las 8 horas**, las cuentas tienen control **RBAC** y el Administrador del colegio puede **desactivar de inmediato la cuenta del funcionario** cuyo equipo fue robado, revocando su acceso operativo.
   - El código fuente y credenciales viven en repositorios privados y variables de entorno administradas en Vercel/Render/Supabase (nunca en código ni expuestos al cliente).

---

### 46. ¿Qué tecnología es la ideal para un funcionamiento real *(tipo de sensores, equipos de proceso, cámaras, etc.)*?

> **Respuesta breve y sencilla:**  
> No recomendamos cámaras ni sensores biométricos, que chocarían con la Ley 21.719 en menores. Lo ideal para operar en producción es usar celulares y PCs normales en el colegio con Wi-Fi o 4G, conectados a una nube comercial continua sin hibernación: frontend en Vercel, backend en Render con colas Redis, base de datos PostgreSQL + `pgvector` en Supabase Pro con respaldos diarios, correo autenticado y Gemini Flash en plan comercial sin retención de datos.

**Respuesta técnica detallada (respaldo de defensa):**  
No se recomiendan cámaras ni sensores biométricos (que además generarían graves conflictos éticos y legales bajo la **Ley N.º 21.719** en menores). La **arquitectura tecnológica ideal para operación real continua en producción escolar** es:
- **Dispositivos en el colegio:** Smartphones Android 11+ / iOS 15+ (pantalla ≥360 px) para inspectores en terreno, computadores estándar para oficinas/dupla psicosocial y conectividad Wi-Fi institucional o 4G/5G de respaldo.
- **Infraestructura Cloud productiva (evolucionando desde el Free Tier del piloto hacia planes comerciales administrados):**
  - **Frontend:** Vercel Edge CDN (HTTPS TLS 1.3 + PWA).
  - **Backend de proceso:** Contenedores administrados en **Render (plan Starter/Pro sin suspensión por inactividad)** ejecutando Node.js 22 LTS + Express 5 + Workers Bull/Redis.
  - **Base de datos y vectores:** **Supabase Pro (PostgreSQL 15 + `pgvector` en AWS)** con backups automáticos diarios (*Point-in-Time Recovery*) y `FORCE RLS`.
  - **Servicios de apoyo:** Relay SMTP autenticado (Brevo/Resend con SPF/DKIM/DMARC) y **Google Gemini Flash API (nivel comercial con política de no retención/entrenamiento)**.

---

## Dominio 7: Emprendimiento, Empresa, Escalamiento y Riesgos (Preguntas 28, 29, 30, 34 y 41)

### 28. ¿Cuál es el principal riesgo de la operación de la solución? ¿Cómo mitigan si se produce el riesgo?

> **Respuesta breve y sencilla:**  
> Tenemos dos riesgos mayores: el crítico es una **fuga de datos de menores**, que prevenimos borrando nombres antes de enviar a la IA y aislando colegios en la base de datos (`FORCE RLS`); si ocurriera, bloqueamos cuentas al instante, revisamos el registro forense inmutable y notificamos bajo la Ley 21.719. El operacional es que **caiga Gemini/Internet o cueste cambiar el hábito del papel**, lo que cubrimos con respaldo normativo local sin caídas, cola móvil offline y flujos rápidos de menos de 90 segundos.

**Respuesta técnica detallada (respaldo de defensa) `[FUENTE: MATRIZ_DE_RIESGOS_Y_DIFICULTADES.md]`:**  
Identificamos dos riesgos principales (uno legal/seguridad y uno operacional) con protocolos claros si llegan a ocurrir:
1. **Riesgo Crítico Legal/Seguridad — Fuga o exposición indebida de datos sensibles de menores (vía IA o entre tenants):**
   - *Preventivo:* **Pipeline DLP** (enmascara PII antes de Gemini), **PostgreSQL `FORCE RLS`** por `tenant_id`, **RBAC** y auditoría inmutable.
   - *Contingencia si ocurre:* Desactivación inmediata de credenciales/cuentas comprometidas, trazado forense en la tabla inmutable `auditoria`, bloqueo temporal del endpoint afectado y activación de protocolo de notificación institucional conforme a la **Ley N.º 21.719**.
2. **Riesgo Alto Operacional — Indisponibilidad de servicios externos (Gemini API/Internet) o resistencia al cambio del personal:**
   - *Contingencia si cae Gemini o SMTP:* Activación automática del **fallback determinista** (entrega normativa local sin HTTP 500) y alertas en pantalla para entrega física de actas.
   - *Contingencia si cae Internet en patio:* Resguardo temporal mediante cola **PWA (`offlineQueue`)**.
   - *Contingencia de adopción:* Acompañamiento presencial y simplificación del flujo móvil (<90 s en 3 toques).

---

### 29. ¿Cuántas personas necesitan contratar para que su nueva empresa tecnológica funcione?

> **Respuesta breve y sencilla:**  
> Al empezar (piloto y primeros 1 a 3 colegios) **0 contrataciones**: los **3 socios** cubrimos todas las áreas (Marcelo backend, seguridad e IA; Daniel frontend y móvil; Claudia QA, documentación y soporte). Recién al superar los ~5–10 colegios contemplamos contratar **1 persona de soporte y acompañamiento a medio tiempo** (~$400.000 CLP/mes) antes de sumar área comercial.

**Respuesta técnica detallada (respaldo de defensa):**  
- **Etapa inicial (piloto y primeros 1 a 3 colegios):** **0 contrataciones externas.** La empresa parte operando con los **3 socios fundadores**, cubriendo todas las áreas críticas:
  1. **Marcelo Acevedo:** Arquitectura Cloud, Backend, Seguridad, Base de Datos e IA.
  2. **Daniel Flores:** Frontend, UI/UX, PWA Mobile-First y Experiencia de Usuario.
  3. **Claudia Infante:** QA, Documentación, Capacitación a colegios y Soporte Funcional.
- **Etapa de expansión inicial (al crecer sobre ~5–10 colegios / SLEP):** Contemplamos contratar **1 persona de soporte técnico y acompañamiento docente de medio tiempo** (~$400.000 CLP/mes `[SUPUESTO — GUIA_DEFENSA]`), antes de sumar fuerza comercial B2G dedicada.

---

### 30. ¿Qué necesitan para hacer funcionar esta nueva empresa?

> **Respuesta breve y sencilla:**  
> Como la plataforma ya funciona, nos faltan **4 pasos empresariales**: formalizar la empresa (SpA) con facturación electrónica e inscribirla en **Mercado Público** para poder vender al Estado; pasar los servidores nube a planes comerciales pagados; tener un contrato SaaS con resguardo de datos (Ley 21.719); y cerrar el piloto medido en El Salvador para salir a vender o postular a CORFO Semilla Inicia.

**Respuesta técnica detallada (respaldo de defensa):**  
Con el producto tecnológico ya desarrollado en fase funcional, se requieren **4 habilitadores empresariales**:
1. **Formalización legal y tributaria:** Constituir una SpA con giro de servicios informáticos/EdTech, inicio de actividades ante el SII con facturación electrónica e inscripción vigente como **Proveedor del Estado en Mercado Público / ChileCompra** (imprescindible para operar con Compra Ágil y SLEP).
2. **Entorno Cloud en grado comercial:** Activar planes pagados básicos de Supabase, Render y SMTP autenticado para respaldar SLA ≥99,5% + dominio institucional `.cl`.
3. **Contratos y resguardo jurídico:** Contrato tipo SaaS B2B/B2G con acuerdos SLA y cláusula de Encargado de Tratamiento de Datos bajo la Ley N.º 21.719.
4. **Validación comercial inicial:** Cerrar el piloto medido en la Escuela El Salvador (Anexo D y Acta UAT) como caso de referencia para postular a fondos públicos (**CORFO Semilla Inicia** / **Start-Up Chile**) o cerrar primeros contratos Ley SEP.

---

### 34. ¿Cuánto dinero necesitan para echar a andar el negocio?

> **Respuesta breve y sencilla:**  
> Para construir y pilotear el sistema gastamos **$0 CLP de caja** (capas gratuitas y 541 horas propias). Para salir a vender el Año 1 estimamos unos **$150.000 a $300.000 CLP** por única vez en trámites legales, un costo fijo de **~$455.000 CLP/mes** (o apenas ~$55.000/mes si los socios hacen el soporte al inicio) y un capital de trabajo de **$1,5 a $3 millones** para sostener 4–6 meses mientras cierran presupuestos SEP —apalancable con CORFO Semilla Inicia—; desde **3 colegios** el negocio ya se paga solo.

**Respuesta técnica detallada (respaldo de defensa):**  
- **Para construir y pilotear la tecnología actual:** **$0 CLP de capital externo** (se ejecutó con capas Cloud gratuitas y 541 HH de ingeniería propia valorizadas en $8.117.250 CLP como costo de oportunidad) `[FUENTE]`.
- **Para lanzar comercialmente la empresa en Año 1 `[SUPUESTO — GUIA_DEFENSA_ESTRATEGICA_Y_NEGOCIO.md]`:**
  - *Trámites de constitución legal, marca y dominio:* **~$150.000 a $300.000 CLP** por única vez `[SUPUESTO / VERIFICAR]`.
  - *OPEX base mensual (con soporte técnico medio tiempo incluido):* **~$455.000 CLP/mes** (infraestructura Cloud Pro ~$45.000 + API Gemini Flash ~$10.000 + soporte medio tiempo ~$400.000). Si durante los primeros meses los 3 socios cubren directamente el soporte, el costo fijo tecnológico mínimo bordea apenas **~$55.000 CLP/mes**.
  - *Capital de trabajo para 4 a 6 meses mientras madura el ciclo de venta SEP (octubre–diciembre):* Entre **$1.500.000 y $3.000.000 CLP** en bootstrapping propio `[SUPUESTO]`, o apalancable mediante **Semilla Inicia de CORFO** (subsidio de hasta $15.000.000 CLP). Con **3 colegios contratados** ya alcanza punto de equilibrio.

---

### 41. ¿Hacia qué mercado se puede escalar la solución?

> **Respuesta breve y sencilla:**  
> Primero escalamos dentro de Chile **sin cambiar una línea de código** hacia los **7.811 colegios con Ley SEP** (donde están los **1.707 colegios SLEP**, partiendo por los 60 de Atacama), porque cada colegio nuevo recibe su espacio aislado y sube su reglamento en minutos. Después podemos abarcar los **10.945 colegios totales**, adaptarlo a educación superior (Ley 21.369) y, a futuro, llevarlo a otros países de Latinoamérica ajustando los protocolos base.

**Respuesta técnica detallada (respaldo de defensa):**  
1. **Escalamiento horizontal inmediato (mismo país, misma arquitectura):** Despliegue hacia los **7.811 establecimientos con convenio SEP en Chile** (incluyendo los **1.707 establecimientos administrados por SLEP** y la red inicial del **SLEP Atacama** con 60 escuelas/liceos) sin cambiar código base, gracias a la arquitectura **Multi-Tenant con `FORCE RLS`** (cada colegio nuevo recibe un `tenant_id` y carga su propio RICE en minutos).
2. **Escalamiento por segmento educativo nacional:** El universo completo de **10.945 establecimientos del país** (sumando particulares pagados y colegios sin SEP) e **Instituciones de Educación Superior (CFT, IP y Universidades)** parametrizando los protocolos hacia normativas como la Ley N.º 21.369 (acoso y violencia en educación superior) `[SUPUESTO]`.
3. **Escalamiento regional (Latinoamérica):** Adaptación de la tabla supletoria de normativa nacional (equivalente a Circular N.º 482) para ministerios y redes escolares en otros países de la región con leyes de convivencia escolar `[SUPUESTO]`.

---

## Dominio 8: Pruebas, Validación, TRL 5 y Roadmap de Implementación (Preguntas 44, 45, 47, 49 y 50)

### 44. ¿A qué tipo de pruebas ha sido sometido el sistema? *(unitarias, integración, de resistencia, de seguridad, etc.)*

> **Respuesta breve y sencilla:**  
> Tenemos **799 pruebas automatizadas aprobadas hoy en el repositorio**: **546** en el backend con Jest (68 suites, 5 omitidas) y **253** en el frontend con Vitest, además de **5 flujos E2E** creados con Playwright, pruebas reales de seguridad (aislamiento entre colegios, bloqueos por rol, filtro que borra datos hacia Gemini y hash SHA-256) y carga real de 483 alumnos. Con transparencia: aún no hemos ejecutado pruebas masivas de estrés para miles de usuarios ni pentesting externo formal.

**Respuesta técnica detallada (respaldo de defensa) `[MEDIDO en repositorio + FUENTE en documentos]`:**  
1. **Pruebas Unitarias y de Integración Backend (`Jest + Supertest`) `[MEDIDO hoy]`:**  
   **68 de 68 suites ejecutadas y aprobadas**, con **546 pruebas pasando** (y **5 pruebas omitidas/skipped** de un total de 551), cubriendo servicios, controladores, migraciones DDL en PostgreSQL, motor PDFKit, algoritmo de grafos (`sociogramaService.test.js`), workers SMTP, pipeline DLP (`geminiDlp.test.js`), Copiloto RAG (`riceRag.test.js`) y matriz RBAC (`rbacMatrizSeguridad.test.js`). Meta de cobertura configurada en `jest`: 80% líneas.
2. **Pruebas Unitarias y de Componentes Frontend (`Vitest + Testing Library`) `[MEDIDO hoy]`:**  
   **54 de 54 archivos de prueba aprobados**, con **253 pruebas pasando (0 fallos)**, cubriendo páginas, hooks offline (`useOfflineSync.test.js`), tableros, citaciones, mediaciones, sociograma y modales con IA.
3. **Pruebas End-to-End (`Playwright`) `[FUENTE en repo]`:**  
   Existen **5 especificaciones E2E** creadas en `siga-frontend/e2e/` (`auth.spec.js`, `estudiantes.spec.js`, `incidentes.spec.js`, `asistencia.spec.js`, `sprint9.spec.js`) `[VERIFICAR ejecución en entorno completo conectado]`.
4. **Pruebas de Seguridad y Privacidad ejecutadas `[FUENTE]`:**  
   Comprobación de aislamiento RLS (0 filas sin `tenant_id`), bloqueo HTTP `403` por RBAC, bloqueo tras 5 intentos fallidos de login, caducidad de tokens públicos (`HTTP 410 Gone`), verificación en vivo de censura DLP antes de enviar a Gemini (`scripts/verificar-dlp-gemini.js`) y hash criptográfico SHA-256 en PDFs.
5. **Pruebas Funcionales, de Terreno y Aceptación (`PLAN_PRUEBAS_UAT.md` + Anexo D) `[FUENTE]`:**  
   Matriz UAT de **15 casos (`CP-01` a `CP-15`)**, prueba de carga de nómina real de 483 alumnos (<3,5 s), despacho real de correo vía SMTP Brevo en 2,8 s, emisión de PDFs en 1 plana y diseño de **10 casos sintéticos pareados (Anexo D)** para comparar objetivamente contra Lirmi.
6. **Pruebas NO realizadas formalmente aún (transparencia técnica):**  
   No se han ejecutado aún **pruebas masivas de estrés/resistencia (ej. JMeter/k6 con miles de usuarios concurrentes)** ni un **pentesting externo formal**; la concurrencia verificada responde a la escala de un colegio (hasta 10 solicitudes simultáneas en SLA-04).

---

### 45. ¿Quién ha validado la funcionalidad?

> **Respuesta breve y sencilla:**  
> En el colegio lo validaron el **Coordinador de Convivencia (Roberto Miranda)** y el **Director (Rodrigo Pacheco)** de la Escuela El Salvador mediante acta de patrocinio firmada y revisiones cada 15 días con matrícula real y su RICE; técnicamente lo validó nuestro QA y las **799 pruebas automáticas** (y en INACAP la Formulación sacó nota 6,4). Falta únicamente cerrar la marcha blanca con los 5 roles comparando contra Lirmi y firmar el **Acta UAT**.

**Respuesta técnica detallada (respaldo de defensa) `[FUENTE]`:**  
- **Validación institucional y de dominio escolar:** **Roberto Eduardo Miranda Vivanco** (Coordinador de Convivencia Escolar y usuario experto SME) y **Rodrigo Eduardo Pacheco Contreras** (Director de la Escuela Coeducacional N.º 1 El Salvador y Sponsor del proyecto), respaldado con el documento firmado **`firma y aceptacion SIGA escolar(1)(3).pdf`**, minutas de levantamiento y sesiones quincenales de revisión de incrementos (Sprints y Consulta Operativa sobre ficha de 483 alumnos, RICE, informes IA y citaciones).
- **Validación técnica y académica:** Equipo QA interno (Claudia Infante / suite de 799 pruebas automatizadas Jest + Vitest) y evaluación académica INACAP (Formulación calificada con 6,4 en EVA1).
- **Alcance pendiente de validar en cierre final:** La firma del **Acta de Recepción Final UAT** tras completar las sesiones de prueba presencial con los 5 roles completos y la prueba comparativa frente a Lirmi (Anexo D).

---

### 47. ¿Qué hace falta para pasar el prototipo a TRL 5?

> **Respuesta breve y sencilla:**  
> Solo nos faltan **3 pasos concretos**: operar el piloto supervisado dentro del colegio con los **5 roles activos** en terreno, ejecutar y medir los **15 casos UAT junto a los 10 casos comparativos contra Lirmi (Anexo D)** sobre servidores sin reposo, y hacer una prueba documentada de respaldo para firmar el **Acta de Recepción Final UAT**.

**Respuesta técnica detallada (respaldo de defensa):**  
Para pasar formalmente desde **TRL 4** (prototipo completo validado en ambiente controlado/sintético) a **TRL 5** (sistema integrado validado en entorno operacional relevante), faltan **3 hitos concretos y acotados**:
1. **Despliegue de piloto supervisado (marcha blanca) en el contexto real del colegio** operando con los **5 roles activos** (Inspectores en patio con red escolar/4G, Dupla Psicosocial, Coordinador de Convivencia, Docentes y Dirección).
2. **Ejecución y registro cuantitativo del Anexo D y UAT completo (`CP-01` a `CP-15`):** Medir tiempos reales de registro/actas, tasa de errores/omisiones, cumplimiento en terreno de los SLAs (sobre infraestructura sin *cold start*) y contrastar esfuerzo y TCO frente a ampliar el módulo de Lirmi.
3. **Ensayo de restauración y firma del Acta de Recepción UAT:** Ejecutar prueba documentada de respaldo/exportación con datos sintéticos y obtener la firma del acta final por parte del Coordinador de Convivencia y el Director.

---

### 49. ¿Qué usuario es clave para validar el prototipo? *(dimensiones críticas)*

> **Respuesta breve y sencilla:**  
> El usuario principal es el **Coordinador de Convivencia Escolar**, porque maneja todo el ciclo del protocolo. Pero para validar sin puntos ciegos probamos cuatro miradas clave: el Coordinador (reglamento y plazos), el **Inspector de Patio** (rapidez móvil en menos de 90 segundos), la **Dupla Psicosocial** (privacidad clínica y mediaciones) y el **Director** (tablero gerencial, respaldo legal y financiamiento SEP).

**Respuesta técnica detallada (respaldo de defensa):**  
El **usuario clave principal (*anchor user*)** es el **Encargado / Coordinador de Convivencia Escolar** (en nuestro caso, **Roberto Miranda Vivanco**), porque orquesta todo el ciclo desde la alerta inicial hasta el cierre normativo del expediente. Sin embargo, para una validación integral sin puntos ciegos, exigimos validar **4 dimensiones críticas con 4 perfiles**:
1. **Coordinador de Convivencia Escolar:** Valida **ajuste normativo RICE, control de plazos `<48h`/`<24h`, eficiencia del Copiloto RAG/DLP y reportería oficial**.
2. **Inspector de Patio:** Valida **usabilidad *Mobile-First* en terreno**, rapidez de tipificación en `<90s` y tolerancia a microcortes de red.
3. **Dupla Psicosocial (Psicólogo / Trabajador Social):** Valida **confidencialidad estricta (RBAC)**, anonimización de fichas para salud, mediaciones restaurativas y utilidad ética del sociograma.
4. **Director / Sostenedor:** Valida **visibilidad gerencial (Dashboard/Mapa de Calor)**, respaldo probatorio ante la Superintendencia de Educación y viabilidad financiera SEP/TCO.

---

### 50. ¿Cuál es el roadmap para dejar la solución funcionando? *(cambios de procedimientos, compras de equipos, capacitación, preparación de datos, entrenamientos de IA, carga de datos, pilotos de prueba supervisada, etc.)*

> **Respuesta breve y sencilla:**  
> Dejamos un colegio funcionando en **5 pasos cortos** sin obras ni compra de equipos: días 1–2 habilitamos su nube privada; días 2–3 subimos su nómina desde SIGE y creamos las 5 cuentas de roles; día 3 cargamos su reglamento RICE para que la IA lo indexe (sin entrenar modelos); días 4–5 dictamos 3 micro-talleres prácticos por rol y acordamos dejar el papel; y en semanas 2–4 corremos el piloto supervisado hasta firmar el acta UAT.

**Respuesta técnica detallada (respaldo de defensa — Plan de Implementación en 5 Fases):**

| Fase | Plazo | Actividades Clave |
| :--- | :---: | :--- |
| **1. Habilitación Cloud y Equipos** *(Sin obras ni servidores)* | **Días 1–2** | • **Compras de equipos en el colegio: $0** (usa PCs y smartphones existentes con Wi-Fi/4G).<br>• Si pasa a contrato SLA comercial, activar planes productivos **Render + Supabase Pro + Brevo SMTP** (~$32k–$45k CLP/mes) y crear el `tenant_id` del establecimiento. |
| **2. Preparación y Carga de Datos Maestros** | **Días 2–3** | • Exportar matrícula oficial desde **SIGE** (CSV/Excel).<br>• Depurar y ejecutar **importación masiva** con validación RUT Módulo 11 (sin duplicados).<br>• Crear cursos, asignar profesores jefes y habilitar cuentas **RBAC** para los 5 roles. |
| **3. Ingesta Normativa e IA** *(No entrenamiento LLM)* | **Día 3** | • **No se entrena un modelo LLM.** Se carga el PDF del **RICE oficial del colegio** en `/configuracion` para indexar sus *embeddings* en `pgvector` (768 dim), acoplándose automáticamente a los 10 protocolos de la **Circular N.º 482** ya vectorizados.<br>• Configurar membrete institucional, folio y alertas de plazos. |
| **4. Ajustes de Procedimientos y Capacitación** | **Días 4–5** | • Acordar regla operativa interna: todo incidente en patio se captura en SIGA y Convivencia revisa diariamente la pizarra y semáforos `<48h`.<br>• Dictar **3 micro-talleres prácticos por rol** (Inspectores 45 min en celular, Convivencia/Dupla 90 min, Docentes 45 min) apoyados con `MANUAL_DE_USUARIO.md`. |
| **5. Piloto Supervisado y Cierre UAT (Go-Live TRL 5)** | **Semanas 2–4** | • Ejecutar marcha blanca supervisada y prueba comparativa con **10 casos sintéticos pareados (Anexo D)** + **UAT `CP-01` a `CP-15`**. <br>• Calibrar tipologías, verificar SLAs y prueba de respaldo/exportación.<br>• Firmar el **Acta de Recepción Final** y pasar a operación continua con soporte mensual. |

---

## Resumen Ejecutivo Rápido (Chuleta de Cifras Verificadas)

| Concepto | Valor Verificado / Declarado | Etiqueta |
| :--- | :--- | :---: |
| **Establecimiento piloto** | Escuela Coeducacional N.º 1 El Salvador (SLEP Atacama, 483 alumnos, ~25–35 incidentes/sem) | `[FUENTE]` |
| **Inversión de ingeniería valorizada** | 541 HH a $15.000 CLP/HH = **$8.117.250 CLP** ($0 CLP desembolso caja) | `[FUENTE]` |
| **Pruebas automatizadas** | **546 tests backend Jest** aprobados (68 suites, 5 skipped) + **253 tests frontend Vitest** (54 archivos) + 5 specs E2E | `[MEDIDO]` |
| **Nivel de madurez tecnológica** | **TRL 4** (en transición a **TRL 5** al cerrar marcha blanca/UAT Anexo D en terreno) | `[FUENTE]` |
| **Mercado escolar Chile (Base 2025)** | TAM **10.945** colegios / SAM **7.811** con SEP (`71,4%`) / **1.707** SLEP (`15,6%`) / SOM dual: **5–10 colegios Año 1** | `[FUENTE]` |
| **Pricing SaaS / Break-even / OPEX** | Planes $150k–$250k CLP/mes / OPEX inicial ~$455k CLP/mes / Break-even **3 colegios** | `[SUPUESTO]` |
| **Riesgo regulatorio mitigado** | Multas Supereduc hasta **1.000 UTM** (> $67M CLP) y plazo penal **24 h** (Art. 175 CPP) | `[FUENTE]` |
| **Privacidad IA y Normativa** | Pipeline **DLP** + RAG jerárquico (**RICE + Circular 482**) + **Human-in-the-Loop** + **Ley N.º 21.719** | `[FUENTE]` |
