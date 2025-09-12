from rdkit import Chem
from rdkit.Chem import Draw
from IPython.display import display

mol = Chem.MolFromSmiles("CC1=C(C(CCC1)(C)C)/C=C/C(=C/C=C/C(=C/C=O)/C)/C")
img = Draw.MolToImage(mol, size=(700,300))
display(img)
