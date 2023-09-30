
# add explicit H atoms
ascorbicIsoH = Chem.AddHs(ascorbicIso)
ascorbicIsoH

# ETKDG method applied to clean the molecule
AllChem.EmbedMolecule(ascorbicIsoH)
ascorbicIsoH

# print the mol3D code
print(Chem.MolToMolBlock(ascorbicIsoH))

# visualize the 3D representation of vitamin C with JSMol
JSMol = JsmolView(
    layout=Layout(height="300px", width="300px"), 
    info={'color':'#e2e2e2'}
)
display(JSMol)
JSMol.load_str(str(Chem.MolToMolBlock(ascorbicIsoH)))