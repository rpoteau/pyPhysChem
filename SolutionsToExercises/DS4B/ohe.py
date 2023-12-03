dfi_ohe=dfi.copy()
def ohe(sp):
    p = [(1,0,0),(0,1,0),(0,0,1)] # 3 tuples, for setosa, versicolor, virginica
    if (sp.iloc[0] == 'setosa'):
        return p[0]
    elif (sp.iloc[0] == 'versicolor'):
        return p[1]
    elif (sp.iloc[0] == 'virginica'):
        return p[2]
    else:
        return None
        
dfi_ohe["Probability"] = dfi_ohe[["species"]].apply(ohe, axis=1)
dfi_ohe
