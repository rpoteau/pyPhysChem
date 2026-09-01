from matplotlib import pyplot as plt
%matplotlib inline
import numpy as np

t4pPC.centertxt("1. sin(x) between 0 and 2pi", size=12, weight="bold")
x = np.linspace(0, 2*np.pi, 1000)
plt.plot(x, np.sin(x))
plt.show()

t4pPC.centertxt("2. exp(x) between -1 and 1, dashed line", size=12, weight="bold")
x = np.linspace(-1, 1, 1000)
plt.plot(x, np.exp(x), ls='--') #ls = shortcut for linestyle
plt.show()

t4pPC.centertxt("3. sin(x)/x between -pi and pi, red curve", size=12, weight="bold")
x = np.linspace(-np.pi, np.pi, 1000)
plt.plot(x, np.sin(x)/x, color='r')
plt.show()

t4pPC.centertxt("4. x^4 ln(x) between 1 and 10, with axis labels", size=12, weight="bold")
x = np.linspace(1, 10, 1000)
plt.plot(x, x**4*np.log(x))
plt.xlabel("x")
plt.ylabel("value")
plt.show()

t4pPC.centertxt("5. sin(x) and cos(x) on the same figure, with legend", size=12, weight="bold")
x = np.linspace(-np.pi, np.pi, 1000)
plt.plot(x, np.sin(x), color='b', label='sin(x)')
plt.plot(x, np.cos(x), color='g', label='cos(x)')
plt.legend()
plt.show()
