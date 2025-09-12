print("C#O ne correspond pas aux symboles de Lewis neutres de C et O,\nmais aux symboles de Lewis chargés [C-] (trivalent) & [O+] (trivalent)")
CO = easy_rdkit("[C-]#[O+]")
CO.show_mol(show_Lewis=True)
