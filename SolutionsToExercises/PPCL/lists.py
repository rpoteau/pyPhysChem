# ============================================================
# Lists
# ============================================================
# t4pPC.centertxt(...) is a helper from the pyphyschemtools library: it displays
# a centered, styled text label (here a bold title) to separate the answers.
#
# Note: we don't have to  call print() every time. In a Jupyter notebook, the value of the
# LAST expression of a cell is displayed automatically. Moreover, this notebook sets
# InteractiveShell.ast_node_interactivity = "all", so EVERY standalone expression in
# a cell is shown, not just the last one — hence `val`, `val[0]`, etc. display on their
# own, without print().

t4pPC.centertxt("1. Store the list in val and display it", size=12, weight="bold")
val = [1, 4, -6, 12, 1.55]
val

t4pPC.centertxt("2. First element", size=12, weight="bold")
val[0]

t4pPC.centertxt("3. Third element", size=12, weight="bold")
val[2]

t4pPC.centertxt("4. Last element without using index 4", size=12, weight="bold")
val[-1]

t4pPC.centertxt("5. Sublist [4, -6, 12]", size=12, weight="bold")
val[1:4]

t4pPC.centertxt("6. Add an element with value 5 using append()", size=12, weight="bold")
val.append(5)
val
