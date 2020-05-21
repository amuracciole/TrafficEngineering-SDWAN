#!/bin/bash

echo "\n---> Levantar controlador <---"
cd /home/upm/ryu/ryu/app

##FUNCIONA - Multipath (sin meidores de BW, PL y DL - Con rest## 
#ryu-manager --observe-links ryu_multipath_OK.py ryu.app.gui_topology.gui_topology

##FUNCIONA
ryu-manager ryu.app.gui_topology.gui_topology ./network_awareness2/shortest_forwarding.py --observe-links --k-paths=2  --weight=bw

#ryu-manager ryu.app.gui_topology.gui_topology ./flowmanager-master/flowmanager.py ./network_awareness2/shortest_forwarding.py --observe-links --k-paths=2  --weight=bw



## Simlpe monitor con qos (minpro) con rest
##FUNCIONA##
#ryu-manager simple_monitor_13_modify2.py ryu.app.gui_topology.gui_topology

sleep 5
