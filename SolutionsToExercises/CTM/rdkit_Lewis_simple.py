smiles = ["O", "N", "O=O", "B(F)(F)(F)", "O=C=O", "S(F)(F)(F)(F)(F)(F)","[CH3][Mg][I]"]
for s in smiles:
    mol = easy_rdkit(s)
    mol.show_mol(show_Lewis=True)
