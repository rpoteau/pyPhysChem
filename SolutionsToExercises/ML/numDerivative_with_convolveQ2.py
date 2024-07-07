K = [1,0,-1]

h = np.convolve(f,K,'same')
plt.plot(x, h,marker='x',label='convolved f')
plt.legend()
plt.show()
