#Q3
from scipy.stats import linregress

fitlin = linregress(x=RTinv, y=lnk)

Ea = -fitlin.slope
lnA = fitlin.intercept #lnA is a variable!!
A = np.exp(lnA)
Rscore = fitlin.rvalue

print(f"Ea  = {Ea:8.3f} J.mol-1\nA   = {A:8.3f} s-1\nR^2 = {Rscore**2:6.3f}") # \n = new line

#Q4

def kArr(T,A,Ea):
    """
    input:
        - T = temperarture, in K
        - A = pre-exponental factor
        - Ea = activation energy, in J.mol-1
    returns:
        the rate constant, k, in the same unit as A
    """
    import numpy as np
    import scipy.constants as sc
    R = sc.value("molar gas constant")
    return A*np.exp(-Ea/(R*T))

kfit = kArr(Texp,A,Ea)
plt.figure(figsize=(12,8))
plt.plot(RTinv, np.log(kexp), color='r', linestyle='', marker="o", markersize=14, label="exp. values")
plt.plot(RTinv, np.log(kfit), color='b', linestyle='-', marker="X", markersize=14, label="fitted values (linear regression)")
plt.xlabel('1/RT / mol.J-1',size=14,fontweight='bold',color='blue')
plt.ylabel('ln(k)',size=14,fontweight='bold',color='blue')
plt.xticks(fontsize=16,fontweight='bold')
plt.yticks(fontsize=16,fontweight='bold')
plt.legend()
plt.show()

#Q5

k300 = kArr(300,A,Ea)
k373 = kArr(373.15,A,Ea)
print(f"k = {k300:.3f} at 300K")
print(f"k = {k373:.3f} at 373.15K")
