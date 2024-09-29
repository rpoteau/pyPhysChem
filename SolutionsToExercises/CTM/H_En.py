import scipy.constants as sc
print("## Question 1")

# affichages
print(f'Constante de Planck, h: {sc.physical_constants["Planck constant"]}')
print()
print(f'Masse de l\'électron, me: {sc.physical_constants["electron mass"]}')
print()
print(f'Masse du proton, mp: {sc.physical_constants["proton mass"]}')
print()
print(f'Permittivité du vide, eps0: {sc.physical_constants["vacuum electric permittivity"]}')
print()
print(f'Charge élémentaire, e: {sc.physical_constants["elementary charge"]}')

# sauvegarde des valeurs des grandeurs physiques dans des variables
h = sc.physical_constants["Planck constant"][0]
me = sc.physical_constants["electron mass"][0]
mp = sc.physical_constants["proton mass"][0]
eps0 = sc.physical_constants["vacuum electric permittivity"][0]
e = sc.physical_constants["elementary charge"][0]

print()
print("## Question 2")
muH = me*mp/(me+mp)
Ei1 = muH*e**4 / (8*(h*eps0)**2)

print("muH =",muH,"kg")
print()
print("Ei1 =",Ei1,"J")
print("Ei1 =",Ei1/e,"eV")

print()
print("## Question 3")
Ei1_eV = Ei1/e
for n in range(1,11):
    En = -Ei1_eV/n**2
    print("n =",n,": E = ",np.round(En,3),"eV")
