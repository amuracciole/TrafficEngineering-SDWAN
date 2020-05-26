import numpy as np
import matplotlib.pyplot as plt
import time

x = []
y = []
z = []
file = open("/home/upm/Desktop/TFM/Data_short.txt", "r")
for line in file:
    data = line.split(',')
    x.append(float(data[0]))
    y.append(float(data[1]))
    z.append(float(data[2]))
    
# Creating a numpy array
X = np.array(x)
Y = np.array(y)
Z = np.array(z)

plt.figure(1)
plt.title("Bandwidth short-path")
plt.xlabel("Time (Seg.)")
plt.ylabel("Bandwidth (Kbps)")
plt.plot(X,Y, color="blue")
plt.plot(X,Z, color="red", linestyle="--")
plt.show()
