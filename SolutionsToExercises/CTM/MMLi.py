print("## Question 1")
M6 = 6.0151223
M7 = 7.0160040
p6 = 7.59
p7 = 92.41

M = (p6*M6 + p7*M7)/100
print(M)

print()
print("## Question 2")
from sigfig import round
print("masse du lithium naturel = ",round(M,4,format="Drake"),"g/mol")
