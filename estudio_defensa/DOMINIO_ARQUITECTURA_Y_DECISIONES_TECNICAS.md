# Guía Maestra de Estudio: Dominio de Arquitectura y Decisiones Técnicas
**Proyecto de Título:** SIGA Escolar (Escuela Coeducacional N° 1 El Salvador)  
**Asignatura:** Proyecto de Título – TIHI84 / INACAP  
**Objetivo de esta guía:** Dominar la explicación, justificación, terminología técnica, puertos de red, relación con BPMN y la interconexión entre todos los diagramas para la defensa ante la comisión evaluadora.

---

## 🎯 Enfoque de la Comisión: ¿Qué van a evaluar realmente?
La comisión evaluadora **no busca que describas figuras obvias** (ej.: *"aquí hay una caja que se conecta con una flecha"*). La comisión busca evaluar tu **criterio como Ingeniero en Informática**:
1. **Trazabilidad Sistémica:** ¿Cómo se conecta una tarea del diagrama BPMN con un controlador en Node.js, una tabla en PostgreSQL y un puerto de red en la nube?
2. **Criterio de Red y Seguridad:** ¿Qué puertos están abiertos, cuáles son públicos, cuáles son privados y qué protocolos cifran los datos de los menores?
3. **Manejo Riguroso de la Terminología:** Hablar con propiedad (RLS, PWA, C-S-R, Multi-tenancy, SHA-256, DLP, pgvector, Edge CDN, ACID, 3FN, RBAC, WSS, TLS 1.3).
4. **Justificación de Decisiones (Trade-offs):** Demostrar por qué cada pieza existe y qué riesgo mitiga.

---

