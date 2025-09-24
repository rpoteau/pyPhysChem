import scipy.constants as sc

# sur la page physical_constants de SciPy on voit que le nombre d'Avogadro est adressable par le nom "Avogadro constant"

print("## Question 1")
print(sc.physical_constants["Avogadro constant"])

print()
print("## Question 2")
NA = sc.physical_constants["Avogadro constant"][0]

print()
print("## Question 3")
NA_unite = sc.physical_constants["Avogadro constant"][1]
print("Nombre d'Avogadro = ",NA,NA_unite)
