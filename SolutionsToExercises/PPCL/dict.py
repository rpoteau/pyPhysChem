Tb = {"water": 100.0, "ethanol": 78.4, "acetone": 56.0, "toluene": 110.6}

# 1. look up by name
print(Tb["ethanol"])                 # -> 78.4

# 2. add a new entry
Tb["methanol"] = 64.7
print(Tb)

# 3. loop and convert to kelvin
for name, t_celsius in Tb.items():
    print(f"{name} -> {t_celsius + 273.15:.2f} K")
