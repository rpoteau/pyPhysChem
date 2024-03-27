#Q6
T_extrap = np.array([273.15, 400]) #Two values is enough for a line, isn't it?
kfit_extrap = kArr(T_extrap,A,Ea) # a new kfit_extrap array is created, with k calculated for each temperature. Again, this is a strong advantage of the numpy library
RTinv_extrap = 1/(R*T_extrap) # ln(k) will be plotted as a function of 1/RT (ln(k) = -E_a/RT + ln(A))

plt.figure(figsize=(12,8))
plt.plot(RTinv, np.log(kexp), color='r', linestyle='', marker="o", markersize=14, label="exp. values")
plt.plot(RTinv, np.log(kfit), color='b', linestyle='', marker="X", markersize=14, label="fitted values (linear regression)")
plt.plot(RTinv_extrap, np.log(kfit_extrap), color='b', linestyle='-', marker="", markersize=14, label="fitted values (linear regression)")
plt.xlabel('1/RT / mol.J-1',size=14,fontweight='bold',color='blue')
plt.ylabel('ln(k)',size=14,fontweight='bold',color='blue')
plt.xticks(fontsize=16,fontweight='bold')
plt.yticks(fontsize=16,fontweight='bold')
plt.legend()
plt.show()
