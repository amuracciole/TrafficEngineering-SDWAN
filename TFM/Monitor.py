#!/usr/bin/python

import subprocess
import csv
import time
from os import remove

bw_long_path_1 = 0
bw_long_path_2 = 0
bw_long_path_3 = 0
bw_short_path_1 = 0
bw_short_path_2 = 0
bw_short_path_3 = 0
i=0
secure = 1
secure_delete = 1
bw_max = 100000
bw_lim = 65000

remove("/home/upm/Desktop/TFM/Data_long.txt")
file = open("/home/upm/Desktop/TFM/Data_long.txt", "a")

remove("/home/upm/Desktop/TFM/Data_short.txt")
file = open("/home/upm/Desktop/TFM/Data_short.txt", "a")

while (True):
    bw_long_path_3 = bw_long_path_2
    bw_long_path_2 = bw_long_path_1
    bw_short_path_3 = bw_short_path_2
    bw_short_path_2 = bw_short_path_1
    with open('/home/upm/Desktop/TFM/Table.csv', 'r') as file:
        reader = csv.reader(file)
        for row in reader:
            #print(row)
            if (row[1] == 'a00' and row[2] == "2"):
                f_long = row[3]
                bw_long_path_1 = float(f_long)
            if (row[1] == 'a00' and row[2] == "1"):
                f_short = row[3]
                bw_short_path_1 = float(f_short)
   
    bw_long_path_prom = (bw_long_path_3 + bw_long_path_2 + bw_long_path_1)/3
    bw_short_path_prom = (bw_short_path_3 + bw_short_path_2 + bw_short_path_1)/3

    file = open("/home/upm/Desktop/TFM/Data_long.txt", "a")
    file.write(str(i) + "," + str("{:.2f}".format(bw_long_path_prom)) + "," + str(bw_lim) + "," + str(bw_max))
    file.write("\n")

    file = open("/home/upm/Desktop/TFM/Data_short.txt", "a")
    file.write(str(i) + "," + str("{:.2f}".format(bw_short_path_prom)) + "," + str(bw_lim) + "," + str(bw_max))
    file.write("\n")

    i = i + 10
    
    print ("LONG_PATH (CONM_A - CONM_B - CONM_D - CONM_E):")
    print ("    Bandwidth: " + str("{:.2f}".format(bw_long_path_prom)) + " Kbps")
    print ("    % libre (Prom. ultimos 30 seg.): " + str("{:.4f}".format(100 - bw_long_path_prom/1000)) + "%")
    print()

    print ("SHORT_PATH (CONM_A - CONM_C - CONM_E):")
    print ("    Bandwidth: " + str("{:.2f}".format(bw_short_path_prom)) + " Kbps")
    print ("    % libre (Prom. ultimos 30 seg.): " + str("{:.4f}".format(100 - bw_short_path_prom/1000)) + "%")
    print ()

#Protocolos sensibles: SSH, FTP, TFTP, voip, 
    if (bw_short_path_prom > bw_lim):
        #print ("Menos del 35 libre")
        if (secure_delete == 1):
            subprocess.call("/home/upm/Desktop/TFM/Sensible_traffic_short_path.sh 35000", shell=True)
            subprocess.call("/home/upm/Desktop/TFM/All_ARP_long_path.sh", shell=True)
            subprocess.call("/home/upm/Desktop/TFM/All_IP_long_path.sh", shell=True)
            secure_delete = 0
            secure = 0
    else:
        #print ("Mas del 35 libre")
        if (secure == 0):
            subprocess.call("/home/upm/Desktop/TFM/Sensible_traffic_short_path_delete.sh 35000", shell=True)
            subprocess.call("/home/upm/Desktop/TFM/All_ARP_short_path.sh", shell=True)
            subprocess.call("/home/upm/Desktop/TFM/All_IP_short_path.sh", shell=True)
            secure_delete = 1
            secure = 1

    time.sleep(10)
