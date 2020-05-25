import numpy as np
import matplotlib.pyplot as plt
import time

x = []
y = []
z = []
file = open("/Users/andresmuracciole/Desktop/MI_CARPETA/MASTER/TFM/Git/TFM/Data_long.txt", "r")
for line in file:
    data = line.split(',')
    x.append(float(data[0]))
    y.append(float(data[1]))
    z.append(float(data[2]))
    
# Creating a numpy array
X = np.array(x)
Y = np.array(y)
Z = np.array(z)

plt.figure(2)
plt.title("Bandwidth long-path")
plt.xlabel("Tiempo (Seg.)")
plt.ylabel("Bandwidth (Kbps)")
plt.plot(X,Y, color="red")
plt.plot(X,Z, color="green", linestyle="--")
plt.show()
