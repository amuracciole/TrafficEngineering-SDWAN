import numpy as np
import matplotlib.pyplot as plt
import time

x = []
y = []
file = open("/home/upm/Desktop/TFM/Data_short.txt", "r")
for line in file:
    data = line.split(',')
    x.append(float(data[0]))
    y.append(float(data[1]))
    
# Creating a numpy array
X = np.array(x)
Y = np.array(y)

plt.figure(1)
plt.title("Bandwidth short-path")
plt.xlabel("Tiempo (Seg.)")
plt.ylabel("Bandwidth (Kbps)")
plt.plot(X,Y)
plt.show()
