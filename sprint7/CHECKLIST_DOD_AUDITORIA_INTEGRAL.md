# Protocolo de Auditoría y Checklist DoD (Definition of Done) Integral
**Proyecto:** SIGA Escolar  
**Establecimiento:** Escuela Coeducacional N° 1 El Salvador  
**Auditora Responsable:** Claudia Infante Soto  
**Líder Técnico:** Marcelo Acevedo Silva  
**Frontend QA:** Daniel Flores Jaime  
**Versión:** 1.0 (Auditoría Integral Sprints 1 al 7)  

---

## 1. OBJETIVO DEL PROTOCOLO DoD
Este documento constituye el instrumento oficial de aseguramiento de calidad y completitud técnica que **Claudia Infante** debe auditar y certificar sobre cada módulo de SIGA Escolar antes de someter la plataforma a las pruebas finales de aceptación con el cliente (UAT).

---

## 2. CRITERIOS TRANSVERSALES DE CALIDAD (Nivel de Sistema)

| Criterio | Estándar Exigido | Verificación Técnica | Estado |
| :--- | :--- | :--- | :---: |
| **Higiene de Código** | 0 errores en consola DevTools y 0 warnings críticos | Inspección con Chrome DevTools en modo producción | [ ] |
| **Tiempo de Carga (RNF-07)** | Todas las páginas cargan en menos de 3.0 segundos | Métricas Network en navegador y Lighthouse | [ ] |
| **Seguridad Multi-Tenant** | Todas las consultas y vistas filtran estrictamente por `tenant_id` | Revisión de tokens JWT y respuesta ante IDs cruzados | [ ] |
| **Diseño Responsivo (RNF-08)** | Usabilidad perfecta desde 360px (Mobile) hasta 1920px (Desktop) | Pruebas en viewport móvil, tablet y monitor de escritorio | [ ] |
| **Modo Oscuro / Accesibilidad** | Contraste de texto accesible (WCAG AA) en modo claro y oscuro | Navegación completa con toggle de tema activado | [ ] |
| **Persistencia de Sesión** | Sesión estable sin parpadeos ni deslogueos al recargar página | Recarga de página con F5 en todas las rutas privadas | [ ] |

---

## 3. CHECKLIST DoD MÓDULO POR MÓDULO

### Módulo 1: Autenticación, Usuarios y RBAC (Sprint 1)
- [ ] **Login seguro:** Autenticación por correo y contraseña con bloqueo preventivo tras 5 intentos fallidos (RF-01).
- [ ] **Control de roles (RBAC):** Restricciones verificadas para los 5 roles (`Administrador`, `Directivo`, `Inspector`, `Docente`, `Equipo de Formación`).
- [ ] **Gestión de fotos de perfil (Avatares):** Carga, reemplazo y eliminación de fotografía con previsualización circular y fallback a iniciales institucionales.
- [ ] **Protección de último admin:** El sistema impide desactivar o eliminar al único administrador activo del establecimiento (RF-04).

### Módulo 2: Estudiantes, Cursos e Importador CSV (Sprint 2)
- [ ] **Validación de RUT chileno:** Algoritmo de Módulo 11 operando en creación individual e importador masivo.
- [ ] **Importador CSV en lote:** Procesamiento de hasta 500 registros con feedback fila a fila de errores de formato.
- [ ] **Ficha integral del estudiante:** Historial cronológico con incidentes, medidas formativas, entrevistas y alertas.
- [ ] **Distintivo PIE:** Identificación visual clara de estudiantes pertenecientes al Programa de Integración Escolar.

### Módulo 3: Convivencia Escolar e Incidentes (Sprint 3)
- [ ] **Registro de incidentes (RF-06):** Registro de los 7 abordajes normativos, niveles de gravedad (*Leve*, *Grave*, *Gravísima*) y relato estructurado.
- [ ] **Relación N:M de estudiantes:** Capacidad de asociar múltiples estudiantes a un solo incidente distinguiendo víctima, agresor y testigo.
- [ ] **Entrevistas a apoderados y funcionarios:** Registro de acuerdos formativos con fecha y firma de compromiso.
- [ ] **Búsqueda Full-Text (PostgreSQL tsvector):** Búsqueda instantánea de incidentes por palabras clave del relato.

### Módulo 4: Protocolos Normativos RICE (Sprint 4)
- [ ] **10 Protocolos de la Superintendencia (RF-08):** Catálogo normativo completo digitalizado (maltrato, ciberacoso, drogas, agresiones, etc.).
- [ ] **Trazabilidad de estados (RF-09):** Flujo normativo de 4 etapas (*En Investigación*, *Derivado*, *Cerrado*) con observaciones obligatorias.
- [ ] **Semáforo de plazos fatales:** Alertas visuales para plazos legales críticos (48 hrs para denuncias obligatorias).

### Módulo 5: Dashboard y Analítica Avanzada (Sprint 5 y Sprint 7)
- [ ] **Panel de resumen en tiempo real:** Contadores de incidentes del mes, casos graves y protocolos activos.
- [ ] **Mapa de Calor por Cursos (Sprint 7):**
  - Matriz interactiva de Cursos (Pre-Kínder a 8° Básico) vs Meses (Marzo a Diciembre).
  - Semáforos diferenciados: Verde (0-1), Amarillo (2-4), Rojo ($\ge 5$ o casos críticos).
  - Modal drill-down funcional con diagnóstico pedagógico anónimo sin estigmatizar alumnos.
  - Filtros operativos por Año (2026/2025) y Ciclo (Parvularia, 1° Ciclo, 2° Ciclo).

### Módulo 6: Asistente IA, Reportes PDF y Notificaciones (Sprint 6)
- [ ] **Asistencia IA (Gemini Flash):** Redacción human-in-the-loop de informes pedagógicos basada en antecedentes objetivos del incidente.
- [ ] **Privacidad y DLP Escolar:** Anonimización de datos sensibles antes del procesamiento por IA.
- [ ] **Generación de PDF oficial (RF-11):** Descarga de reporte con membrete de la Escuela El Salvador, estructura formal y firmas institucionales.
- [ ] **Notificación por correo al apoderado:** Envío seguro de informe en PDF al apoderado titular vía plantilla HTML institucional.

---

## 4. DICTAMEN DE CERTIFICACIÓN DoD

* **Fecha de Auditoría:** `____ / ____ / 2026`
* **Resultado Global:** `[ ] APROBADO 100% PARA UAT` | `[ ] RECHAZADO CON OBSERVACIONES`
* **Firma Auditora (Documentación & QA):** Claudia Infante Soto
* **Firma Líder de Proyecto:** Marcelo Acevedo Silva
