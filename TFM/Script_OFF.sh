#!/bin/bash

cd /usr/share/vnx/filesystems
echo "      ---> Destruir escenario <---"
sudo vnx -f /usr/share/vnx/tfm/Lab_TFM.xml -v --destroy
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM2.xml -v --destroy
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_conmutadores.xml -v --destroy
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_low_simple.xml -v --destroy
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_simple.xml -v --destroy
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_medium_simple.xml -v --destroy
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_full_simple.xml -v --destroy




