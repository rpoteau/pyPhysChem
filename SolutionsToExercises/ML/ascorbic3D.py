
ascorbicIso=Chem.MolFromSmiles('C([C@@H]([C@@H]1C(=C(C(=O)O1)O)O)O)O')

# add explicit H atoms
ascorbicIsoH = Chem.AddHs(ascorbicIso)
ascorbicIsoH

# ETKDG method applied to clean the molecule
AllChem.EmbedMolecule(ascorbicIsoH)
ascorbicIsoH

# print the mol3D code
print(Chem.MolToMolBlock(ascorbicIsoH))

# visualize the 3D representation of vitamin C with py3Dmol
mv = molView(Chem.MolToMolBlock(ascorbicIsoH),'mol')
