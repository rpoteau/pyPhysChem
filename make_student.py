#!/usr/bin/env python3
"""
make_student.py — Build the student version of a teaching notebook from its
"-dev" master copy (which contains the solutions and is never published).

  name-dev.ipynb  ->  name.ipynb            (student version, default)
  name-dev.ipynb  ->  name-corrige.ipynb    (with --corrige)

Student version, in each code cell:
  - a cell whose first line is "# Démo" (or "# Demo") is a demo cell: kept as is;
  - the code BEFORE a start marker is kept (code given to the students);
  - a start marker line is kept, followed by 2 blank lines;
  - everything after it is erased, down to an end marker "# FinSol" (removed too)
    or, without end marker, to the end of the cell; the code after "# FinSol" is kept;
  - a cell may contain several marker / "# FinSol" blocks.
Markdown cells: <div class="sol"> / <div class="solE"> blocks are removed.

Both versions: all the outputs and execution counts are cleared (outputs give
the solutions away, and make the notebook heavy), and the saved widget states.

Markers, French or English (both are always recognized), compared
case-insensitively, without accents, whatever the number of spaces after the
"#" (0, 1, 2...) and between the words; the line may start with several "#"
("### Entrez le code python" is a start marker):
  start:  # Entrez le code python  |  # Ajoutez votre code ici
          # Enter your code here   |  # Enter the python code  |  # Add your code here
  end:    starts with "Fin" or "End" and contains "sol": # FinSol | # Fin Sol |
          # Fin solution | # Fin de la solution | # EndSol | # End of solution...
          (optional: without it, erased down to the end of the cell)
  demo:   # Démo  |  # Demo        (first non-empty line of the cell; kept in full)

Interactive mode (default, in a terminal): each code cell that is neither a
demo cell nor contains a start marker is shown (first 6 lines), and you are
asked what it is: s = solution, d = demo, Enter = don't know (left as it is),
q = stop asking. The answer ADDS THE MARKER to the cell in the -dev notebook
itself (after a timestamped backup name-dev_YYYYMMDD_HHMMSS.bak), so the
question is not asked again next time. --no-ask: no question, report only.
The marker added is French or English (--lang Fr | En); without --lang, the
language of the markers already present in the notebook (French if none) is
proposed, and you confirm it or choose the other one.

A report lists the code cells that are neither demo cells nor contain a start
marker: they are kept in full in the student version, so check that they do
not contain a solution (the setup cells, before the first title, are not
listed). Each one is given with its number, the title of the
section it belongs to and its first line (to find it with Ctrl+F in Jupyter).
"""
import json, re, sys, unicodedata, copy, shutil
from datetime import datetime
from pathlib import Path

START_FR = ["entrez le code python", "ajoutez votre code ici"]
START_EN = ["enter your code here", "enter the python code", "add your code here"]
START = START_FR + START_EN
DEMO = ["demo"]
# markers added in interactive mode, in the language of the notebook
INSERT = {"Fr": {"s": "# Entrez le code python\n\n", "d": "# Démo\n"},
          "En": {"s": "# Enter your code here\n\n", "d": "# Demo\n"}}
USAGE = "usage: ./make_student.py name-dev.ipynb [--corrige] [--no-ask] [--lang Fr|En]"

def norm(line):
    """'#  Démo ' -> 'demo': no '#', no accents, lower case, single spaces."""
    s = line.strip()
    if not s.startswith("#"):
        return None
    s = unicodedata.normalize("NFD", s.lstrip("#")).encode("ascii", "ignore").decode()
    return re.sub(r"\s+", " ", s).strip().lower()

def is_marker(line, words):
    return norm(line) in words

def is_end(line):
    """End marker: starts with 'fin' or 'end' and contains 'sol' (FinSol, Fin Sol,
    Fin solution, Fin de la solution, EndSol, End of solution...)."""
    t = norm(line)
    if t is None:
        return False
    t = t.replace(" ", "")
    return t.startswith(("fin", "end")) and "sol" in t and len(t) <= 25

def strip_solutions(src):
    """Returns (new source, number of solution blocks removed)."""
    out, skip, after_fin, n = [], False, False, 0
    for line in src.split("\n"):
        if skip:
            if is_end(line):
                skip, after_fin = False, True    # '# Fin' itself is removed
            continue
        if after_fin and not line.strip():
            continue                             # the 2 blank lines are already there
        after_fin = False
        if is_marker(line, START):
            out += [line.rstrip(), "", ""]
            skip, n = True, n + 1
            continue
        out.append(line)
    return "\n".join(out), n

def first_line(src):
    return next((l.strip() for l in src.split("\n") if l.strip()), "")

def section_of_cells(nb):
    """Title of the section each cell belongs to ('' before the first title)."""
    sec, out = "", []
    for c in nb["cells"]:
        if c["cell_type"] == "markdown":
            heads = re.findall(r"^#{1,6}\s+(.+)$", "".join(c["source"]), flags=re.M)
            if heads:
                sec = heads[-1].strip()
        out.append(sec)
    return out

def unmarked_cells(nb):
    """[(index, section)] of the code cells without start or demo marker."""
    secs = section_of_cells(nb)
    res = []
    for k, c in enumerate(nb["cells"]):
        src = "".join(c["source"])
        if (c["cell_type"] == "code" and src.strip() and secs[k]
                and norm(first_line(src)) not in DEMO
                and not any(is_marker(l, START) for l in src.split("\n"))):
            res.append((k, secs[k]))
    return res

