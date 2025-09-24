print("## Question 1")
import numpy as np
import scipy.constants as sc

# affichages
print(f'Constante de Planck, h: {sc.physical_constants["Planck constant"]}')
print()
print(f'Vitesse de la lumière dans la vide, c: {sc.physical_constants["speed of light in vacuum"]}')

# pour la conversion J > eV
print()
print(f'Charge élémentaire, e: {sc.physical_constants["elementary charge"]}')

# sauvegarde des valeurs des grandeurs physiques dans des variables
h = sc.physical_constants["Planck constant"][0]
e = sc.physical_constants["elementary charge"][0]
c = sc.physical_constants["speed of light in vacuum"][0]

eV2nm = h*c*1e9/e
print(eV2nm)

print()
print("## Question 2")
E2 = -Ei1_eV/4
E3 = -Ei1_eV/9
DeltaE = E3-E2
print("3 > 2, DeltaE = ",np.round(DeltaE,3),"eV ; lambda = ",np.round(eV2nm/DeltaE,1),"nm")

print()
print("## Question 3")
def E(n):
    return -Ei1_eV/n**2

nombre_de_transitions = 6
for n in range(3, 3 + nombre_de_transitions):
    longueur_onde = eV2nm/(E(n)-E(2))
    print(n,"-> 2, lambda = ",np.round(longueur_onde,1),"nm")

print()
print("## Question 4")
print("Lyman")
for n in range(2, 2 + nombre_de_transitions):
    longueur_onde = eV2nm/(E(n)-E(1))
    print(n,"-> 1, lambda = ",np.round(longueur_onde,1),"nm")

print()
print("Brackett")
for n in range(4, 4 + nombre_de_transitions):
    longueur_onde = eV2nm/(E(n)-E(3))
    print(n,"-> 3, lambda = ",np.round(longueur_onde,1),"nm")
