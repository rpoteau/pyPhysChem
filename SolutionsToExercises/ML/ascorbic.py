
# the SMILES and isomeric SMILES code were copied from the PubChem website
ascorbic = Chem.MolFromSmiles('C(C(C1C(=C(C(=O)O1)O)O)O)O')
ascorbic
ascorbicIso = Chem.MolFromSmiles('C([C@@H]([C@@H]1C(=C(C(=O)O1)O)O)O)O')
ascorbicIso