
t4pPC.centerTitle("Atomic masses setup")

# Question 1
mH = mm.ELEMENTS["H"].mass
mO = mm.ELEMENTS["O"].mass

# Question 2
MH = mH*u2kg
MO = mO*u2kg

print(f"Mass of H = {mH} u = {MH:.3e} kg")
print(f"Mass of O = {mO} u = {MO:.3e} kg")

t4pPC.centerTitle("Moment of inertia of a molecule")
from IPython.display import Math
display(Math('$$I = \sum_{i=1}^{N_\mathrm{atoms}} m_i x_i^2$$'))
display(Math(r"\text{where } x_i \text{ is the perpendicular distance of the atom } i \text{ from the axis of rotation}"))

t4pPC.centerTitle("Moment of inertia of H2O")
rH = 95.7 * m.sin(m.radians(104.5/2))
print(f"Perpendicular distance of H atoms from the vertical axis = {rH:.1f} pm")
I = 2*MH*(rH*1e-12)**2
print(f"Moment of inertia I = {I:.3e} kg m^2")

