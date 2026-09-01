# ============================================================
# Computing the pH of a formic acid solution
# ============================================================

from matplotlib import pyplot as plt
import numpy as np

# 1. Function returning the equilibrium pH
def computepH(C0, pKa):
    Ka = 10**(-pKa)
    pH = -np.log10((Ka/2) * (np.sqrt(1 + 4*C0/Ka) - 1))
    return pH

# 2. Validation: formic acid at 1 mM should give pH ~ 3.48
t4pPC.centertxt("2. Validate the function (expected pH ~ 3.48)", size=12, weight="bold")
C0 = 1e-3
pKa = 3.8
pH = computepH(C0, pKa)
print(f"{pH:.2f}")

# 3. pH vs initial concentration between 0.1 mM and 1 M
t4pPC.centertxt("3. pH as a function of initial concentration", size=12, weight="bold")
AH0 = np.linspace(0.1e-3, 1, 100)
plt.plot(AH0, computepH(AH0, pKa), marker="x")
plt.xlabel("[AH0]")
plt.ylabel("pH")
plt.show()

# 4. Acid fraction as a function of pH and pKa
def fraction(pH, pKa):
    denominator = 1 + 10**(pH - pKa)
    return 1/denominator

# 5. Speciation diagram of formic acid, pH between 0 and 10
t4pPC.centertxt("5. Speciation diagram of formic acid", size=12, weight="bold")
pH = np.linspace(0, 10, 100)
plt.plot(pH, fraction(pH, pKa), label="acid fraction")
plt.plot(pH, 1 - fraction(pH, pKa), label="base fraction")
plt.xlabel("pH")
plt.ylabel("species fraction")
plt.axvline(pKa, ls="--", color='red', label="pKa")
plt.axvline(pKa-1, ls="-.", color='grey', label="pKa-1")
plt.axvline(pKa+1, ls="-.", color='grey', label="pKa+1")
plt.legend()
plt.show()
