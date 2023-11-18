from matplotlib import pyplot as plt 

# x = [-4, -3, -2, -1, 0, 1, 2, 3, 4]
x = [n for n in range(-4,5)]
y = [n**2 for n in x]
print(x)
print(y)

plt.plot(x,y)
plt.show()
