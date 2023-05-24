def DrG(K,t):
    # this is a docstring
    """
    This function returns the standard change in free energy of a reaction, ΔrG°
    
    input:
        - K = equilibrium constant
        - t = temperature in Celsius
    output:
        - ΔrG° in J K-1 mol-1
    prints/saves: nothing
    """ #end of the docstring
    import numpy as np
    import scipy.constants as sc
    R = sc.value("molar gas constant") #the sc.unit("molar gas constant") command previously applied let us know that it is defined in the SI
    C2K = sc.zero_Celsius
    T = C2K + t
    return -R*T*np.log(K)

CP = 0.0165 #as concentration of product
CR = 0.0417 #as concentration of reactant
K = CP**2/CR
print(f"K = {K:.4}  DeltaG = {DrG(K,25):.4}")