## 🗺️ Índice General de la Guía
1. [Bloque 1: Arquitectura General y Desacoplamiento Cloud (Three-Tier y C4)](#bloque-1)
2. [Bloque 2: Modelado de Procesos BPMN 2.0 (As-Is vs. To-Be)](#bloque-2)
3. [Bloque 3: Mapeo y Trazabilidad: De Procesos BPMN a Componentes y DER](#bloque-3)
4. [Bloque 4: Diagrama de Infraestructura, Redes y Puertos de Comunicación](#bloque-4)
5. [Bloque 5: Diagrama de Componentes y Casos de Uso (UML)](#bloque-5)
6. [Bloque 6: Persistencia y Seguridad: DER, Multi-tenancy con RLS y Auditoría](#bloque-6)
7. [Bloque 7: Componentes Innovadores: Pipeline DLP (IA) y Hash Criptográfico](#bloque-7)
8. [Bloque 8: Matriz de Relación entre Todos los Diagramas del Proyecto](#bloque-8)
9. [Bloque 9: Glosario Técnico Exhaustivo (Terminología Clave)](#bloque-9)
10. [Bloque 10: Banco de Preguntas Trampa y Respuestas Modelo](#bloque-10)
11. [Plan de Estudio de 4 Días](#plan-4-dias)

---

<a name="bloque-1"></a>
# Bloque 1: Arquitectura General y Desacoplamiento Cloud

### 1.1 El Patrón: Three-Tier Cloud-Native (Arquitectura Desacoplada en Tres Capas)
SIGA Escolar está estructurado en tres capas lógicas completamente independientes alojadas en plataformas como servicio (PaaS):
1. **Capa de Presentación (Frontend):**
   * **Tecnología:** React 18.3 + Vite 5.4 + Tailwind CSS 3.4.
   * **Alojamiento:** **Vercel** (Edge CDN Global).
   * **Función:** Aplicación de Página Única (SPA) optimizada con enfoque *Mobile-First*. Descarga un bundle liviano (< 150 KB) y se ejecuta en el navegador o teléfono del inspector/docente.
2. **Capa de Lógica del Negocio (Backend):**
   * **Tecnología:** Node.js 22 LTS + Express 5.0.
   * **Alojamiento:** **Render** (Contenedor Linux administrado en la nube).
   * **Función:** API REST Stateless. Valida esquemas de entrada (Zod), gestiona la autenticación JWT, orquesta los 10 protocolos RICE, ejecuta el pipeline DLP antes de llamar a Gemini Flash y genera actas PDF oficiales.
3. **Capa de Persistencia (Base de Datos):**
   * **Tecnología:** PostgreSQL 15 con extensiones `pgvector`.
   * **Alojamiento:** **Supabase Cloud** (AWS sa-east-1, São Paulo).
   * **Función:** Almacenamiento relacional (3FN), aislamiento estricto por colegio (`tenant_id`) con políticas Row Level Security (RLS) y bitácora inmutable de auditoría mediante triggers.

### 1.2 Justificación Ingenieril: ¿Por qué NO un Monolito clásico?
* **Aislamiento de fallos:** Si la capa de presentación en Vercel tiene un problema de red o actualización, el backend y los datos permanecen intactos. Si Render reinicia su contenedor, el usuario no pierde la sesión en el cliente local.
* **Escalabilidad y despliegue independiente:** El equipo frontend puede desplegar mejoras visuales o corregir errores de interfaz en segundos sin tocar ni reiniciar el servidor transaccional.
* **Sostenibilidad Financiera ($0 CLP inicial):** Permite aprovechar los planes gratuitos (Free Tiers) de proveedores especializados: Vercel para estáticos, Render para cómputo backend y Supabase para almacenamiento relacional. Un servidor VPS monolítico tradicional requeriría un pago mensual fijo desde el día 1 ($15 a $40 USD/mes).
* **Seguridad en profundidad:** La base de datos nunca está expuesta directamente a internet; solo el backend en Render se comunica con ella mediante credenciales de servicio y cadenas cifradas TLS 1.3.

---

<a name="bloque-2"></a>
# Bloque 2: Modelado de Procesos BPMN 2.0 (As-Is vs. To-Be)

La comisión evalúa rigurosamente que entiendas la diferencia entre el **proceso del colegio** y el **sistema de software**. BPMN modela el proceso de negocio humano-organizacional.

### 2.1 Los 4 Macroprocesos Modelados
1. **Proceso 1: Gestión de Incidentes de Convivencia y Detección de Escaladas.**
   * *As-Is (Manual):* Inspector anota en papel suelto en patio; profesor anota a mano en libro de clases. Tarda 24 a 72 horas en llegar a Inspectoría. **Falla:** *"Ceguera de datos"*, reincidencias invisibles.
   * *To-Be (SIGA Escolar):* Inspector registra desde el celular en patio en < 90 s. El sistema calcula en tiempo real el *score de riesgo* del alumno y alerta a Convivencia Escolar de inmediato.
2. **Proceso 2: Activación, Tramitación y Certificación de Protocolos RICE.**
   * *As-Is (Manual):* Búsqueda física de carpetas en archivadores. Se pierde el control de plazos perentorios (< 48 horas).
   * *To-Be (SIGA Escolar):* Semáforo digital de plazos fatales. Bloqueo de avance de etapas si no se adjunta evidencia de descargo o entrevista al menor (debido proceso).
3. **Proceso 3: Mediación Escolar y Acuerdos Formativos.**
   * *As-Is (Manual):* Cuaderno rayado archivado en un cajón. El apoderado no se entera o recibe versiones distorsionadas. Sin seguimiento de compromisos.
   * *To-Be (SIGA Escolar):* Acta oficial digital en 2 columnas (Escuela vs. Familia), firma digital, notificación automática por correo al apoderado titular y sellado con hash SHA-256 inmutable.
4. **Proceso 4: Consulta Normativa y Generación Asistida de Informes.**
   * *As-Is (Manual):* Redacción artesanal en Word que toma 1 a 2 horas por caso. Copia y pega de relatos con nombres reales de niños.
   * *To-Be (SIGA Escolar):* Asistente RAG con IA. El backend anonimiza los datos personales (DLP), envía a Gemini Flash solo el relato sin PII y genera el borrador formal del informe en 5 minutos con revisión humana obligatoria (*Human-in-the-Loop*).

---

<a name="bloque-3"></a>
# Bloque 3: Mapeo y Trazabilidad: De Procesos BPMN a Componentes y DER

Para demostrar solvencia senior ante la comisión, debes saber conectar cada tarea del flujo BPMN con su componente de software y su tabla en la base de datos:

| Proceso BPMN (To-Be) | Tarea u Operación en el Flujo BPMN | Componente Frontend (React) | Componente Backend (Express) | Tabla Afectada en el DER |
| :--- | :--- | :--- | :--- | :--- |
| **P1: Gestión de Incidentes** | Captura rápida de falta en patio (<90 s) | `RegistroIncidenteModal.jsx` | `incidentesController.js` ➔ `incidentesService.js` | `incidentes`, `estudiantes` |
| **P1: Gestión de Incidentes** | Cálculo de score y alerta de reincidencia | `BandejaAcciones.jsx` (Dashboard) | `scoringService.js` ➔ `socketService.js` (Push) | `incidentes`, `estudiantes` |
| **P2: Protocolos RICE** | Activación automática / Apertura de caso | `ProtocolosKanban.jsx` | `protocolosController.js` ➔ `protocolosService.js` | `tipos_protocolo`, `pasos_protocolo` |
| **P2: Protocolos RICE** | Fiscalización de plazos (<48 h) | `SemaforoPlazosWidget.jsx` | `plazosCronJob.js` (Worker) ➔ `alertaService.js` | `pasos_protocolo`, `alertas_plazos` |
| **P2: Protocolos RICE** | Carga de evidencias y descargo del alumno | `DetalleProtocolo.jsx` | `evidenciasController.js` ➔ Supabase Storage Client | `evidencias_paso`, `auditoria` |
| **P3: Mediación Escolar** | Apertura de expediente de mediación | `AperturaMediacionModal.jsx` | `mediacionesController.js` ➔ `mediacionesService.js` | `mediaciones`, `participantes_mediacion` |
| **P3: Mediación Escolar** | Redacción de acuerdos mutuos (Escuela/Familia) | `AsistenteAcuerdos.jsx` | `acuerdosController.js` | `acuerdos_mediacion` |
| **P3: Mediación Escolar** | Emisión de acta oficial y sellado criptográfico | `ActaViewer.jsx` (Descarga PDF) | `pdfService.js` (PDFKit) ➔ `crypto.createHash('sha256')` | `mediaciones` (`hash_acta`), `auditoria` |
| **P3: Mediación Escolar** | Notificación por correo al apoderado | Badge en UI | `notificacionesService.js` ➔ Nodemailer (SMTP) | `notificaciones_apoderados` |
| **P4: Consulta y RAG** | Solicitud de redacción asistida con IA | `CopilotoIAModal.jsx` | `aiController.js` ➔ `dlpSanitizer.js` | Lectura de `rice_embeddings` (`pgvector`) |
| **P4: Consulta y RAG** | Generación de borrador normativo con Gemini | `EditorBorradorHumanInTheLoop.jsx`| `geminiService.js` (`@google/genai`) | `borradores_informes` |

---

<a name="bloque-4"></a>
# Bloque 4: Diagrama de Infraestructura, Redes y Puertos de Comunicación

El Diagrama de Infraestructura representa la **Vista Física y de Despliegue**. Debes explicar con exactitud cada segmento de red, cada servidor y cada puerto utilizado.

```text
┌─────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                 MAPA DE INFRAESTRUCTURA Y PUERTOS DE RED                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                         │
│  [ZONA 1: LAN ESCOLAR] (192.168.1.0/24)                                                                 │
│  Inspectores (Móvil/Wi-Fi) / Dirección (PC) ───┐                                                       │
│                                                │                                                        │
│  [ZONA 2: APODERADOS] (Red Móvil 4G/5G)        ├── Port 443 (HTTPS / TLS 1.3) ──► [VERCEL EDGE CDN]    │
│  Smartphones de Familias (Token 72h) ──────────┘                                    (SPA React / Vite)  │
│                                                                                              │          │
│                                                       Port 443 (HTTPS REST / TLS 1.3)        │          │
│                                                       Port 443 (WSS Socket.io / TLS 1.3)     │          │
│                                                                                              ▼          │
│                                                                                   [RENDER CLOUD PAAS]   │
│                                                                                   (Node.js 22 Express)  │
│                                                                                      In: $PORT / 3001   │
│                                                                                              │          │
│                         ┌────────────────────────────────────────────────────────────────────┤          │
│                         │ Out: Port 5432 (TCP / TLS 1.3)                                     │          │
│                         ▼                                                                    ▼          │
│               [SUPABASE CLOUD / AWS]                                          [GOOGLE CLOUD AI STUDIO]  │
│               (PostgreSQL 15 + pgvector)                                      (Gemini 1.5 Flash API)    │
│               In: Port 5432 (Pooler PgBouncer)                                In: Port 443 (HTTPS)      │
│               In: Port 443 (Storage S3 API)                                                             │
│                                                                                                         │
│                         │ Out: Port 6379 (TLS / rediss://)                                   │          │
│                         ▼                                                                    ▼          │
│               [REDIS CLOUD / UPSTASH]                                         [SERVIDOR SMTP / CORREO]  │
│               (L2 Cache & Bull Queues)                                        (Gmail / SendGrid / Ethereal)
│               In: Port 6379                                                   In: Port 587 (SMTP STARTTLS)
└─────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

### 4.1 Zonas de Red y Niveles de Confianza (Trust Levels)
1. **Zona 1: LAN Escolar (192.168.1.0/24 - High Trust):**  
   Terminales de dirección, sala de profesores y dispositivos de inspectores conectados a la red Wi-Fi/cableada del colegio. Salen a Internet mediante el Router institucional con traducción de direcciones de red (NAT/PAT).
2. **Zona 2: Familias / Apoderados (Untrusted):**  
   Dispositivos móviles externos sobre redes celulares 4G/5G. Solo consumen vistas públicas tokenizadas de citaciones (tokens UUID temporales de 72 horas) sin acceso a la red interna ni a información de otros estudiantes.
3. **Zona 3: Internet WAN (Public Transit):**  
   Canal público cifrado donde todo el tráfico viaja estrictamente bajo el protocolo **TLS 1.3**.

### 4.2 Desglose Exhaustivo de Puertos y Protocolos

| Dispositivo / Servidor | Puerto | Protocolo / Transporte | Dirección del Tráfico | Propósito y Función de Seguridad |
| :--- | :---: | :--- | :---: | :--- |
| **Vercel Edge Network** | **443** | **HTTPS (TLS 1.3)** | **Entrada (Inbound)** | Sirve la Single Page Application (SPA) a los navegadores con certificados SSL gestionados automáticamente (Let's Encrypt). |
| **Vercel Edge Network** | **80** | **HTTP** | **Entrada (Inbound)** | Puerto estándar inseguro que **redirige automáticamente (301 Permanent Redirect)** al puerto 443 seguro. No sirve datos en texto plano. |
| **Render Cloud (Backend)** | **443 / $PORT** | **HTTPS / REST** | **Entrada (Inbound)** | Recibe las peticiones de la API REST desde el frontend (`/api/v1/...`). En el contenedor interno corre en una variable `$PORT` (ej. 5000), pero Render lo expone al exterior únicamente vía 443 HTTPS. |
| **Render Cloud (WebSockets)**| **3001 / 443** | **WSS (WebSocket Secure)**| **Entrada (Inbound)** | Canal bidireccional permanente vía Socket.io para despachar alertas críticas de patio y actualizaciones del semáforo en tiempo real. |
| **Supabase (PostgreSQL)** | **5432** | **PostgreSQL / TCP** | **Entrada (Inbound)** | Puerto nativo de la base de datos relacional. El backend de Render se conecta al pooler **PgBouncer** mediante canal seguro con forzado SSL (`sslmode=require`). |
| **Supabase (Storage)** | **443** | **HTTPS (TLS 1.3)** | **Entrada (Inbound)** | Subida y descarga de archivos de evidencia (certificados médicos, fotos de incidentes) mediante URLs firmadas temporales de Amazon S3. |
| **Google AI Studio** | **443** | **HTTPS (TLS 1.3)** | **Salida de Render (Outbound)**| Conexión REST hacia los endpoints de Google Gemini 1.5 Flash para enviar el payload sanitizado (DLP) y recibir el borrador del RICE. |
| **Redis Cloud (Cache/Colas)**| **6379** | **TCP / TLS (rediss://)** | **Salida de Render (Outbound)**| Puerto estándar de Redis. Aloja las colas de background (Bull) y el almacenamiento en caché volátil para no saturar PostgreSQL. |
| **Servidor SMTP (Nodemailer)**| **587** | **SMTP con STARTTLS** | **Salida de Render (Outbound)**| Despacho transaccional de correos electrónicos a apoderados y directivos. Se usa el puerto 587 (seguro con elevación TLS) en lugar del puerto 25 (bloqueado por spam). |

---

<a name="bloque-5"></a>
# Bloque 5: Diagrama de Componentes y Casos de Uso (UML)

### 5.1 Diagrama de Componentes: La Arquitectura Interna del Backend
El backend de SIGA Escolar sigue el patrón **Controller - Service - Repository (C-S-R)**:
* **Middlewares de Entrada (Filtro Perimetral):**
  * `authMiddleware`: Valida la firma del token JWT (RFC 7519) y extrae el `usuario_id`, `rol_id` y `tenant_id`.
  * `rbacMiddleware`: Verifica si el rol tiene permiso para ejecutar la acción (`DIRECTOR`, `CONVIVENCIA`, `DUPLA`, `DOCENTE`, `INSPECTOR`).
  * `validateSchema(zod)`: Sanitiza los datos de entrada antes de que toquen la lógica.
* **Controladores (Controllers):** Solo reciben la petición HTTP, llaman al servicio correspondiente y devuelven la respuesta HTTP estructurada (200, 201, 400, 403, 500).
* **Servicios (Services):** Contienen **100% de la regla de negocio** (ej.: cálculo del score de riesgo conductual, validación de plazos fatales, orquestación de etapas RICE).
* **Capa de Persistencia / Clientes:** `pg` pool para consultas SQL directas a PostgreSQL, cliente de Supabase y servicios externos (Google GenAI, Nodemailer, PDFKit).

### 5.2 Diagramas de Casos de Uso (Paquetes PKG-01 a PKG-10)
Los casos de uso están agrupados en 10 paquetes modulares según IEEE 830:
* **PKG-01:** Seguridad, Autenticación y Auditoría (Login, Renovación JWT, Bitácora).
* **PKG-02:** Gestión de Comunidad (Estudiantes, Cursos, Matrícula con validación Módulo 11 de RUT).
* **PKG-03:** Bitácora de Convivencia y Registro de Incidentes (Captura ágil móvil).
* **PKG-04:** Protocolos Normativos RICE y Redes de Derivación Externa (CESFAM, OPD, Tribunales).
* **PKG-05:** Inteligencia Artificial Generativa y Analítica Predictiva (DLP + RAG).
* **PKG-06:** Asistencia, Algoritmo de Promoción y Cierre Escolar.
* **PKG-07:** Configuración Institucional y Alertas de Plazos.
* **PKG-08:** Mediación Escolar y Acuerdos Restaurativos.
* **PKG-09:** Dinámicas Socioemocionales y Colaboración Externa.
* **PKG-10:** Citaciones Formativas y Alianza Familia-Escuela.

---

<a name="bloque-6"></a>
# Bloque 6: Persistencia y Seguridad: DER, Multi-tenancy con RLS y Auditoría

### 4.1 Modelo Entidad-Relación (DER) y Normalización
* Esquema relacional en **Tercera Forma Normal (3FN)** para evitar redundancias e inconsistencias transaccionales.
* Entidades pivote: `colegios` (tenants), `usuarios`, `roles`, `estudiantes`, `incidentes`, `protocolos_rice`, `etapas_protocolo`, `mediaciones`, `acuerdos_mediacion`, `citaciones` y `auditoria`.

### 4.2 Aislamiento Multi-Tenant con Row Level Security (RLS)
* **¿Qué es?:** En lugar de crear una base de datos por cada colegio (lo que sería carísimo e inviable), se utiliza una **base de datos compartida con discriminador lógico (`tenant_id`)**.
* **¿Cuál es el riesgo tradicional?:** Que un desarrollador olvide poner `WHERE tenant_id = 1` en una consulta backend y un colegio termine viendo los datos de otro.
* **La Solución Ingenieril de SIGA Escolar:** **Row Level Security (RLS) nativo en PostgreSQL**. La regla de seguridad se escribe en el motor SQL de la base de datos:
  ```sql
  CREATE POLICY aislamiento_colegio ON incidentes
  FOR ALL
  USING (tenant_id = current_setting('app.current_tenant_id')::uuid);
  ```
  *Incluso si el backend comete un error, el motor de la base de datos impide físicamente que se devuelvan registros de otra institución.*

### 4.3 Inmutabilidad de la Bitácora de Auditoría
* La tabla `auditoria` no permite modificaciones: tiene un trigger que aborta cualquier intento de `UPDATE` o `DELETE`.
* Todo cambio en el sistema genera un registro automático con: usuario, fecha/hora exacta, IP, tabla afectada, acción (INSERT/UPDATE/DELETE) y estado antes/después en formato JSONB.
* Cumple estrictamente con la **Ley N.° 21.719** sobre trazabilidad del tratamiento de datos personales.

---

<a name="bloque-7"></a>
# Bloque 7: Componentes Innovadores: Pipeline DLP (IA) y Hash Criptográfico

### 7.1 Pipeline DLP (Data Loss Prevention) para IA Ética
* **Problema:** Enviar el relato de un incidente escolar con nombres de niños, RUTs y diagnósticos médicos a una API externa (como OpenAI o Google Gemini) **viola flagrantemente la Ley N.° 21.719 y la Ley N.° 19.628**.
* **Solución Técnica:** Pipeline DLP interceptor en el backend:
  1. El texto original del relato ingresa al backend.
  2. El módulo DLP aplica expresiones regulares y filtros semánticos para detectar: nombres de alumnos, RUTs, direcciones y teléfonos.
  3. Reemplaza los datos sensibles por etiquetas sintéticas: `Juan Pérez` ➔ `[ESTUDIANTE_A]`, `12.345.678-9` ➔ `[RUT_ENMASCARADO]`.
  4. Envía a la API de **Google Gemini 1.5 Flash** únicamente el texto sanitizado junto con los artículos del RICE recuperados.
  5. Recibe el borrador generado, reinserta los datos localmente y lo presenta en un modal *Human-in-the-Loop* para que el profesional revise antes de guardar.

### 7.2 No Repudiación con Hash Criptográfico SHA-256
* Al cerrar una mediación o acuerdo formativo, el servidor genera un documento PDF oficial mediante PDFKit.
* El contenido de los acuerdos, los participantes y la marca temporal se procesan mediante una función hash unidireccional **SHA-256**.
* El valor hash hexadecimal resultante se imprime en el pie de página del documento y se almacena en la base de datos.
* **Utilidad legal:** Si un apoderado o funcionario altera una copia impresa del acta, al recalcular el hash sobre el documento original se demuestra de inmediato la adulteración, garantizando la **no repudiación jurídica** ante la Superintendencia de Educación o Tribunales de Familia.

---

<a name="bloque-8"></a>
# Bloque 8: Matriz de Relación entre Todos los Diagramas del Proyecto

Una de las preguntas más difíciles de la comisión es: *"¿Por qué tienen tantos diagramas? ¿Cómo se relacionan entre sí?"*. Esta tabla te da la respuesta matemática:

| Diagrama | Estándar / Notación | Vista Arquitectónica (Kruchten 4+1) | ¿Qué responde este diagrama? | ¿Con qué otro diagrama se conecta? |
| :--- | :---: | :---: | :--- | :--- |
| **BPMN 2.0** | BPMN (OMG) | **Vista de Procesos de Negocio** | ¿Cómo trabaja la gente en el colegio hoy (As-Is) y cómo trabajará con el sistema (To-Be)? | Sus actividades de usuario se convierten en los **Casos de Uso UML**. |
| **Casos de Uso** | UML 2.5 | **Vista de Casos de Uso (Escenarios)** | ¿Qué acciones concretas puede ejecutar cada usuario (Actor) frente a la pantalla? | Cada caso de uso es implementado por un **Componente de Software**. |
| **Componentes** | UML 2.5 | **Vista de Desarrollo (Lógica Interna)** | ¿Cómo está organizado el código internamente? (Controllers, Services, Repositories). | Consume las entidades del **Modelo DER** y se despliega en la **Infraestructura**. |
| **Modelo DER** | Entidad-Relación (Chen / Codd) | **Vista de Datos y Persistencia** | ¿Cómo se estructuran, relacionan y normalizan los datos en disco? | Da soporte a los repositorios del **Diagrama de Componentes**. |
| **Topología e Infraestructura** | Modelo C4 / Redes | **Vista Física y de Despliegue** | ¿En qué servidores corre cada software y por qué cables/puertos se comunican? | Hospeda físicamente a los **Componentes** y al **Modelo DER**. |

---

<a name="bloque-9"></a>
# Bloque 9: Glosario Técnico Exhaustivo (Terminología Clave)

Domina estos 15 términos para responder con la soltura de un arquitecto senior:

1. **Three-Tier (Tres Capas):** Patrón arquitectónico que segrega la aplicación en presentación (cliente), lógica de negocio (servidor) y almacenamiento de datos (base de datos), asegurando bajo acoplamiento y alta cohesión.
2. **Multi-Tenant (Multi-Inquilino):** Arquitectura donde una única instancia de software y base de datos atiende a múltiples clientes (colegios), garantizando que los datos de cada uno permanezcan estrictamente aislados mediante un identificador (`tenant_id`).
3. **RLS (Row Level Security):** Característica nativa del motor PostgreSQL que filtra las filas devueltas por una consulta SQL según políticas de seguridad predefinidas en la base de datos, impidiendo fugas de datos incluso ante omisiones en el backend.
4. **DLP (Data Loss Prevention):** Conjunto de técnicas y algoritmos diseñados para detectar y enmascarar información personal sensible (RUT, nombres, diagnósticos) antes de que salga del perímetro seguro hacia APIs externas.
5. **SHA-256 (Secure Hash Algorithm 256 bits):** Algoritmo criptográfico que transforma cualquier bloque de datos en una cadena fija de 64 caracteres hexadecimales. Es unidireccional y resistente a colisiones; cambiar un solo punto en un documento cambia completamente el hash.
6. **No Repudiación:** Principio de seguridad que garantiza que una entidad o usuario no pueda negar la autoría o validez de un documento o transacción generada en el sistema.
7. **PWA (Progressive Web Application):** Aplicación web que utiliza Service Workers y almacenamiento local (IndexedDB) para ofrecer una experiencia similar a una app nativa, funcionando incluso sin conexión a Internet (offline en patio escolar).
8. **Edge CDN (Content Delivery Network):** Red de servidores distribuidos geográficamente (Vercel) que almacena en caché el frontend cerca del usuario físico, reduciendo el tiempo de carga a milisegundos.
9. **PaaS (Platform as a Service):** Modelo de nube donde el proveedor gestiona el hardware, el sistema operativo y el escalamiento (Render, Vercel), permitiendo que los desarrolladores se enfoquen únicamente en el código de la aplicación.
10. **BaaS (Backend as a Service):** Servicio en la nube (Supabase) que provee una base de datos gestionada, autenticación y almacenamiento de archivos sin necesidad de administrar un servidor de base de datos dedicado.
11. **ACID (Atomicidad, Consistencia, Aislamiento, Durabilidad):** Conjunto de propiedades que garantizan que las transacciones en una base de datos relacional (PostgreSQL) se procesen de manera confiable, vital para procesos disciplinarios y legales.
12. **3FN (Tercera Forma Normal):** Nivel de normalización de bases de datos relacionales que elimina la redundancia de datos y garantiza que las columnas no clave dependan exclusivamente de la clave primaria.
13. **RBAC (Role-Based Access Control):** Método para restringir el acceso al sistema basándose en los roles asignados a los funcionarios (Director, Convivencia, Dupla, Docente, Inspector).
14. **pgvector:** Extensión de PostgreSQL que permite almacenar vectores numéricos multidimensionales (*embeddings*) y ejecutar búsquedas de similitud por coseno, permitiendo que la IA encuentre artículos del RICE en lenguaje natural.
15. **Human-in-the-Loop:** Principio de diseño de IA que exige que toda sugerencia o borrador generado por un modelo de lenguaje deba ser obligatoriamente revisado, editado y visado por un ser humano responsable antes de adquirir validez oficial.

---

<a name="bloque-10"></a>
# Bloque 10: Banco de Preguntas Trampa y Respuestas Modelo

### Pregunta 1: *"¿Por qué eligieron PostgreSQL en vez de MongoDB si MongoDB maneja documentos JSON de forma más natural?"*
* **Respuesta Modelo:**  
  *"Elegimos PostgreSQL porque los procesos de convivencia escolar son de carácter jurídico y procedimental; requieren garantías ACID estrictas para evitar inconsistencias en el seguimiento de protocolos normativos. Además, PostgreSQL soporta de forma nativa tipos semiestructurados `JSONB` para configuraciones dinámicas, cuenta con la extensión `pgvector` para las búsquedas semánticas del asistente de normativa sin requerir otra base de datos, y lo más crítico: ofrece Row Level Security (RLS) declarativo para blindar el aislamiento multi-tenant por colegio a nivel de motor SQL, algo que en bases documentales como MongoDB recaería completamente en la aplicación."*

### Pregunta 2: *"Ustedes dicen que operan a costo $0 CLP en PaaS. ¿Qué pasa si la Escuela El Salvador se queda sin servicio porque se acabaron las horas de Render o Supabase?"*
* **Respuesta Modelo:**  
  *"Para la escala de la Escuela El Salvador (483 estudiantes y ~30 incidentes semestrales), el volumen de transacciones utiliza menos del 15% de las cuotas gratuitas mensuales de Render (750 horas de cómputo) y Supabase (500 MB de base de datos relacional). No obstante, la arquitectura está completamente desacoplada mediante variables de entorno estándar. Si el colegio requiere acuerdos de nivel de servicio (SLA) con uptime garantizado del 99,9%, la migración a un plan Pro de Supabase ($25 USD) y Render ($7 USD) cuesta solo ~$32.000 CLP mensuales, lo cual es financiable íntegramente a través de la Subvención Escolar Preferencial (SEP)."*

### Pregunta 3: *"¿Cuál es la diferencia entre su diagrama BPMN y sus diagramas de Casos de Uso? Parecen lo mismo."*
* **Respuesta Modelo:**  
  *"Cumplen propósitos de ingeniería totalmente distintos. El diagrama BPMN modela los **procesos de negocio de la organización**; representa el flujo de trabajo humano, los roles institucionales (inspectores, duplas, apoderados) y la secuencia operativa con o sin sistema, evidenciando cuellos de botella As-Is y la optimización To-Be. Por su parte, los diagramas de Casos de Uso (UML) modelan los **límites funcionales del software**; detallan específicamente qué acciones puede ejecutar un usuario autenticado frente a la aplicación web y qué casos de uso incluye o extiende el sistema."*

### Pregunta 4: *"En su diagrama de infraestructura veo que Render se conecta a Supabase por el puerto 5432 y a Redis por el 6379. ¿Por qué esos puertos no están expuestos al usuario final?"*
* **Respuesta Modelo:**  
  *"Porque aplicamos el principio de defensa en profundidad y menor exposición de superficie de ataque. Los usuarios finales (inspectores y apoderados) solo se conectan a través del puerto 443 HTTPS a la CDN de Vercel y al API Gateway de Render. La comunicación hacia PostgreSQL (puerto 5432) y Redis (puerto 6379) ocurre exclusivamente desde el backend en Render a través de conexiones privadas cifradas mediante TLS y protegidas por cadenas de conexión con autenticación robusta. Ningún cliente web tiene visibilidad ni acceso de red directo a las capas de persistencia."*

---

<a name="plan-4-dias"></a>
# 📅 Plan de Estudio para los 4 Días Previos a la Presentación

* **Día 1 (Hoy): Macro-Arquitectura, Infraestructura, Puertos y Redes.**
  * Aprender los puertos de memoria: 443 (HTTPS), 5432 (PostgreSQL), 6379 (Redis), 587 (SMTP), 3001 (WebSockets).
  * Dominar por qué se usan tres capas desacopladas (Vercel, Render, Supabase).
* **Día 2: Trazabilidad BPMN ➔ Casos de Uso ➔ Componentes ➔ DER.**
  * Memorizar la tabla del Bloque 3: qué componente atiende cada tarea del BPMN.
  * Entender la diferencia exacta entre BPMN (proceso de negocio) y Casos de Uso (software).
* **Día 3: Persistencia, RLS, Auditoría Inmutable y DLP.**
  * Repasar el concepto de Row Level Security (RLS) en PostgreSQL.
  * Explicar el flujo del pipeline DLP y el hash SHA-256 en las actas de mediación.
* **Día 4: Ensayo General y Preguntas Bajo Presión.**
  * Simulacro oral de presentación (explicación de cada lámina en máximo 2 minutos).
  * Ronda de preguntas difíciles de la comisión sin mirar apuntes.
