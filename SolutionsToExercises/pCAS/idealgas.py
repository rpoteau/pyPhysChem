import scipy.constants as sc
_R = sc.value("molar gas constant")
_sR = sc.precision("molar gas constant")
Runit = sc.unit("molar gas constant")
print(f"R = {_R} ± {_sR} {Runit}")

p, V, n, R, T = sp.symbols('p, V, n, R, T', positive=True, real=True)
V = sp.solve(sp.Eq(p*V,n*R*T),V)
V
V = V[0]
V

atm2Pa = sc.value("standard atmosphere")
atm2Pa
_p = [1, 2, 10, 100]
for _pi in _p: 
    Vi = V.subs({n: 1, T: 273.15, p: _pi*atm2Pa, R: _R})
    print(f"p = {_pi} bar = {_pi*1e5} Pa → V = {Vi*1e3:.3f} L")
