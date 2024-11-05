peakG = [3.0]
wG = 1.0
peakL = [1.0]
wL = 0.5

x = np.linspace(-3,7,3000)

yG = sum_signals(x, peakG, wG, 'Gaussian')
_ = plt.plot(x,yG,label=f"Gaussian. Width={wG}")
yL = sum_signals(x, peakL, wL, 'Lorentzian')
_ = plt.plot(x,yL,label=f"Lorentzian. Width={wL}")
_ = plt.legend()
_ = plt.xlim(-1,5)
_ = plt.show()
from scipy.integrate import simpson
print(f"Gaussian. Integral = {simpson(yG,x=x)}")
print(f"Lorentzian. Integral = {simpson(yL,x=x)}")

print()
print(f"{fg.GREEN}You can check visually that The full width at half maximum (FWHM) is actually {wG} for G(x) and {wL} for L(x){fg.OFF}")
print()
print(f"{fg.RED}The integral of the Lorentzian function is not exactly equal to 1 because the linspace \n"
        f"is not large enough for the L(x) function that has a slower decay than the G(x) function{fg.OFF}")
