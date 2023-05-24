import numpy as np
#very basic (ugly) calculator way
# Question 1
0.0165**2/0.0417
# Question 2 (the values for R and for 0.0165**2/0.0417 are cut and pasted in the next line)
-8.31446261815324*298.15*np.log(0.0065287769784172665)

#basic algorithmic way
# Question 1
CP = 0.0165 #as concentration of product
CR = 0.0417 #as concentration of reactant
K = CP**2/CR
# Question 2
R = 8.31446261815324 # J K−1 mol−1
T = C2K + 25
DG = -R*T*math.log(K)
print(K, DG)
