import os
import re
import zipfile
import xml.etree.ElementTree as ET

base_docx = 'DOCS/Estructura/02_Evidencia_de_Reuniones_con_Stakeholders/Toma de requerimientos 2.docx'
source_qa_md = 'DOCS/estudio_defensa/RESPUESTAS_PREGUNTAS_COMISION.md'
output_docx = 'DOCS/estudio_defensa/GUIA_OFICIAL_EXPOSICION_SIGA_ESCOLAR.docx'
output_docx_root = 'DOCS/GUIA_OFICIAL_EXPOSICION_SIGA_ESCOLAR.docx'

ns_w = 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'
ET.register_namespace('w', ns_w)


def w_tag(name):
    return f'{{{ns_w}}}{name}'


def add_run_with_breaks(p_el, text, bold=False, italic=False, color=None, font_size=None, font_name=None):
    parts = text.split('\n')
    for idx, part in enumerate(parts):
        if part:
            r = ET.SubElement(p_el, w_tag('r'))
            rPr = ET.SubElement(r, w_tag('rPr'))
            if font_name:
                rFonts = ET.SubElement(rPr, w_tag('rFonts'))
                rFonts.set(w_tag('ascii'), font_name)
                rFonts.set(w_tag('hAnsi'), font_name)
            if bold:
                ET.SubElement(rPr, w_tag('b'))
            if italic:
                ET.SubElement(rPr, w_tag('i'))
            if color:
                c = ET.SubElement(rPr, w_tag('color'))
                c.set(w_tag('val'), color)
            if font_size:
                sz = ET.SubElement(rPr, w_tag('sz'))
                sz.set(w_tag('val'), str(font_size))
                szCs = ET.SubElement(rPr, w_tag('szCs'))
                szCs.set(w_tag('val'), str(font_size))
            t = ET.SubElement(r, w_tag('t'))
            t.text = part
            t.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
        if idx < len(parts) - 1:
            r_br = ET.SubElement(p_el, w_tag('r'))
            ET.SubElement(r_br, w_tag('br'))


def add_p(body, text="", style=None, bold=False, italic=False, color=None,
          space_after=100, space_before=0, indent_left=0, hanging=0,
          shading=None, border_left=None, font_size=None, keep_next=False):
    p_el = ET.SubElement(body, w_tag('p'))
    pPr = ET.SubElement(p_el, w_tag('pPr'))
    if style:
        pStyle = ET.SubElement(pPr, w_tag('pStyle'))
        pStyle.set(w_tag('val'), style)
    if keep_next:
        ET.SubElement(pPr, w_tag('keepNext'))
    if border_left:
        pBdr = ET.SubElement(pPr, w_tag('pBdr'))
        left = ET.SubElement(pBdr, w_tag('left'))
        left.set(w_tag('val'), 'single')
        left.set(w_tag('sz'), '18')
        left.set(w_tag('space'), '8')
        left.set(w_tag('color'), border_left)
    if shading:
        shd = ET.SubElement(pPr, w_tag('shd'))
        shd.set(w_tag('val'), 'clear')
        shd.set(w_tag('color'), 'auto')
        shd.set(w_tag('fill'), shading)
    if space_after is not None or space_before:
        sp = ET.SubElement(pPr, w_tag('spacing'))
        if space_after is not None:
            sp.set(w_tag('after'), str(space_after))
        if space_before:
            sp.set(w_tag('before'), str(space_before))
    if indent_left or hanging:
        ind = ET.SubElement(pPr, w_tag('ind'))
        if indent_left:
            ind.set(w_tag('left'), str(indent_left))
        if hanging:
            ind.set(w_tag('hanging'), str(hanging))

    if text:
        add_run_with_breaks(p_el, text, bold=bold, italic=italic, color=color, font_size=font_size)
    return p_el


def add_page_break(body):
    p_el = ET.SubElement(body, w_tag('p'))
    r = ET.SubElement(p_el, w_tag('r'))
    br = ET.SubElement(r, w_tag('br'))
    br.set(w_tag('type'), 'page')