def detect_lang(nb):
    """'En' if the notebook has more English than French start markers, else 'Fr'."""
    fr = en = 0
    for c in nb["cells"]:
        if c["cell_type"] == "code":
            for l in "".join(c["source"]).split("\n"):
                fr += norm(l) in START_FR
                en += norm(l) in START_EN
    return "En" if en > fr else "Fr"

def confirm_lang(nb):
    """Detected language of the markers, confirmed (or changed) by the user."""
    lang = detect_lang(nb)
    name = {"Fr": "French", "En": "English"}
    while True:
        a = input(f"Language detected: {name[lang]} (markers added: "
                  f"'{INSERT[lang]['s'].strip()}', '{INSERT[lang]['d'].strip()}'). "
                  f"Enter = OK, or Fr / En ? ").strip().capitalize()
        if a == "":
            return lang
        if a in INSERT:
            return a

def ask_markers(nb, path, lang):
    """Interactive: for each unmarked cell, show it and ask what it is; the
    answer adds the marker at the top of the cell IN THE -dev NOTEBOOK."""
    todo = unmarked_cells(nb)
    if not todo:
        return
    if lang is None:
        lang = confirm_lang(nb)
    print(f"\n{len(todo)} code cell(s) without marker.")
    ms, md = INSERT[lang]["s"].strip(), INSERT[lang]["d"].strip()
    print(f"  s = solution (adds '{ms}' at the top: the whole cell is erased)")
    print(f"  d = demo     (adds '{md}' at the top: the cell is kept)")
    print("  Enter = I don't know: the cell is left as it is (kept in full)")
    print("  q = stop asking (the remaining cells are left as they are)\n")
    changed = 0
    for k, sec in todo:
        lines = "".join(nb["cells"][k]["source"]).split("\n")
        print("─" * 78)
        print(f"cell {k + 1}  [{sec}]")
        for l in lines[:6]:
            print("   │ " + l[:100])
        if len(lines) > 6:
            print(f"   │ ... ({len(lines) - 6} more lines)")
        while True:
            a = input("s / d / Enter / q ? ").strip().lower()
            if a in ("s", "d", "", "q"):
                break
        if a == "q":
            break
        if a in ("s", "d"):
            marker = INSERT[lang][a]
            nb["cells"][k]["source"] = (marker + "".join(nb["cells"][k]["source"])).splitlines(keepends=True)
            changed += 1
    print("─" * 78)
    if changed:
        bak = backup(path)
        json.dump(nb, open(path, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        print(f"{changed} marker(s) added to {path.name} (backup: {bak.name})\n")

def backup(path):
    """Copy path to name_YYYYMMDD_HHMMSS.bak next to it."""
    bak = path.with_name(f"{path.stem}_{datetime.now():%Y%m%d_%H%M%S}.bak")
    shutil.copy2(path, bak)
    return bak

def process(inp, corrige=False, interactive=True, lang=None):
    path = Path(inp)
    if not path.stem.endswith("-dev"):
        sys.exit(f"error: {path.name} is not a -dev notebook (name-dev.ipynb expected)")
    base = path.stem[:-4]
    out = path.with_name(base + ("-corrige" if corrige else "") + ".ipynb")

    nb = json.load(open(path, encoding="utf-8"))
    if interactive and sys.stdin.isatty():
        ask_markers(nb, path, lang)
    nb = copy.deepcopy(nb)                       # the -dev notebook keeps its outputs
    unmarked = [(k + 1, sec, first_line("".join(nb["cells"][k]["source"]))) for k, sec in unmarked_cells(nb)]

    n_sol = n_demo = n_div = 0
    for c in nb["cells"]:
        src = "".join(c["source"])
        if c["cell_type"] == "markdown" and not corrige:
            src, nd = re.subn(r'<div\b[^>]*\bclass=["\']solE?["\'][^>]*>.*?</div>\s*', "", src, flags=re.S)
            n_div += nd
        elif c["cell_type"] == "code":
            c["outputs"], c["execution_count"] = [], None
            if norm(first_line(src)) in DEMO:
                n_demo += 1
            elif not corrige and any(is_marker(l, START) for l in src.split("\n")):
                src, n = strip_solutions(src)
                n_sol += n
        c["source"] = src.splitlines(keepends=True)
    nb.get("metadata", {}).pop("widgets", None)

    json.dump(nb, open(out, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"output written: {out}  ({out.stat().st_size / 1e6:.1f} MB, input {path.stat().st_size / 1e6:.1f} MB)")
    if not corrige:
        print(f"solution blocks erased: {n_sol}; demo cells kept: {n_demo}; <div class=\"sol\"> removed: {n_div}")
    print("outputs cleared in all the code cells")
    if unmarked:
        print(f"\n{len(unmarked)} code cell(s) without marker, kept IN FULL — check them:")
        for k, sec, line in unmarked:
            print(f"  cell {k:3d}  [{sec[:45]}]  {line[:60]}")

if __name__ == "__main__":
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__ + "\n" + USAGE)
        sys.exit(0)
    lang = None
    if "--lang" in args:
        i = args.index("--lang")
        if i + 1 >= len(args) or args[i + 1].capitalize() not in INSERT:
            sys.exit(USAGE)
        lang = args[i + 1].capitalize()
        del args[i:i + 2]
    corrige = "--corrige" in args
    files = [a for a in args if a not in ("--corrige", "--no-ask")]
    if len(files) != 1:
        sys.exit(USAGE)
    process(files[0], corrige, interactive="--no-ask" not in args, lang=lang)
