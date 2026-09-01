
from scipy.integrate import quad

# Empirical heat capacity of CO2 (J K-1 mol-1)
def Cp(T):
    a, b, c = 44.14, 9.04e-3, -8.54e5
    return a + b*T + c/T**2

# Enthalpy change from 298 K to 500 K
dH, error = quad(Cp, 298, 500)
print(f"ΔH = {dH/1000:.2f} kJ.mol-1   (estimated error = {error:.1e} J.mol-1)")
