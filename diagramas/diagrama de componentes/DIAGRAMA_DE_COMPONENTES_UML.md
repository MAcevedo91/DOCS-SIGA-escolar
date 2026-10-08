# ESPECIFICACIÓN FORMAL DEL DIAGRAMA DE COMPONENTES UML 2.5
## Sistema de Gestión y Acompañamiento Escolar (SIGA Escolar)
**Cliente Institucional:** Escuela Coeducacional N° 1 El Salvador, Atacama, Chile  
**Entidad Académica:** Universidad Tecnológica de Chile INACAP (Proyecto de Título)  
**Referencia Técnica:** *UML Distilled (3rd Edition / Martin Fowler)*, Modelo 4+1 Vistas de Kruchten (Vista de Desarrollo), IEEE 1471 / ISO/IEC 42010  
**Versión:** 1.0 (PlantUML / Alta Definición Técnica)  
**Fecha:** Octubre 2026  

---

## 1. INTRODUCCIÓN Y CONVENCIONES DE MODELADO

El **Diagrama de Componentes UML 2.5** corresponde a la **Vista de Desarrollo (*Development View*)** dentro del modelo arquitectónico 4+1 de Philippe Kruchten. Modela la estructura modular del software, sus límites, interfaces proporcionadas (*provided interfaces* / piruleta `()`), interfaces requeridas (*required interfaces* / zócalo `)(`) y las dependencias de ejecución entre subsistemas.

### Elementos representados:
* **Capas Arquitectónicas:**
  1. **Capa de Presentación (Frontend SPA - React / Vite / PWA)**
  2. **Capa de Control y Seguridad (API Gateway & Middlewares - Express 5)**
  3. **Capa de Lógica de Negocio y Dominio (Domain Services)**
  4. **Subsistema de Inteligencia Artificial y Privacidad (DLP + Gemini Flash)**
  5. **Capa de Persistencia y Datos (Supabase / PostgreSQL con RLS)**
  6. **Servicios y Plataformas Externas (Google AI Studio, SMTP)**

---

## 2. DIAGRAMA DE COMPONENTES GLOBAL (PLANTUML)

