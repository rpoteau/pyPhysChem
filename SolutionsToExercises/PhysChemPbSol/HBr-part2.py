
t4pPC.centerTitle("R_eq equation")
hbar_, mu_, Req_ = sp.symbols('hbar, mu, R_eq')
I1 = hbar_ / (4*sp.pi*c_*Bbar_)
display(I1)
I2 = mu_ * Req_**2
display(I2)
Req_ = sp.solve(sp.Eq(I1,I2),Req_)[1]
display(Req_)

print()
t4pPC.centerTitle("Reduced mass")
def muAB(mA,mB):
    return mA*mB/(mA+mB)
muHBr = muAB(m1H,m79Br)
print(f"Reduced mass = {muHBr} u = {muHBr*u2kg} kg")

print()
t4pPC.centerTitle("Equilibrium bond length")
BbarHBr = 16.702/2 #cm-1
BbarHBr = BbarHBr*100 #cm-1 to m-1
Req = Req_.subs({hbar_:hbar, Bbar_: BbarHBr, c_:c, mu_:muHBr*u2kg, sp.pi:np.pi})
print(f"Req(HBr) = {Req:.3e} m = {Req*1e12:.1f} pm ")
