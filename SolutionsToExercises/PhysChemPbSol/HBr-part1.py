
t4pPC.centerTitle("Atomic masses setup")
m1H = mm.ELEMENTS["H"].isotopes[1].mass
m79Br = mm.ELEMENTS["Br"].isotopes[79].mass
print(f"Mass of   1H = {m1H} u")
print(f"Mass of 79Br = {m79Br} u")

print()
t4pPC.centerTitle("F_J Equation")
kB_, T_, h_, c_, Bbar_, J_ = sp.symbols('k_B, T, h, c, Bbar, J')

# Q2
def EJ_(J_):
    return J_*(J_+1)*h_*c_*Bbar_
display(EJ_(J_))

def FJ_(J_):
    return EJ_(J_)/(h_*c_)
display(FJ_(J_))

t4pPC.centerTitle("Delta nubar Equation")
nubar_J_Jplus1_ = sp.simplify(FJ_(J_+1) - FJ_(J_))
nubar_Jplus1_Jplus2_ = sp.simplify(FJ_(J_+2) - FJ_(J_+1))

DeltaNuBar_ = sp.simplify(nubar_Jplus1_Jplus2_ - nubar_J_Jplus1_)
display(nubar_J_Jplus1_)
display(nubar_Jplus1_Jplus2_)
display(DeltaNuBar_)
