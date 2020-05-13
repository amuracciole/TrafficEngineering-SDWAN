#!/bin/bash

#Es necesario descargarse el wondershaper. Para ello, desde una terminal ejecutar:
#	git clone https://github.com/magnific0/wondershaper.git
#	cd wondershaper
#	sudo make install

cd /home/upm/Desktop/TFM/wondershaper
# Se aplica una política que en la interfaz R1_edge-e3 (del router hacia el conmutador A) haya 100 Mbps.
sudo wondershaper -a R1_edge-e3 -d 10000
# Se aplica una política que en la interfaz R2_edge-e3 (del router hacia el conmutador D) haya 100 Mbps.
sudo wondershaper -a R2_edge-e3 -d 10000
