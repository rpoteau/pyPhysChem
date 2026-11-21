#!/usr/bin/env python3
"""rename_classes.py — rename French callout classes to their English variant
in the <div class="..."> attributes of a Jupyter notebook.

Only exact class tokens are renamed: rqT, rqE, introT, introE... are left alone.
Several classes on the same div, single or double quotes, and the
<div class="x", title="y"> comma variant are all handled.

usage: ./rename_classes.py notebook.ipynb [notebook2.ipynb ...]   (in place)
"""
import json, re, sys

RENAME = {"rq": "rqE", "sol": "solE", "intro": "introE", "app": "appE"}

CLASS_RE = re.compile(r'(<div\b[^>]*?\bclass\s*=\s*)(["\'])([^"\']*)\2', re.I)

def fix_source(src, counts):
    def repl(m):
        tokens = m.group(3).split()
        new = []
        for t in tokens:
            if t in RENAME:
                counts[t] = counts.get(t, 0) + 1
                new.append(RENAME[t])
            else:
                new.append(t)
        return m.group(1) + m.group(2) + " ".join(new) + m.group(2)
    return CLASS_RE.sub(repl, src)

def process(path):
    with open(path, encoding="utf-8") as f:
        nb = json.load(f)
    counts = {}
    for c in nb["cells"]:
        if c["cell_type"] != "markdown":
            continue
        src = fix_source("".join(c["source"]), counts)
        c["source"] = src.splitlines(keepends=True)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(nb, f, ensure_ascii=False, indent=1)
    done = ", ".join(f"{k}->{RENAME[k]}: {v}" for k, v in sorted(counts.items())) or "nothing to rename"
    print(f"{path}: {done}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit("usage: ./rename_classes.py notebook.ipynb [...]")
    for p in sys.argv[1:]:
        process(p)
