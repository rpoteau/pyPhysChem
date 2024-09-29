import sympy as sym
p1,p2 = sym.symbols('p1,p2')
M1,M2,M = sym.symbols('M1,M2,M')
eq1 = sym.Eq(p1*M1+p2*M2,M)
eq2 = sym.Eq(p1+p2,1)
sol = sym.solve([eq1,eq2],(p1,p2))
print(sol)
print(sol[p1])
print(sol[p2])

sol[p1]
sol[p2]

print()
M1_ = 10.0129
M2_ = 11.0093
M_ = 10.8110

p1_ = sol[p1].subs({M1:M1_, M2: M2_, M: M_})
p2_ = sol[p2].subs({M1:M1_, M2: M2_, M: M_})
print("p1 = ",p1_)
print("p2 = ",p2_)

print()
p1_ = round(100*p1_,4,format="Drake")
p2_ = round(100*p2_,4,format="Drake")
print("p1 = ",p1_)
print("p2 = ",p2_)