INLINE_TOKEN_RE = re.compile(r'(\*\*[^*]+\*\*|\*[^*]+\*|`[^`]+`)')


def add_inline_markdown(p_el, text, base_bold=False, base_italic=False, base_color=None, font_size=None):
    clean = re.sub(r'\[([^\]]+)\]\([^)]+\)', r'\1', text)
    clean = clean.replace('<br>', '\n').replace('<br/>', '\n')
    pos = 0
    for m in INLINE_TOKEN_RE.finditer(clean):
        if m.start() > pos:
            add_run_with_breaks(
                p_el, clean[pos:m.start()],
                bold=base_bold, italic=base_italic, color=base_color, font_size=font_size
            )
        tok = m.group(0)
        if tok.startswith('**') and tok.endswith('**'):
            add_run_with_breaks(
                p_el, tok[2:-2],
                bold=True, italic=base_italic, color=base_color, font_size=font_size
            )
        elif tok.startswith('*') and tok.endswith('*'):
            add_run_with_breaks(
                p_el, tok[1:-1],
                bold=base_bold, italic=True, color=base_color, font_size=font_size
            )
        elif tok.startswith('`') and tok.endswith('`'):
            add_run_with_breaks(
                p_el, tok[1:-1],
                bold=base_bold, italic=base_italic, color='1E3A8A',
                font_size=font_size, font_name='Consolas'
            )
        pos = m.end()
    if pos < len(clean):
        add_run_with_breaks(
            p_el, clean[pos:],
            bold=base_bold, italic=base_italic, color=base_color, font_size=font_size
        )


