from math import sqrt as raiz_cuadrada
print(raiz_cuadrada(144))

from matplotlib import pyplot as plt 
x = [n for n in range(-4,5)]
print(x)
y = [n**2 for n in x]
print(y)
plt.plot(x,y)
plt.show()
