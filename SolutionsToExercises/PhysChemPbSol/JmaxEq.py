
t4pPC.centerTitle("Question 1")
kB_, T_, h_, c_, Bbar_, J_ = sp.symbols('k_B, T, h, c, Bbar, J')

EJ_ = J_*(J_+1)*h_*c_*Bbar_
display(EJ_)

PJ_ = (2*J_+1)*sp.exp(-EJ_/(kB_*T_))
display(PJ_)

t4pPC.centerTitle("Question 2")
eq_ = sp.diff(PJ_, J_)
display(eq_)

sol_ = sp.solve(eq_,J_)
display(sol_)

Jmax_ = sol_[1]
display(Jmax_)

