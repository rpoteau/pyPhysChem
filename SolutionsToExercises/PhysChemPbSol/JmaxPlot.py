
# it is first necessary to lambdify the Jmax_ sympy function,
# and to substitute the symbols of the physical constants with their numerical value
Jmax = sp.lambdify([Bbar_, T_], Jmax_.subs({kB_:kB, h_: h, c_:c}) )

t4pPC.centerTitle("Question 1")
rt = 298.15 #Kelvin
Bbar = 0.20286*100 #cm-1 to m-1
print(f"Jmax ≈ {Jmax(Bbar,rt):.0f}")

t4pPC.centerTitle("Question 2")
T = np.linspace(0,1000,1001)
plt.plot(T,Jmax(Bbar,T))
plt.xlabel("T / K")
plt.ylabel("$J_\mathrm{max}$")
plt.show()
