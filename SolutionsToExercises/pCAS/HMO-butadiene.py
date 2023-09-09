alpha = sp.symbols('alpha', negative=True)
beta = sp.symbols('beta', negative=True)
H = sp.Matrix([[alpha,  beta,     0,     0],
               [ beta, alpha,  beta,     0],
               [    0,  beta, alpha,  beta],
               [    0,     0,  beta, alpha],
               ])
H

P, D = H.diagonalize(sort=True, normalize=True)
t4p.centertxt("eigenvalues",size=14)
D
D.evalf(3)
# eigenvalues are not sorted!!???
t4p.centertxt("eigenvectors",size=14)
P
P.applyfunc(sp.simplify)
P.evalf(3)

alpha.assumptions0
alpha = sp.symbols('alpha', negative=True, real=True, zero=False, infinite=False)
beta = sp.symbols('beta', negative=True, real=True, zero=False, infinite=False)
H = sp.Matrix([[alpha,  beta,     0,     0],
               [ beta, alpha,  beta,     0],
               [    0,  beta, alpha,  beta],
               [    0,     0,  beta, alpha],
               ])
P, D = H.diagonalize(sort=True)
t4p.centertxt("eigenvalues after extended assumptions",size=14)
H
D.evalf(3)
# eigenvalues are still not sorted!!???
#Even the e2Lists tool returns an error ("cannot determine truth value of Relational"). Uncomment the next lines if you want to "play" with it

# t4p.centertxt("eigenvectors function",size=14)
# alpha = sp.symbols('alpha', negative=True)
# beta = sp.symbols('beta', negative=True)
# H = sp.Matrix([[alpha,  beta,     0,     0],
#                [ beta, alpha,  beta,     0],
#                [    0,  beta, alpha,  beta],
#                [    0,     0,  beta, alpha],
#                ])
# H

# MO = H.eigenvects()
# P,D = t4p.e2Lists(MO,sort=True)
# P
# D
