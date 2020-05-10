#!/bin/bash
echo "\n---> Levantar controlador y traffic monitor <---"
sleep 1
cd /home/upm/ryu/ryu/app
##FUNCIONA - Multipath (sin meidores de BW, PL y DL - Con rest## 
#ryu-manager --observe-links ryu_multipath_OK.py ryu.app.gui_topology.gui_topology
##FUNCIONA - Simple monitor sin una tabla con rest##
#ryu-manager ryu.app.gui_topology.gui_topology ./network_awareness/shortest_forwarding.py --observe-links --k-paths=2  --weight=bw
## Simpe monitor con qos (minpro) con rest
##FUNCIONA##
ryu-manager simple_monitor_13_modify2.py ryu.app.gui_topology.gui_topology
sleep 5
