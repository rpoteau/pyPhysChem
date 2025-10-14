N = 100
x = np.linspace(-2.*np.pi,2*np.pi,N)
f = np.sin(x)
fprime = np.cos(x)
plt.plot(x, f,marker='o',label='$f(x) = \sin(x)$')
plt.plot(x, fprime,marker='x',label='$f\'(x) = \cos(x)$')
plt.legend()
plt.show()
