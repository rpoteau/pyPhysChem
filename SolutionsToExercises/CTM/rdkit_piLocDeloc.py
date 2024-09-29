print("## Question 2")

#1 
mol = easy_rdkit("C=CC=C")
mol.show_mol(size=(200,200),plot_conjugation=True,legend="1")

#2 
mol = easy_rdkit("C/C=C/C")
mol.show_mol(size=(200,200),plot_conjugation=True,legend="2")

#3 
mol = easy_rdkit("C=CCC=C")
mol.show_mol(size=(200,200),plot_conjugation=True,legend="3")

#4 
mol = easy_rdkit("C1C=CC=C1")
mol.show_mol(size=(200,200),plot_conjugation=True,legend="4")

#5 
mol = easy_rdkit("C1CC=CC1")
mol.show_mol(size=(200,200),plot_conjugation=True,legend="5")

#6 
mol = easy_rdkit("C1C(C=CC1=C)=C")
mol.show_mol(size=(200,200),plot_conjugation=True,legend="6")

#7
mol = easy_rdkit("C1CCC=CC1")
mol.show_mol(size=(200,200),plot_conjugation=True,legend="7")

#8 
mol = easy_rdkit("C1=CC=CC=C1")
mol.show_mol(size=(200,200),plot_conjugation=True,legend="8")

print()
print("## Question 3")

#3 
mol = easy_rdkit("C=CCC=C")
mol.show_mol(size=(200,200),plot_conjugation=True,legend="3",show_hybrid=True)

#6 
mol = easy_rdkit("C1C(C=CC1=C)=C")
mol.show_mol(size=(200,200),plot_conjugation=True,legend="6",show_hybrid=True)

