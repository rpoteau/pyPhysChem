#!/usr/bin/env python3
"""
add_labels.py — Insert or update a coloured, bold label + icon at the start of
styled <div> blocks in a Jupyter notebook, so the label stays visible AND
coloured even where the CSS is not loaded (e.g. Google Colab).

For each <div ...> whose class is in LABELS:
  - if a label with the same TEXT is already there but styled differently
    (old markdown **, other colour...), it is REPLACED by the current version;
  - if no label is present, the current label is inserted after the opening tag;
  - if the exact current label is already there, nothing changes.
A blank line always separates the opening <div> from the label.
Other attributes (style=, id=...) and multiple classes are handled.

By default the notebook is updated IN PLACE, after a timestamped backup
(name_YYYYMMDD_HHMMSS.bak) is written next to it. If an output path is given,
the result is written there instead — the backup of the original is still kept.
"""
import json, re, sys, shutil
from datetime import datetime

LABELS = {
    "hintE": '<table width="100%" cellpadding="6"><tr><td bgcolor="#ededb6"><span style="color:#8B4513">💡 <b>Hint</b></span></td></tr></table>',
    "hint": '<table width="100%" cellpadding="6"><tr><td bgcolor="#ededb6"><span style="color:#8B4513">💡 <b>Indice(s)</b></span></td></tr></table>',
    "rqE": '<table width="100%" cellpadding="6"><tr><td bgcolor="#fde9e9"><span style="color:#B71C1C">⚠️ <b>Pay Attention</b></span></td></tr></table>',
    "rq": '<table width="100%" cellpadding="6"><tr><td bgcolor="#fde9e9"><span style="color:#B71C1C">⚠️ <b>Remarque</b></span></td></tr></table>',
    "exE": '<table width="100%" cellpadding="6"><tr><td bgcolor="#d8edf4"><span style="color:#0D47A1">📝 <b>Exercise</b></span></td></tr></table>',
    "ex": '<table width="100%" cellpadding="6"><tr><td bgcolor="#d8edf4"><span style="color:#0D47A1">📝 <b>Exercice</b></span></td></tr></table>',
    "app": '<table width="100%" cellpadding="6"><tr><td bgcolor="#d8edf4"><span style="color:#0D47A1">🚀 <b>Application</b></span></td></tr></table>',
    "solE": '<table width="100%" cellpadding="6"><tr><td bgcolor="#ddf4db"><span style="color:#1B5E20">🔑 <b>Answer</b></span></td></tr></table>',
    "sol": '<table width="100%" cellpadding="6"><tr><td bgcolor="#ddf4db"><span style="color:#1B5E20">🔑 <b>Réponse</b></span></td></tr></table>',
    "intro": '<table width="100%" cellpadding="6"><tr><td bgcolor="#e6e6e6"><span style="color:#000000">📖 <b>Introduction</b></span></td></tr></table>',
}
USAGE = "usage: ./add_labels.py input.ipynb [output.ipynb]"

HELP = f"""{__doc__}
{USAGE}

Arguments:
  input.ipynb    notebook to label (updated in place by default)
  output.ipynb   optional: write result here instead of in place

Options:
  -h, --help     show this help message and exit

Labels currently inserted (edit the LABELS dict to change them):
""" + "\n".join(f'  <div class="{cls}">  ->  {re.sub(r"<[^>]+>", "", lab)}' for cls, lab in LABELS.items()) + """

Examples:
  ./add_labels.py PPCL.ipynb                    # in place, with backup
  ./add_labels.py PPCL.ipynb PPCL-labelled.ipynb
"""

def bare(s):
    """Strip HTML tags and markdown emphasis, collapse spaces -> comparable text."""
    return re.sub(r"\s+", " ", re.sub(r"[*_`]", "", re.sub(r"<[^>]+>", "", s))).strip()

def open_tag(cls):
    """Regex for an opening <div ...> whose class list contains cls."""
    return (r'<div\b[^>]*\bclass=["\'][^"\']*\b'
            + re.escape(cls) + r'\b[^"\']*["\'][^>]*>[ \t]*\n?')

def backup(path):
    """Copy path to name_YYYYMMDD_HHMMSS.bak next to it, return the backup name."""
    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    root = path[:-6] if path.endswith(".ipynb") else path
    bak = f"{root}_{stamp}.bak"
    shutil.copy2(path, bak)
    return bak

def process(nbpath, outpath):
    bak = backup(nbpath)
    print(f"backup saved:   {bak}")
    print(f"output written: {outpath}")

    nb = json.load(open(nbpath))
    inserted = {cls: 0 for cls in LABELS}
    updated  = {cls: 0 for cls in LABELS}

    for c in nb["cells"]:
        if c["cell_type"] != "markdown":
            continue
        src = "".join(c["source"])
        for cls, label in LABELS.items():
            want = bare(label)
            tag = open_tag(cls)

            # PASS 1 — update: opening tag immediately followed by an old label line
            def update_sub(m):
                if bare(m.group(2)) == want and m.group(2) != label:
                    updated[cls] += 1
                    opening = m.group(1).rstrip("\n")
                    return opening + "\n\n" + label
                return m.group(0)
            src = re.sub(r'(' + tag + r')\s*([^\n]+)', update_sub, src)

            # PASS 2 — insert: opening tag whose first content line is NOT the label
            def insert_sub(m):
                start = m.end()
                close = src.find("</div>", start)
                block = src[start:close] if close != -1 else src[start:]
                first = next((l for l in block.split("\n") if l.strip()), "")
                if bare(first) == want:
                    return m.group(0)
                inserted[cls] += 1
                opening = m.group(0).rstrip("\n")
                return opening + "\n\n" + label + "\n"
            src = re.sub(tag, insert_sub, src)

        c["source"] = src.splitlines(keepends=True)

    json.dump(nb, open(outpath, "w"), ensure_ascii=False, indent=1)

    ti, tu = sum(inserted.values()), sum(updated.values())
    print()
    print(f"labels inserted: {ti}, updated: {tu}")
    for cls in LABELS:
        txt = re.sub(r"<[^>]+>", "", LABELS[cls]).strip()
        print(f"  {cls:6s} ({txt}): +{inserted[cls]} inserted, {updated[cls]} updated")

if __name__ == "__main__":
    if any(a in ("-h", "--help") for a in sys.argv[1:]):
        print(HELP)
        sys.exit(0)
    if len(sys.argv) not in (2, 3):
        sys.exit(USAGE)
    inp = sys.argv[1]
    out = sys.argv[2] if len(sys.argv) == 3 else inp   # default: in place
    process(inp, out)
