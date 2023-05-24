import numpy as np
#Q1
Texp = np.array([283,293,308,318])
kexp = np.array([0.13,0.29,0.45,0.70])

#Q2
import scipy.constants as sc
R = sc.value("molar gas constant")
RTinv = 1/(R*Texp)
lnk = np.log(kexp)

import matplotlib.pyplot as plt
#this sets the figure size
plt.figure(figsize=(12,8))

# plot the points 
plt.plot(RTinv, lnk, color='r', linewidth=3, marker="o")

# name the x and y axis
plt.xlabel('1/RT / mol.J-1',size=14,fontweight='bold',color='blue')
plt.ylabel('ln(k)',size=14,fontweight='bold',color='blue')
# set tick labels font size
plt.xticks(fontsize=16,fontweight='bold')
plt.yticks(fontsize=16,fontweight='bold')
plt.show()

# The experimental uncertainty involves that the 4 couples are not perfectly aligned
# Let's redo the plot with only markers and no connecting line
plt.figure(figsize=(12,8))
plt.plot(RTinv, lnk, color='r', linestyle='', marker="o", markersize=14)
plt.xlabel('1/RT / mol.J-1',size=14,fontweight='bold',color='blue')
plt.ylabel('ln(k)',size=14,fontweight='bold',color='blue')
plt.xticks(fontsize=16,fontweight='bold')
plt.yticks(fontsize=16,fontweight='bold')
plt.show()
#that's better. Now it's time to fit the data