```plantuml
@startuml
skinparam componentStyle uml2
skinparam packageStyle rectangle
skinparam shadowing false
skinparam monochrome true

' ==========================================================
' CAPA DE PRESENTACIÓN (FRONTEND CLIENT)
' ==========================================================
package "Capa de Presentación (Frontend SPA / PWA)" as FrontendPkg {
  [Vistas y Enrutador\n(React Router DOM)] as RouterUI
  [Gestor de Estado Global\n(Zustand Stores)] as StateStore
  [Cliente HTTP Interceptor\n(Axios / Bearer JWT)] as HttpClient
  [Motor Offline y Caché\n(Service Worker & IndexedDB)] as PWAEngine
  
  RouterUI ..> StateStore : consume estado
  StateStore ..> HttpClient : despacha acciones
  RouterUI ..> PWAEngine : fallback de red
}

' ==========================================================
' CAPA DE ENTRADA, SEGURIDAD Y CONTROL (BACKEND API GATEWAY)
' ==========================================================
package "Capa de Control y Transporte (Express 5 REST API)" as GatewayPkg {
  interface "HTTP / REST API (TLS 1.3)" as HttpInterface
  
  [Filtros de Seguridad HTTP\n(Helmet / CORS / RateLimiter)] as SecFilter
  [Middleware de Autenticación y RBAC\n(JWT Verify & requireRole)] as AuthRBAC
  [Middleware de Auditoría Inmutable\n(AuditLogger / setImmediate)] as AuditMW
  [Controladores de Dominio\n(Express Route Handlers)] as Controllers
  
  HttpInterface - [SecFilter]
  SecFilter ..> [AuthRBAC]
  AuthRBAC ..> [Controllers] : request autorizado
  Controllers ..> [AuditMW] : fire-and-forget
}

HttpClient ..> HttpInterface : llamadas JSON

' ==========================================================
' CAPA DE SERVICIOS DE DOMINIO Y REGLAS DE NEGOCIO
' ==========================================================
package "Capa de Dominio y Lógica de Negocio" as DomainPkg {
  [Servicio de Convivencia e Incidentes\n(incidentesService)] as IncidentesSvc
  [Servicio de Protocolos RICE\n(protocolosService & derivacionesService)] as ProtocolosSvc
  [Servicio de Comunidad y Alumnos\n(estudiantesService - Módulo 11)] as EstudiantesSvc
  [Servicio de Ciclo y Promoción\n(cierreAnioService & asistenciaService)] as CierreSvc
  [Servicio de Analítica y Métricas\n(analyticsService & riesgoService)] as AnalyticsSvc
  [Generador de Documentos Oficiales\n(pdfService / PDFKit)] as PdfSvc
  [Servicio de Notificaciones y Alertas\n(notificacionesService & alertasService)] as AlertSvc
  
  Controllers ..> IncidentesSvc
  Controllers ..> ProtocolosSvc
  Controllers ..> EstudiantesSvc
  Controllers ..> CierreSvc
  Controllers ..> AnalyticsSvc
  Controllers ..> AlertSvc
  
  IncidentesSvc ..> AlertSvc : dispara alerta grave
  IncidentesSvc ..> PdfSvc : emite acta preliminar
  ProtocolosSvc ..> PdfSvc : compila oficio derivación
  CierreSvc ..> PdfSvc : emite informe promoción
}

' ==========================================================
' SUBSISTEMA DE INTELIGENCIA ARTIFICIAL Y PRIVACIDAD
' ==========================================================
package "Subsistema de IA y Privacidad (Sprint 6 & 7)" as AIPkg {
  [Pipeline de Sanitización DLP\n(dlpSanitizer - Ley 19.628)] as DlpSvc
  [Cliente Gemini Flash & Circuit Breaker\n(geminiService / @google/genai)] as GeminiClient
  
  IncidentesSvc ..> DlpSvc : anonimiza PII
  AnalyticsSvc ..> DlpSvc : anonimiza historial
  DlpSvc ..> GeminiClient : payload ofuscado
}

' ==========================================================
' CAPA DE PERSISTENCIA Y ALMACENAMIENTO (SUPABASE)
' ==========================================================
package "Capa de Persistencia y Datos (PostgreSQL 15)" as PersistencePkg {
  interface "Supabase JS Client" as DbInterface
  [Motor Relacional PostgreSQL\n(Row Level Security / tenant_id)] as PostgresDB
  [Almacén de Objetos\n(Supabase Storage Buckets)] as ObjectStorage
  [Tabla de Auditoría Inmutable\n(audit_log JSONB)] as AuditTable
  
  DbInterface - [PostgresDB]
}

DomainPkg ..> DbInterface : operaciones CRUD
AuditMW ..> AuditTable : inserta log asíncrono
PdfSvc ..> ObjectStorage : almacena PDF oficial
IncidentesSvc ..> ObjectStorage : sube evidencias

' ==========================================================
' SERVICIOS EXTERNOS (THIRD-PARTY APIS)
' ==========================================================
package "Servicios Externos en la Nube" as CloudPkg {
  [Google Gemini API\n(generativelanguage.googleapis.com)] as GeminiAPI
  [Servidor de Correo SMTP\n(Notificaciones a Directivos)] as SmtpServer
}

GeminiClient ..> GeminiAPI : HTTPS / Generative AI
AlertSvc ..> SmtpServer : email alertas críticas
@enduml
```

---

## 3. CATÁLOGO DETALLADO DE COMPONENTES POR SUBSISTEMA

### 3.1 Subsistema Frontend (Cliente Web SPA / PWA)
* **`Vistas y Enrutador (React Router DOM)`**: Gestiona la navegación declarativa y la protección de rutas basada en el rol del usuario autenticado (`<ProtectedRoute />`).
* **`Gestor de Estado Global (Zustand Stores)`**: Centraliza el estado de sesión (`authStore`), la cola de incidentes pendientes de red (`offlineStore`) y el contador reactivo de avisos (`notificacionesStore`).
* **`Cliente HTTP Interceptor (Axios)`**: Inyecta automáticamente la cabecera `Authorization: Bearer <token>` en cada request saliente y gestiona la captura centralizada de errores HTTP 401 (desconexión) y 403 (acceso denegado).
* **`Motor Offline y Caché (Service Worker & IndexedDB)`**: Permite a los inspectores reportar incidentes en zonas sin cobertura de patio mediante almacenamiento local en IndexedDB y sincronización diferida automática.

