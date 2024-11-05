ascorbic = Chem.MolFromSmiles('C(C(C1C(=C(C(=O)O1)O)O)O)O')
ascorbic

ascorbicCan = Chem.MolToSmiles(ascorbic) #it is a string at this step
ascorbicCan = Chem.MolFromSmiles(ascorbicCan) #converts the string as an RDKit mol object
from rdkit.Chem import rdFingerprintGenerator
mfpgen = rdFingerprintGenerator.GetMorganGenerator(radius=3,fpSize=2048,includeChirality=True)

ascorbicFP = mfpgen.GetFingerprint(ascorbicCan)
ascorbicFPL = ascorbicFP.ToList()

plt.figure(figsize=(10,1))
plt.vlines(
    [i for i, fp in enumerate(ascorbicFPL) if fp > 0.5], ymin=0, ymax=1
)
plt.xlabel("bit index")
plt.show()
