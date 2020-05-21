#Archivo que guarda los valores del long path
import csv
import time

bw_long_path_1 = 0
i = 0

while (True):
    with open('/home/upm/Desktop/TFM/Tabla.csv', 'r') as file:
        reader = csv.reader(file)
        for row in reader:
            #print(row)
            if (row[1] == 'a00' and row[2] == "1"):
                f_long = row[3]
                bw_long_path_1 = float(f_long)
    file = open("/home/upm/Desktop/TFM/Data_short.txt", "a")
    file.write(str(i) + "," + str("{:.2f}".format(bw_long_path_1/1000)))
    file.write("\n")
    i = i + 1           
    time.sleep(5)
