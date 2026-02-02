from scipy import stats
import numpy as np

# Given data
x_bar = 485        # sample mean
mu0 = 500          # claimed mean
sigma = 60         # population std deviation
n = 36             # sample size
alpha = 0.05       # significance level

# Z-test statistic
z_cal = (x_bar - mu0) / (sigma / np.sqrt(n))

# Critical value for left-tailed test
z_crit = stats.norm.ppf(alpha)

# Decision
print("Calculated Z value:", z_cal)
print("Critical Z value:", z_crit)

if z_cal <= z_crit:
    print("Reject H0: Manufacturer's claim is not valid")
else:
    print("Fail to reject H0: Manufacturer's claim is accepted")