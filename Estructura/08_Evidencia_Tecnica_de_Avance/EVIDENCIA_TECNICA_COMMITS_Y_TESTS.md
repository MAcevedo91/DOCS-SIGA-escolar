# SECCIÓN 8: EVIDENCIA TÉCNICA DE AVANCE
## Repositorios, Commits, Base de Datos, Pantallas y Suites de Pruebas

---

### 1. Repositorios de Código y Control de Versiones (Git)
El proyecto está estructurado de forma desacoplada en tres repositorios:
* **`siga-backend`:** API REST en Node.js 22 + Express 5, Supabase JS, JWT, Zod, PDFKit, Nodemailer y SDK oficial `@google/genai`.
* **`siga-frontend`:** SPA en React 18, Vite 5, Tailwind CSS, Zustand, Recharts y Lucide Icons.
* **`DOCS`:** Repositorio central de documentación, requerimientos, minutas, actas y formulación académica.

---

### 2. Base de Datos en Supabase (PostgreSQL 15 Multi-Tenant)
* **Archivo DDL Maestro:** `schema_siga_escolar.sql` (en esta misma carpeta).
* **Seguridad Nativa RLS:** Todas las tablas cuentan con `ENABLE ROW LEVEL SECURITY` y la directiva `USING (tenant_id = current_setting('app.tenant_id')::uuid)`.
* **Última Migración (Sprint 6):** Tabla `reportes_incidentes` con 16 columnas tipadas, triggers de versionado inmutable y validación de estudiante involucrado.

---

### 3. Evidencias de Pruebas Automatizadas (Jest y Vitest)
* **Suite Global de Backend:** **188 de 188 pruebas unitarias y de integración aprobadas al 100%** en 23 suites de pruebas, con 0 regresiones.
* **Suite Específica Sprint 6 (Marcelo Acevedo):** **41 de 41 pruebas aprobadas al 100%**:
  * `reportesService.test.js`: 12 pruebas.
  * `reportesController.test.js`: 16 pruebas.
  * `geminiDlp.test.js`: 8 pruebas (DLP y sanitización de PII).
  * `pdfService.test.js`: 2 pruebas (renderizado PDFKit).
  * `emailServiceReporte.test.js`: 3 pruebas (Nodemailer y adjunto PDF).

---

### 4. Pruebas Reales Ejecutadas en Terreno
* **Prueba DLP en Vivo:** `scripts/verificar-dlp-gemini.js` demostró la censura del 100% de RUTs, teléfonos y nombres antes de enviar los datos a Google AI Studio.
* **Prueba PDF Oficial:** Generación en disco de `reporte-oficial-prueba.pdf` con membrete formal, folio `INF-2026-XXXX` y firmas institucionales.
* **Prueba de Correo:** Generación de `correo-apoderado-vista-previa.html` y despacho con adjunto en base64 para apoderados titulares.
