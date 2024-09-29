from mendeleev import element

print("# Question 1")
X = element("Al")
print("CEF de Al =",X.ec,"=",X.econf,"  ",X.ec.unpaired_electrons(),"électron(s) célibataire(s). (Z=",X.atomic_number,")")
X = element("Ca")
print("CEF de Ca =",X.ec,"=",X.econf,"  ",X.ec.unpaired_electrons(),"électron(s) célibataire(s). (Z=",X.atomic_number,")")
X = element("Sc")
print("CEF de Sc =",X.ec,"=",X.econf,"  ",X.ec.unpaired_electrons(),"électron(s) célibataire(s). (Z=",X.atomic_number,")")
X = element("Cr")
print("CEF de Cr =",X.ec,"=",X.econf,"  ",X.ec.unpaired_electrons(),"électron(s) célibataire(s). (Z=",X.atomic_number,")")

print()
print("# Question 2")
X = element("Au")
print("État(s) d'oxydation le(s) plus courant(s) de Au =",X.oxistates)
print("CEF de Au =",X.ec,"=",X.econf,"  ",X.ec.unpaired_electrons(),"électron(s) célibataire(s). (Z=",X.atomic_number,")")
print("CEF de Au3+ =",X.ec.ionize(3),"  ",X.ec.ionize(3).unpaired_electrons(),"électron(s) célibataire(s). (Z=",X.atomic_number,")")
