import matplotlib.pyplot as plt

observed_rolls = [4, 6, 6, 6, 2, 2, 1, 6, 6, 6, 1, 6, 6, 3, 2, 2, 4, 6, 5, 3, 6, 2, 3, 4, 5, 6, 2, 6, 6, 1, 6, 2, 1, 6, 6, 6, 4, 1, 6, 5, 2, 5, 1, 6, 3, 6, 4, 6, 6, 2]

# Step 1: Define hypotheses and priors
hypotheses = ['fair', 'loaded1']
priors = {'fair': 0.5, 'loaded1': 0.5}

# Step 2: Define likelihood function
def likelihood(roll, hypothesis):
    if hypothesis == 'fair':
        return 1/6
    elif hypothesis == 'loaded1':
        return 0.5 if roll == 1 else 0.5 / 5

# Step 3: Function to update priors after a single observation. Same as previous problem

# Step 4: Run sequential updating
posteriors = [priors]
current = priors.copy()
print(f"  0.         ; current = {{ {', '.join(f'{k}: {v:.2f}' for k, v in current.items())} }}")

for i, roll in enumerate(observed_rolls):
    current = update(current, roll)
    print(f"{i+1:3d}. Roll = {roll}; current = {{ {', '.join(f'{k}: {v:.2f}' for k, v in current.items())} }}")
    posteriors.append(current)

# Step 5: Extract sequences for plotting
p_fair = [p['fair'] for p in posteriors]
p_loaded = [p['loaded1'] for p in posteriors]

# Step 7: Plot
plt.plot(p_fair, marker='o',label="P(fair | data)")
plt.plot(p_loaded, marker='d',label="P(loaded toward 1| data)")
plt.xlabel("Number of rolls")
plt.ylabel("Posterior probability")
plt.title("Bayesian updating after each die roll")
plt.legend()
plt.grid(True)
plt.show()

