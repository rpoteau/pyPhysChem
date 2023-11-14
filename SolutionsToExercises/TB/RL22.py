###########################################
t4pPC.centerTitle("Answer to question 1")
###########################################

def rectangle_lattice22(a1=0.16, a2=0.24, t1=-1.2, t2=-0.8):
    '''
    input:
        - a = lattice parameter, in nm (default: 2 angs = 0.2 nm)
        - t = hopping energy, in eV (default : -1 eV)
    '''
    
    # create a simple 2D lattice with vectors a1 & a2
    lattice = pb.Lattice(a1=[a1, 0], a2=[0, a2])
    lattice.add_sublattices(
        ('A', [0, 0], 0.),  # add an atom called 'A' at position [0, 0] and set its associated AO energy to 0 eV
        ('Ax', [a1/2, 0], 0.),
        ('Ay', [0, a2/2], 0.),
        ('Ad', [a1/2, a2/2], 0.)
    )
    lattice.add_hoppings(
        # (Difference of the indices of the source and destination unit cells
        # Name of the sublattice in the source unit cell, Name of the sublattice in the destination unit cell, hopping energy)
        # inside the unit cell
        ([0, 0], 'A', 'Ax', t1),
        ([0, 0], 'A', 'Ay', t2),
        ([0, 0], 'Ax', 'Ad', t2),
        ([0, 0], 'Ay', 'Ad', t1),
        # between neighbouring unit cells
        ([1, 0], 'Ax', 'A', t1),
        ([1, 0], 'Ad', 'Ay', t2),
        ([0, 1], 'Ay', 'A', t2),
        ([0, 1], 'Ad', 'Ax', t1)
    )
    return lattice

a1RL22 = 0.16
a2RL22 = 0.24
tRL1 = -1.2
tRL2 = -0.8
RL22 = rectangle_lattice22(a1RL22, a2RL22, tRL1, tRL2)
RL22.plot()  
plt.show()     

###########################################
t4pPC.centerTitle("Answer to question 2a")
###########################################

RL22model = pb.Model(
    RL22,
    pb.translational_symmetry(a1=True,a2=True)
)
RL22model.plot()
# RL22.plot_brillouin_zone()

from math import pi

Gamma = [0, 0]
X1 = [pi/(a1RL22), 0]
M = [pi/(a1RL22),pi/(a2RL22)]
X2 = [0, pi/(a2RL22)]

solverRL22 = pb.solver.lapack(RL22model)

RL22bands = solverRL22.calc_bands(Gamma, X1, M, X2, Gamma)

RL22model.lattice.plot_brillouin_zone(decorate=False)
kpoints_labels = [f'$\Gamma$', 'X1', 'M', 'X2', f'$\Gamma$']
RL22bands.plot_kpath(point_labels=kpoints_labels)
plt.show()

###########################################
t4pPC.centerTitle("Answer to question 2b")
###########################################
RL22bands.plot(point_labels=kpoints_labels)
plt.show()


