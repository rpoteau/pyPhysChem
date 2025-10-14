deltax = x[1]-x[0]
print(deltax)
K = [1,0,-1]/(2*deltax)

h = np.convolve(f,K,'same')
plt.plot(x, h,marker='x',label='convolved f')
plt.axhline(1,linestyle='--',color='r',linewidth=0.5)
plt.axhline(-1,linestyle='--',color='r',linewidth=0.5)
plt.legend()
plt.show()