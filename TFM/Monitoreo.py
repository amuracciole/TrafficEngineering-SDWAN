import csv
import time

bw_long_path_1 = 0
bw_long_path_2 = 0
bw_long_path_3 = 0
bw_short_path_1 = 0
bw_short_path_2 = 0
bw_short_path_3 = 0

while (True):
    bw_long_path_3 = bw_long_path_2
    bw_long_path_2 = bw_long_path_1
    bw_short_path_3 = bw_short_path_2
    bw_short_path_2 = bw_short_path_1
    with open('/home/upm/Desktop/TFM/Tabla.csv', 'r') as file:
        reader = csv.reader(file)
        for row in reader:
            #print(row)
            if (row[1] == 'a00' and row[2] == "2"):
                f_long = row[3]
                bw_long_path_1 = float(f_long)
            if (row[1] == 'a00' and row[2] == "1"):
                f_short = row[3]
                bw_short_path_1 = float(f_short)
   
    bw_long_path_prom =  100000 - (bw_long_path_3 + bw_long_path_2 + bw_long_path_1)/3
    bw_short_path_prom =  100000 - (bw_short_path_3 + bw_short_path_2 + bw_short_path_1)/3
    
    print ("LONG_PATH (CONM_A - CONM_B - CONM_D - CONM_E):")
    print ("    Bandwidth: " + str("{:.2f}".format(bw_long_path_prom)) + " Mbps")
    print ("    % del total libre: " + str("{:.2f}".format(100 - bw_long_path_prom/1000)) + "%")
    print()

    print ("SHORT_PATH (CONM_A - CONM_C - CONM_E):")
    print ("    Bandwidth: " + str("{:.2f}".format(bw_short_path_prom)) + " Mbps")
    print ("    % del total libre: " + str("{:.2f}".format(100 - bw_short_path_prom/1000)) + "%")
    print ()

    #if (bw_long_path_prom < 50000):
    #    print ("menor que el 50 del total")
    #else:
    #    print ("mayor que el 50 del total")

    time.sleep(10)
