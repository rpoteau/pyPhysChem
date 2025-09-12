smiles = ["P(=O)(O)(O)(O)", "[Xe](F)(F)(F)(F)", "C1=C2C(=NC=N1)N=CN2", "C=CC=C"]
for s in smiles:
    mol = easy_rdkit(s)
    mol.show_mol(show_Lewis=True, show_n=True)
