print("## Question 1")
M1 = 10.0129
M2 = 11.0093
M = 10.8110

import numpy as np

A = np.array([
             [M1,M2],
             [1,1]
             ])
y = np.array([M,1])
print(A)
print()
print(y)
p = np.linalg.solve(A, y)
print()
print(p*100)

print()
print("## Question 2")
from sigfig import round
p1 = round(100*p[0],4,format="Drake")
p2 = round(100*p[1],4,format="Drake")
print("p1 =",p1)
print("p2 =",p2)
