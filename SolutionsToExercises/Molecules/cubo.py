
# generation of the coordinates of the cuboctahedron
from ase.cluster import Octahedron
cutoff = 5
cubo = Octahedron('Au', cutoff=cutoff, length=2*cutoff+1)
v = view(cubo, viewer='ngl')
display(v)

# Calculate coordination numbers (CNs)
cn = coordination_numbers(cubo, cutoff=3.2)

# Palette CN 1→20
palette = cn_palette()
colors = colors_for_cn(cn, palette)

# Visualise
v = view_atoms_colored(cubo, colors)
v.show()

# --- graphical caption: one line per CN ---
unique_cns = sorted(set(cn))
legend_elements = [Patch(facecolor=palette[val], edgecolor="k", label=f"CN = {val}")
                   for val in unique_cns]

fig, ax = plt.subplots(figsize=(3, len(unique_cns)*0.4))
ax.axis("off")
ax.legend(handles=legend_elements, loc="center left", frameon=False)
plt.show()
