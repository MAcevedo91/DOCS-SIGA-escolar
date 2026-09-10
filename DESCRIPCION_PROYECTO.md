# SIGA Escolar — Sistema de Gestión y Acompañamiento Escolar

## ¿En qué consiste?

SIGA Escolar es una plataforma web de gestión de convivencia escolar desarrollada para la **Escuela Coeducacional N°1 de El Salvador, Atacama**. El sistema nace de la necesidad de digitalizar y centralizar los procesos de convivencia que hasta ahora se gestionaban de forma manual en papel, con los riesgos de pérdida de información, falta de trazabilidad y dificultad para cumplir con las exigencias normativas de la Superintendencia de Educación de Chile.

El sistema permite a directivos, coordinadores, inspectores y docentes gestionar de forma ágil y segura todos los aspectos de la convivencia escolar: desde el registro de incidentes hasta la apertura y seguimiento de protocolos normativos RICE, pasando por la visualización de estadísticas en tiempo real y la generación de reportes institucionales en formato PDF.

---

## Funcionalidades principales

**Autenticación y control de acceso**
El sistema implementa autenticación segura con JWT y bcrypt, con bloqueo automático de cuenta tras 5 intentos fallidos. El acceso está controlado por roles (RBAC) con 5 niveles: Administrador, Equipo de Formación, Directivo, Inspector y Docente, cada uno con permisos específicos definidos por una matriz de acceso.

**Gestión de estudiantes**
Permite importar la nómina completa del establecimiento desde archivos CSV o Excel, con validación automática del RUT chileno y creación del apoderado titular en el mismo proceso. Cada estudiante cuenta con un perfil unificado que centraliza sus datos personales, curso, apoderado e historial cronológico de incidentes.

**Registro de incidentes de convivencia**
Formulario estructurado para registrar incidentes con campos obligatorios: fecha, tipo de abordaje, gravedad (Leve, Grave, Gravísima), relato, medidas adoptadas y estudiantes involucrados con su rol (víctima, agresor o testigo). Los incidentes graves o gravísimos generan notificaciones automáticas al coordinador y administrador del establecimiento.

**Protocolos normativos RICE**
Flujos digitales para los 10 protocolos normativos exigidos por la Superintendencia de Educación, con trazabilidad completa de estados (En Investigación → Derivado → Cerrado) y registro de observaciones en cada etapa. El sistema valida que el estudiante involucrado en el protocolo haya participado efectivamente en el incidente origen.

**Dashboard analítico**
Panel de control con indicadores clave en tiempo real: total de incidentes, incidentes graves, protocolos activos y estudiantes en seguimiento. Incluye tres gráficos dinámicos: frecuencia de incidentes por curso, distribución por gravedad y tendencia mensual.

**Exportación de reportes PDF**
Generación automática del historial conductual de un estudiante en formato PDF con membrete institucional, datos personales, listado cronológico de incidentes y espacios para firmas del Coordinador de Convivencia y el Director del establecimiento.

**Bitácora de auditoría**
Registro automático e invisible de todos los eventos CRUD del sistema, cumpliendo el requerimiento RF-03. Cada operación queda registrada con usuario, tenant, acción, tabla afectada, timestamp e IP de origen.

---

## Tecnologías utilizadas

El proyecto fue desarrollado íntegramente con tecnologías de código abierto, garantizando costo cero de licenciamiento.

### Backend

| Tecnología | Versión | Rol |
|-----------|---------|-----|
| Node.js | 22 | Runtime del servidor |
| Express | 5 | Framework HTTP |
| Supabase JS | 2 | Cliente de base de datos |
| JWT (jsonwebtoken) | 9 | Autenticación sin estado |
| bcrypt | 6 | Cifrado de contraseñas |
| Zod | 4 | Validación de esquemas de datos |
| multer | 2 | Carga de archivos CSV/Excel |
| csv-parse | 7 | Parseo de archivos CSV |
| xlsx | 0.18 | Parseo de archivos Excel |
| pdfkit | 0.19 | Generación de PDFs |
| Helmet | 8 | Headers de seguridad HTTP |
| CORS | 2 | Control de orígenes permitidos |
| dotenv | 17 | Gestión de variables de entorno |
| nodemon | 3 | Recarga automática en desarrollo |

### Frontend

| Tecnología | Versión | Rol |
|-----------|---------|-----|
| React | 18 | Librería de interfaz de usuario |
| Vite | 5 | Bundler y servidor de desarrollo |
| Tailwind CSS | 3 | Framework de estilos utilitarios |
| react-router-dom | 6 | Enrutamiento del lado del cliente |
| Zustand | 4 | Estado global de la aplicación |
| Axios | 1 | Cliente HTTP con interceptores |
| react-hook-form | 7 | Gestión de formularios |
| lucide-react | 0.383 | Íconos SVG |
| recharts | 2 | Gráficos estadísticos |

### Base de datos e infraestructura

| Servicio | Tecnología | Descripción |
|---------|-----------|-------------|
| Base de datos | PostgreSQL 15 (Supabase) | BD relacional multi-tenant con RLS |
| Deploy Backend | Render | Plataforma PaaS, deploy automático desde GitHub |
| Deploy Frontend | Vercel | Hosting estático optimizado para React/Vite |
| Repositorios | GitHub | Control de versiones con ramas main/develop |

### Decisiones de arquitectura destacadas

**Arquitectura multi-tenant** — La columna `tenant_id` en todas las tablas combinada con las políticas RLS (Row Level Security) de PostgreSQL garantiza el aislamiento total de datos entre establecimientos, permitiendo escalar el sistema a múltiples colegios sin riesgo de contaminación de datos.

**Autenticación stateless con JWT** — Los tokens JWT contienen el `user_id`, `tenant_id` y `rol` del usuario, lo que permite validar la identidad y los permisos en cada request sin consultar la base de datos, mejorando el rendimiento.

**Auditoría fire-and-forget** — El middleware de auditoría utiliza `setImmediate()` para registrar los eventos de forma asíncrona sin agregar latencia a las respuestas de la API.

**Validación RUT chileno** — El sistema implementa el algoritmo del módulo 11 para validar y normalizar los RUTs durante la importación masiva, rechazando solo los inválidos sin detener el proceso completo.
