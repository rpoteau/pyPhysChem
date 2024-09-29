from sigfig import round

print("## Question 1")

# .1416 : 5 cs
print(round(12.876782320,5))
# 0.000056 : 2 cs
print(round(125678.000034,2))
# on peut préférer une notation scientifique
print(round(125678.000034,2,notation='scientific'))

print()
print("## Question 2")
print(round(0.006738,3))
print(round(43.715e5,4,notation='scientific'))

print()
print("## Question 3.Python et son module sigfig ne peuvent pas vous assister. C'est à vous de connaître la gestion des chiffres significatifs")

print(round(1.2e2 * 2.5, 2),"W") #P=UI
print(round(0.288 / 0.4,1),"g cm-3")
print(round(10.8 + 0.125 + 4.25,decimals=1),"g")
print(round(1.5e3 - 3e2,decimals=1),"mL")
