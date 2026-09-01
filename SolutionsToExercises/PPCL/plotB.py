with open('MiscData/MysteryCurve.dat') as f:
    for _ in range(10):
        print(f.readline(), end='')


from matplotlib import pyplot as plt
%matplotlib widget
import numpy as np
import pandas as pd

t4pPC.centertxt("6a. Load MysteryCurve.dat with genfromtxt and plot it (solid red line)", size=12, weight="bold")
a, b = np.genfromtxt('MiscData/MysteryCurve.dat', unpack=True, delimiter=",")
%matplotlib widget
plt.plot(a, b, color='red')
plt.show()

t4pPC.centertxt("6b. Load MysteryCurve.dat with read_csv and plot it (solid red line)", size=12, weight="bold")
MC = pd.read_csv('MiscData/MysteryCurve.dat')
display(MC)
%matplotlib widget
plt.plot(MC["x"], MC["y"], color='red')
plt.show()
