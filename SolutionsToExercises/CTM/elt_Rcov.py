print("## Question 1")
from matplotlib import pyplot as plt
Z = tp.elements["atomic_number"]
Rat = tp.elements["covalent_radius_pyykko"]
color = tp.elements["color"]

cm2i = 1/2.54
fig, ax = plt.subplots(figsize=(30*cm2i,12*cm2i))
xticks=[2,10,18,36,54,86,118]
ax.set_xticks(xticks)
plt.grid(color='r', linestyle='--', linewidth=0.5, axis="x")

plt.scatter(Z,Rat,marker="o",c=color)
plt.plot(Z,Rat,linewidth=0.5)
plt.xlabel("Numéro atomique (Z)")
plt.ylabel("Rayon covalent / pm")
plt.show()
