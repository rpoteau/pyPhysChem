# ============================================================
# Short integration exercises
# ============================================================
# t4pPC.centertxt(...) is a helper from pyphyschemtools: it displays a centered,
# styled title to separate the answers.

from matplotlib import pyplot as plt
import numpy as np
from scipy.integrate import quad, simpson

# 1. Integrate an analytical function f(x) = exp(3x^2 + 1) between 1 and 2 -> quad
t4pPC.centertxt("1. quad on f(x) = exp(3x^2 + 1), from 1 to 2", size=12, weight="bold")

def f(x):
    return np.exp(3*x**2 + 1)

I, err = quad(f, a=1, b=2)
print(f"integral        = {I:.6f}")
print(f"error estimate  = {err:.1e}")

x = np.linspace(1, 2, 100)
plt.plot(x, f(x))
plt.axhline(0, ls="--", color='red')
plt.show()

# 2. Integrate g(t, A, B) = cos(A t + B) with A=2, B=3, t in [3.5, 6] -> quad + args
t4pPC.centertxt("2. quad on g(t) = cos(At + B), A=2, B=3, from 3.5 to 6", size=12, weight="bold")

def g(t, A, B):
    return np.cos(A*t + B)

I, err = quad(g, a=3.5, b=6, args=(2, 3))
print(f"integral        = {I:.6f}")
print(f"error estimate  = {err:.1e}")

t = np.linspace(3.5, 6, 100)
plt.plot(t, g(t, 2, 3))
plt.axhline(0, ls="--", color='red')
plt.show()

# 3. Integrate sampled data (x, h) -> simpson
t4pPC.centertxt("3. simpson on sampled data points", size=12, weight="bold")
x = [3, 4, 5, 6, 8, 10]
h = [1, 2, 3.6, 0.4, -2, 6]
plt.plot(x, h, marker="o")
plt.axhline(0, ls="--", color='red')
plt.show()

A = simpson(h, x=x)
print(f"area under the curve = {A:.4f}")
