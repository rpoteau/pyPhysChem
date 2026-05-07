
# generation of the coordinates of the cuboctahedron
# see https://ase-lib.org/ase/cluster/cluster.html
from ase.cluster import Octahedron
cutoff = 5
cubo = Octahedron('Au', cutoff=cutoff, length=2*cutoff+1)
v = molView(cubo,'ase')

# CN part
nano.view_coordination(cubo, color_map="hot_r")