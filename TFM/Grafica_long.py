import numpy as np
import matplotlib.pyplot as plt
import time

x = []
y = []
file = open("/home/upm/Desktop/TFM/Data_long.txt", "r")
for line in file:
    data = line.split(',')
    x.append(float(data[0]))
    y.append(float(data[1]))
    
# Creating a numpy array
X = np.array(x)
Y = np.array(y)

plt.figure(2)
plt.plot(X,Y)
plt.show()
