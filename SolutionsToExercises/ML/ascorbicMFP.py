
ascorbicCan = Chem.MolToSmiles(ascorbic) #it is a string at this step
ascorbicCan = Chem.MolFromSmiles(ascorbicCan) #converts the string as an RDKit mol object
ascorbicFP = AllChem.GetMorganFingerprintAsBitVect(ascorbicCan, radius=2, nBits=2048)
ascorbicFPL = ascorbicFP.ToList()

plt.figure(figsize=(10,1))
plt.vlines(
    [i for i, fp in enumerate(ascorbicFPL) if fp > 0.5], ymin=0, ymax=1
)
plt.xlabel("bit index")
plt.show()