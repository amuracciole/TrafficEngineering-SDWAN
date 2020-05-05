#!/bin/bash
echo "\n---> Levantar controlador y traffic monitor <---"
sleep 1
cd /home/upm/ryu/ryu/app
#Traffic Monitor normal
#ryu-manager --verbose ryu/ryu/app/simple_monitor_13_all.py
##FUNCIONA - Multipath con rest## 
#ryu-manager --observe-links ryu_multipath_OK.py ryu.app.gui_topology.gui_topology
##FUNCIONA - Simple monitor sin una tabla con rest##
#ryu-manager ryu.app.gui_topology.gui_topology ./network_awareness/shortest_forwarding.py --observe-links --k-paths=2  --weight=bw
## Simpe monitor con qos (minpro) con rest
##FUNCIONA##
#ryu-manager simple_monitor_13_tfm.py ryu.app.gui_topology.gui_topology
ryu-manager simple_monitor_13_modify.py ryu.app.gui_topology.gui_topology
sleep 5
