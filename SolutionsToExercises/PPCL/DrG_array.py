import numpy as np #np is now a shortcut for numpy

#Q1
K = [0.05, 0.1, 0.5, 1, 5, 10, 30, 50, 100, 500, 1000] # we first define a list with various values of the equilibrium constant
K = np.array(K) # the list is converted into a numpy array

#Q2
print(DrG(K,25)) # DrG returns an array 
