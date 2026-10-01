# SECCIÓN 9: RIESGOS Y PROBLEMAS ENCONTRADOS
## Dificultades Críticas Diagnosticadas y Medidas de Mitigación Implementadas

---

| Riesgo / Dificultad Detectada | Impacto | Causa Raíz | Acción de Mitigación Aplicada en SIGA Escolar | Estado |
| :--- | :---: | :--- | :--- | :---: |
| **1. Vulneración de Datos de Menores con IA** | **Crítico** | La **Ley N° 21.719** y la **Ley N° 19.628** prohíben enviar datos personales sensibles de estudiantes a APIs de terceros. | Construcción de un pipeline de **DLP (Data Loss Prevention)** que sanitiza el 100% de nombres, RUTs y teléfonos antes de invocar a Google Gemini Flash, desanonimizando localmente en memoria solo al alumno foco. | ✅ Resuelto y Certificado (Sprint 6) |
| **2. Fuga o Contaminación de Datos Multi-Tenant** | **Crítico** | Operar múltiples colegios o dependencias en una sola base de datos PostgreSQL. | Implementación estricta de **Row Level Security (RLS)** en Supabase. Si una consulta no incluye el `tenant_id` validado por el token JWT, el motor retorna exactamente 0 filas. | ✅ Resuelto y Testeado |
| **3. Resistencia al Cambio de Inspectores de Patio** | **Alto** | Fatiga administrativa; renuencia a andar con notebooks en los recreos. | Rediseño completo **Mobile-First** con selectores en cascada (*Área ➔ Protocolo ➔ Falta*) que permiten registrar un hecho en menos de 2 minutos desde smartphones. | ✅ Resuelto y Validado |
| **4. Indisponibilidad o Latencia de Servicios Externos** | **Medio** | Posibles caídas de la API de Google Gemini o servidores SMTP de correo. | Implementación de **Circuit Breaker y Fallback Inteligente** en el backend. Si la API de IA no responde, el sistema genera la plantilla normativa base sin lanzar HTTP 500. | ✅ Resuelto y Testeado |
| **5. Adopción Docente y Brecha Digital en Terreno** | **Alto** | Inseguridad en el uso de la plataforma por parte de profesores tradicionales. | Elaboración de un **Manual de Usuario Didáctico paso a paso** (`MANUAL_DE_USUARIO.md`) y programación de jornadas de capacitación práctica antes del Go-Live definitivo. | 🟡 En Mitigación Activa |
