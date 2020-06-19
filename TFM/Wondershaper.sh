#!/bin/bash

#Es necesario descargarse el wondershaper. Para ello, desde una terminal ejecutar:
#	git clone https://github.com/magnific0/wondershaper.git
#	cd wondershaper
#	sudo make install

cd /home/upm/Desktop/TFM/wondershaper
# Se aplica una política que en la interfaz R1_edge-e3 (del router hacia el conmutador A) haya 100 Mbps.
#sudo wondershaper -a R1_edge-e3 -u 102400 -d 102400
# Se aplica una política que en la interfaz R2_edge-e3 (del router hacia el conmutador D) haya 100 Mbps.
#sudo wondershaper -a R2_edge-e3 -u 102400 -d 102400

# Se aplica una política que en la interfaz A-C-0 haya 100 Mbps.
sudo wondershaper -a A-C-0 -u 102400 -d 102400
# Se aplica una política que en la interfaz A-B-1 haya 100 Mbps.
sudo wondershaper -a A-B-1 -u 102400 -d 102400
# Se aplica una política que en la interfaz A-B-0 haya 100 Mbps.
#sudo wondershaper -a A-B-0 -u 102400 -d 102400
# Se aplica una política que en la interfaz B-D-0 haya 100 Mbps.
#sudo wondershaper -a B-D-0 -u 102400 -d 102400
# Se aplica una política que en la interfaz A-C-1 haya 100 Mbps.
#sudo wondershaper -a A-C-1 -u 102400 -d 102400
# Se aplica una política que en la interfaz E-C-1 haya 100 Mbps.
#sudo wondershaper -a E-C-1 -u 102400 -d 102400
# Se aplica una política que en la interfaz B-D-1 haya 100 Mbps.
#sudo wondershaper -a B-D-1 -u 102400 -d 102400
# Se aplica una política que en la interfaz D-E-1 haya 100 Mbps.
sudo wondershaper -a D-E-1 -u 102400 -d 102400
# Se aplica una política que en la interfaz C-E-0 haya 100 Mbps.
sudo wondershaper -a E-C-0 -u 102400 -d 102400
# Se aplica una política que en la interfaz D-E-0 haya 100 Mbps.
#sudo wondershaper -a D-E-0 -u 102400 -d 102400