def add_markdown_table(body, table_lines):
    rows = []
    for ln in table_lines:
        cells = [c.strip() for c in ln.strip().strip('|').split('|')]
        rows.append(cells)
    if len(rows) < 2:
        return
    header = rows[0]
    data_rows = rows[2:]  # skip separator row | :--- | ... |
    all_rows = [header] + data_rows
    num_cols = max(len(r) for r in all_rows)

    tbl = ET.SubElement(body, w_tag('tbl'))
    tblPr = ET.SubElement(tbl, w_tag('tblPr'))
    tblW = ET.SubElement(tblPr, w_tag('tblW'))
    tblW.set(w_tag('w'), '9029')  # A4 writable width (11909 - 2880)
    tblW.set(w_tag('type'), 'dxa')

    tblBorders = ET.SubElement(tblPr, w_tag('tblBorders'))
    for side in ['top', 'left', 'bottom', 'right', 'insideH', 'insideV']:
        b = ET.SubElement(tblBorders, w_tag(side))
        b.set(w_tag('val'), 'single')
        b.set(w_tag('sz'), '4')
        b.set(w_tag('space'), '0')
        b.set(w_tag('color'), 'CBD5E1')

    tblCellMar = ET.SubElement(tblPr, w_tag('tblCellMar'))
    for side, val in [('top', '80'), ('bottom', '80'), ('left', '110'), ('right', '110')]:
        m = ET.SubElement(tblCellMar, w_tag(side))
        m.set(w_tag('w'), val)
        m.set(w_tag('type'), 'dxa')

    col_width = max(1200, 9029 // max(1, num_cols))
    tblGrid = ET.SubElement(tbl, w_tag('tblGrid'))
    for _ in range(num_cols):
        gc = ET.SubElement(tblGrid, w_tag('gridCol'))
        gc.set(w_tag('w'), str(col_width))

    for r_idx, row in enumerate(all_rows):
        tr = ET.SubElement(tbl, w_tag('tr'))
        is_header = (r_idx == 0)
        if is_header:
            trPr = ET.SubElement(tr, w_tag('trPr'))
            ET.SubElement(trPr, w_tag('tblHeader'))
        for c_idx in range(num_cols):
            cell_text = row[c_idx] if c_idx < len(row) else ''
            tc = ET.SubElement(tr, w_tag('tc'))
            tcPr = ET.SubElement(tc, w_tag('tcPr'))
            tcW = ET.SubElement(tcPr, w_tag('tcW'))
            tcW.set(w_tag('w'), str(col_width))
            tcW.set(w_tag('type'), 'dxa')
            if is_header:
                shd = ET.SubElement(tcPr, w_tag('shd'))
                shd.set(w_tag('val'), 'clear')
                shd.set(w_tag('color'), 'auto')
                shd.set(w_tag('fill'), '003366')
            elif r_idx % 2 == 0:
                shd = ET.SubElement(tcPr, w_tag('shd'))
                shd.set(w_tag('val'), 'clear')
                shd.set(w_tag('color'), 'auto')
                shd.set(w_tag('fill'), 'F8FAFC')

            p_cell = ET.SubElement(tc, w_tag('p'))
            pPr = ET.SubElement(p_cell, w_tag('pPr'))
            sp = ET.SubElement(pPr, w_tag('spacing'))
            sp.set(w_tag('after'), '40')
            sp.set(w_tag('before'), '0')
            add_inline_markdown(
                p_cell,
                cell_text,
                base_bold=is_header,
                base_color='FFFFFF' if is_header else '1E293B',
                font_size=19
            )

    add_p(body, "", space_after=80)


def append_qa_markdown(body, md_path):
    with open(md_path, 'r', encoding='utf-8') as f:
        lines = f.read().splitlines()

    add_page_break(body)
    add_p(
        body,
        "PARTE 4: Banco Completo de Preguntas y Respuestas de Comisión (51 Preguntas)",
        style="Heading1",
        bold=True,
        color="003366",
        space_before=120,
        space_after=100,
        keep_next=True
    )

    i = 0
    # Skip first markdown H1 title (line 0) since PARTE 4 provides the section heading
    if lines and lines[0].startswith('# '):
        i = 1

    while i < len(lines):
        line = lines[i]
        stripped = line.strip()

        if not stripped:
            i += 1
            continue

        if stripped == '---':
            add_p(body, "─" * 78, color="CBD5E1", space_before=60, space_after=80, font_size=16)
            i += 1
            continue

        # Markdown table block
        if stripped.startswith('|') and i + 1 < len(lines) and lines[i + 1].strip().startswith('|'):
            tbl_lines = []
            while i < len(lines) and lines[i].strip().startswith('|'):
                tbl_lines.append(lines[i])
                i += 1
            add_markdown_table(body, tbl_lines)
            continue

        # Block headings
        if stripped.startswith('## '):
            add_p(
                body,
                stripped[3:].strip(),
                style="Heading2",
                bold=True,
                color="003366",
                space_before=200,
                space_after=80,
                keep_next=True
            )
            i += 1
            continue

        if stripped.startswith('### '):
            p_q = add_p(
                body,
                "",
                style="Heading3",
                space_before=160,
                space_after=60,
                shading="F1F5F9",
                border_left="003366",
                keep_next=True
            )
            add_inline_markdown(p_q, stripped[4:].strip(), base_bold=True, base_color="003366", font_size=22)
            i += 1
            continue

        # Blockquote block
        if stripped.startswith('>'):
            quote_lines = []
            while i < len(lines) and lines[i].strip().startswith('>'):
                quote_lines.append(lines[i].strip().lstrip('>').strip())
                i += 1
            p_qt = add_p(
                body,
                "",
                space_before=60,
                space_after=100,
                indent_left=240,
                shading="F8FAFC",
                border_left="4682B4"
            )
            add_inline_markdown(p_qt, '\n'.join(quote_lines), base_color="1E293B", font_size=20)
            continue

        # Bullets or numbered lists
        m_num = re.match(r'^(\s*)(\d+)\.\s+(.*)$', line)
        m_bul = re.match(r'^(\s*)[-*]\s+(.*)$', line)
        if m_num:
            indent_lvl = len(m_num.group(1)) // 2
            left_twips = 360 + indent_lvl * 300
            p_li = add_p(body, "", space_after=60, indent_left=left_twips, hanging=220)
            add_run_with_breaks(p_li, f"{m_num.group(2)}. ", bold=True, color="003366", font_size=20)
            add_inline_markdown(p_li, m_num.group(3), base_color="1E293B", font_size=20)
            i += 1
            continue

        if m_bul:
            indent_lvl = len(m_bul.group(1)) // 2
            left_twips = 360 + indent_lvl * 300
            p_li = add_p(body, "", space_after=60, indent_left=left_twips, hanging=200)
            add_run_with_breaks(p_li, "• ", bold=True, color="003366", font_size=20)
            add_inline_markdown(p_li, m_bul.group(2), base_color="1E293B", font_size=20)
            i += 1
            continue

        # Normal paragraph (keep continuation lines in same paragraph if not blank/special)
        para_lines = [stripped]
        i += 1
        while i < len(lines):
            nxt = lines[i].strip()
            if (not nxt or nxt == '---' or nxt.startswith('#') or nxt.startswith('|')
                    or nxt.startswith('>') or re.match(r'^([-*]|\d+\.)\s+', nxt)):
                break
            para_lines.append(nxt)
            i += 1

        p_norm = add_p(body, "", space_after=90)
        add_inline_markdown(p_norm, '\n'.join(para_lines), base_color="1E293B", font_size=20)


# Build full document
doc = ET.Element(w_tag('document'))
body = ET.SubElement(doc, w_tag('body'))

# Header & Intro
add_p(body, "SIGA ESCOLAR", style="Title", bold=True, color="003366", space_before=200, space_after=80)
add_p(body, "Sistema Integral de Gestión y Acompañamiento Escolar", style="Subtitle", italic=True, color="4682B4", space_after=140)

add_p(body, "GUÍA OFICIAL DE EXPOSICIÓN, FERIA DE INNOVACIÓN Y DEFENSA", style="Heading1", bold=True, color="003366", space_after=100)
p_meta = add_p(body, "", space_after=180)
add_run_with_breaks(p_meta, "Asignatura: ", bold=True)
add_run_with_breaks(p_meta, "Innovación y Emprendimiento III / Proyecto de Título — INACAP | ")
add_run_with_breaks(p_meta, "Profesor: ", bold=True)
add_run_with_breaks(p_meta, "Carlos Luco Montofré\n")
add_run_with_breaks(p_meta, "Equipo: ", bold=True)
add_run_with_breaks(p_meta, "Marcelo Acevedo, Daniel Flores, Claudia Infante | ")
add_run_with_breaks(p_meta, "Expositor: ", bold=True)
add_run_with_breaks(p_meta, "Marcelo Acevedo\n")
add_run_with_breaks(p_meta, "Caso Real: ", bold=True)
add_run_with_breaks(p_meta, "Escuela Coeducacional N.° 1 El Salvador (Atacama)")

add_p(body, "─" * 78, color="CBD5E1", space_after=160, font_size=16)

# PARTE 1: LA PRESENTACIÓN (ELEVATOR PITCH CON IA)
add_p(body, "PARTE 1: La Presentación (Elevator Pitch Oficial con IA)", style="Heading1", bold=True, color="003366", space_before=160, space_after=100)
add_p(body, "Duración: 42 a 45 segundos (101 palabras). Tono afirmativo, seguro y profesional:", italic=True, space_after=120)

p_box = add_p(body, "", space_before=80, space_after=140, indent_left=200, shading="F8FAFC", border_left="003366")
add_run_with_breaks(p_box, "“SIGA Escolar es un servicio digital de gestión que facilita y acompaña la convivencia en los establecimientos educacionales.\n\n", bold=True, color="003366")
add_run_with_breaks(p_box, "En lugar de trámites burocráticos y casos dispersos en carpetas, conectamos a todo el equipo escolar para gestionar y resolver los conflictos de manera oportuna y estructurada.\n\n", italic=True)
add_run_with_breaks(p_box, "El servicio guía la aplicación de los protocolos normativos paso a paso, previene el vencimiento de plazos legales y utiliza Inteligencia Artificial para redactar borradores de citación y consultar el reglamento en segundos, bajo estricta revisión humana.\n\n", bold=True, color="003366")
add_run_with_breaks(p_box, "Con esto formalizamos la mediación formativa con las familias, blindamos legalmente a la institución y le devolvemos a los educadores lo más valioso: tiempo real para acompañar y proteger a sus estudiantes.”", bold=True, color="005500")

add_p(body, "Estructura del Pitch Segundo a Segundo:", style="Heading2", bold=True, color="333333", space_after=60)
for b_txt in [
    "0 a 10 s: Entrada afirmativa (qué es y qué ámbito atiende).",
    "10 a 20 s: El cambio de paradigma (de carpetas dispersas a resolución estructurada).",
    "20 a 33 s: Solución tecnológica con IA asistencial y protocolos normativos.",
    "33 a 43 s: Cierre de impacto (mediación con familias, blindaje legal y tiempo humano).",
]:
    p_b = add_p(body, "", space_after=60, indent_left=360, hanging=200)
    add_run_with_breaks(p_b, "• ", bold=True, color="003366")
    add_run_with_breaks(p_b, b_txt)

# PARTE 2: FLUJO DE TRABAJO DENTRO DEL SISTEMA
add_p(body, "PARTE 2: Flujo de Trabajo Dentro del Sistema (El Recorrido en 4 Pasos)", style="Heading1", bold=True, color="003366", space_before=220, space_after=100)
add_p(body, "Así es como un caso real transita dentro de SIGA Escolar de principio a fin sin perderse:", space_after=120)

p_f1 = add_p(body, "")
add_run_with_breaks(p_f1, "1. Captura Rápida en Patio (< 90 segundos):\n", bold=True, color="003366")
add_run_with_breaks(p_f1, "El inspector o docente registra el incidente de forma objetiva desde su teléfono móvil. No pierde tiempo llenando papeles; el sistema clasifica la falta y alerta inmediatamente a Convivencia Escolar.")

p_f2 = add_p(body, "")
add_run_with_breaks(p_f2, "2. Activación Guiada del Protocolo RICE con Semáforo Legal:\n", bold=True, color="003366")
add_run_with_breaks(p_f2, "Convivencia abre el caso. El sistema activa el protocolo normativo correspondiente (Circular 781 / Circular N.º 482 de la Superintendencia) y despliega el semáforo de plazos fatales (< 48 horas) con bloqueo de etapas: nadie puede cerrar un caso si antes no se adjunta el testimonio de descargo del estudiante.")

p_f3 = add_p(body, "")
add_run_with_breaks(p_f3, "3. Resolución Restaurativa mediante Mediación Escolar:\n", bold=True, color="003366")
add_run_with_breaks(p_f3, "En lugar de limitarse a suspender o castigar al alumno, la dupla psicosocial abre una sesión de diálogo: se registran los compromisos mutuos de ambos estudiantes en 2 columnas y el sistema fija una fecha formal de seguimiento.")

p_f4 = add_p(body, "")
add_run_with_breaks(p_f4, "4. Alianza Familiar y Cierre con Acta Oficial:\n", bold=True, color="003366")
add_run_with_breaks(p_f4, "El apoderado recibe un enlace tokenizado en su celular para confirmar la reunión. Se redacta el acta con asistencia de IA, se firma digitalmente y se sella con un código hash criptográfico, dejando al colegio blindado ante fiscalizaciones.")

# PARTE 3: LO MÁS INNOVADOR QUE SE DEBE MOSTRAR
add_p(body, "PARTE 3: Lo Más Innovador que se Debe Mostrar en Pantalla", style="Heading1", bold=True, color="003366", space_before=220, space_after=100)
add_p(body, "Estos son los 4 diferenciadores de alto impacto que debes exhibir y enfatizar en la feria:", space_after=120)

p_in1 = add_p(body, "")
add_run_with_breaks(p_in1, "⭐ 1. Asistente RAG con IA Ética y Filtro DLP (Data Loss Prevention):\n", bold=True, color="003366")
add_run_with_breaks(p_in1, "• Qué hace: Redacta borradores formales de citación y localiza artículos del RICE en segundos.\n")
add_run_with_breaks(p_in1, "• La gran innovación: ", bold=True)
add_run_with_breaks(p_in1, "No envía nombres de menores a la nube. Un filtro DLP propio anonimiza nombres y RUTs ('Juan Pérez' -> '[ESTUDIANTE_A]') antes de consultar el modelo, cumpliendo la Ley N.° 21.719 de Protección de Datos. La decisión final es 100% humana (Human-in-the-Loop).")

p_in2 = add_p(body, "")
add_run_with_breaks(p_in2, "⭐ 2. Semáforo Proactivo de Plazos Fatales (< 48 Horas):\n", bold=True, color="003366")
add_run_with_breaks(p_in2, "• Qué hace: Avisa en rojo y amarillo qué derivaciones externas a OPD/OLN, Salud o Tribunales están por vencer.\n")
add_run_with_breaks(p_in2, "• La gran innovación: ", bold=True)
add_run_with_breaks(p_in2, "Elimina el riesgo de multas de hasta 1.000 UTM de la Superintendencia de Educación por negligencia o retraso en responder protocolos graves.")

p_in3 = add_p(body, "")
add_run_with_breaks(p_in3, "⭐ 3. Módulo de Mediación Restaurativa en Dos Columnas:\n", bold=True, color="003366")
add_run_with_breaks(p_in3, "• Qué hace: Registra acuerdos pedagógicos mutuos entre las partes en conflicto con fecha de revisión.\n")
add_run_with_breaks(p_in3, "• La gran innovación: ", bold=True)
add_run_with_breaks(p_in3, "Sustituye el enfoque puramente punitivo por justicia restaurativa, evitando que el caso quede botado en un cajón olvidado.")

p_in4 = add_p(body, "")
add_run_with_breaks(p_in4, "⭐ 4. Citación Móvil y Acta Criptográfica con Hash SHA-256:\n", bold=True, color="003366")
add_run_with_breaks(p_in4, "• Qué hace: El apoderado confirma desde su celular y el acta oficial en PDF queda sellada con una huella digital única.\n")
add_run_with_breaks(p_in4, "• La gran innovación: ", bold=True)
add_run_with_breaks(p_in4, "Garantiza la no repudiación legal: si un documento se altera o manipula, el código hash evidencia la adulteración ante cualquier tribunal o fiscalizador.")

# PARTE 4: BANCO COMPLETO DE 51 PREGUNTAS Y RESPUESTAS
append_qa_markdown(body, source_qa_md)

# Preserve sectPr from base template for clean A4 page layout
with zipfile.ZipFile(base_docx, 'r') as zin:
    base_doc = ET.fromstring(zin.read('word/document.xml'))
    base_sect = base_doc.find(f'.//{w_tag("sectPr")}')
    if base_sect is not None:
        body.append(base_sect)
    else:
        ET.SubElement(body, w_tag('sectPr'))

new_doc_xml = ET.tostring(doc, encoding='utf-8', xml_declaration=True)

for target_path in [output_docx, output_docx_root]:
    with zipfile.ZipFile(base_docx, 'r') as zin:
        with zipfile.ZipFile(target_path, 'w', compression=zipfile.ZIP_DEFLATED) as zout:
            for item in zin.infolist():
                if item.filename == 'word/document.xml':
                    zout.writestr(item.filename, new_doc_xml)
                else:
                    zout.writestr(item.filename, zin.read(item.filename))
    print(f"Generated successfully: {target_path} (size: {os.path.getsize(target_path)} bytes)")