### 3.2 Subsistema de Entrada y Control (API Gateway - Express 5)
* **`Filtros de Seguridad HTTP`**: 
  - `Helmet`: Establece cabeceras de seguridad estrictas (HSTS, CSP, X-Frame-Options).
  - `CORS`: Restringe el acceso únicamente a los dominios autorizados de la escuela.
  - `RateLimiter`: Previene ataques de fuerza bruta limitando peticiones por IP.
* **`Middleware de Autenticación y RBAC`**: Desencripta el token JWT firmado, extrae `user_id`, `rol` y `tenant_id`, y bloquea el acceso si el rol del usuario no cuenta con los privilegios requeridos.
* **`Middleware de Auditoría Inmutable`**: Captura las operaciones de escritura (POST, PUT, PATCH, DELETE) y las deriva en segundo plano mediante `setImmediate()` a la bitácora de auditoría sin penalizar la latencia de respuesta al usuario.

### 3.3 Subsistema de Servicios de Dominio
* **`incidentesService`**: Lógica de tipificación de faltas (Leves, Graves, Gravísimas), asignación de roles a involucrados (Víctima, Agresor, Testigo) y cálculo de reincidencia inmediata.
* **`protocolosService & derivacionesService`**: Máquina de estados para los 10 protocolos normativos RICE, control de checklists secuenciales y cómputo de plazos fatales en días hábiles de la Superintendencia de Educación.
* **`estudiantesService`**: Módulo de ingesta masiva streaming (CSV/Excel) con validación estricta de RUT chileno mediante algoritmo Módulo 11.
* **`cierreAnioService & asistenciaService`**: Algoritmo de cómputo de porcentaje de asistencia según estándar MINEDUC ($\ge 85\%$) y motor de promoción y pase de nivel anual.
* **`pdfService`**: Compilador vectorial de documentos oficiales con membrete institucional, código de verificación hash y bloques de firmas para Coordinación y Dirección.

### 3.4 Subsistema de Inteligencia Artificial y Privacidad (DLP)
* **`dlpSanitizer`**: Componente de *Privacy by Design* obligatorio bajo la Ley N° 19.628. Elimina RUTs, direcciones y teléfonos, y sustituye nombres por marcadores sintácticos (`[Estudiante 1 - Víctima]`) antes de enviar cualquier dato al modelo fundacional.
* **`geminiService & Circuit Breaker`**: Cliente oficial de Google Gemini Flash. Implementa un patrón *Circuit Breaker* que, ante saturación de cuota (HTTP 429) o fallas de conectividad, conmuta inmediatamente a plantillas predefinidas locales sin bloquear al usuario.

### 3.5 Persistencia y Servicios Externos
* **`PostgreSQL 15 (Supabase con RLS)`**: Base de datos relacional multi-tenant donde cada tabla está protegida por políticas de *Row Level Security* vinculadas a `tenant_id`, impidiendo fugas de datos entre distintos colegios.
* **`Google Gemini API`**: Servicio de cómputo cognitivo en la nube para generación estructurada de actas e inferencia de riesgo conductual predictivo.

---

## 4. GUÍA PARA EL MODELADOR VISUAL (COMPAÑERO DE EQUIPO)

Para plasmar este diagrama en **Draw.io**:
1. Abrir Draw.io y seleccionar **`+` (Insertar) $\rightarrow$ `Avanzado` $\rightarrow$ `PlantUML`**.
2. Copiar y pegar el bloque `@startuml ... @enduml` de la **Sección 2**.
3. Presionar **Insertar**.
4. Draw.io generará automáticamente las cajas de componentes UML con sus puertos e interfaces de conexión en un lienzo vectorial completamente editable.
