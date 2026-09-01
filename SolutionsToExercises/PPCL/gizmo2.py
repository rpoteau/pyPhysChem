
from matplotlib import pyplot as plt
import numpy as np

# 'banana' is the argument name — known only INSIDE the function
def h(banana):
    return banana**2

# OUTSIDE, the data has a completely different name — that's fine
gizmo = np.linspace(-2, 2, 8)
plt.plot(gizmo, h(gizmo), marker="D")     # gizmo is passed in; inside h it becomes 'banana'; # marker="D" -> diamond-shaped markers
plt.xlabel("gizmo")
plt.ylabel("h(gizmo)")
plt.show()

