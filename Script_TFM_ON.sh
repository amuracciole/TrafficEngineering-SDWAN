#!/bin/bash
#CODIGO PARA TFM
# Inicializando...
sudo apt-get install at-spi2-core
cd /usr/share/vnx/filesystems
echo "\n---> ¡¡ INICIALIZANDO SCRIPT TFM !! <---"
echo "      ---> Crear escenario... <---"
sleep 2
sudo vnx -f /usr/share/vnx/tfm/Lab_TFM.xml -v --create
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM2.xml -v --create
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_conmutadores.xml -v --create
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_low_simple.xml -v --create
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_simple.xml -v --create
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_medium_simple.xml -v --create
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_full_simple.xml -v --create
sleep 3
sudo vnx -f /usr/share/vnx/tfm/Lab_TFM.xml --show-map
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM2.xml --show-map
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_conmutadores.xml --show-map
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_low_simple.xml --show-map
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_simple.xml --show-map
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_medium_simple.xml --show-map
#sudo vnx -f /usr/share/vnx/tfm/Lab_TFM_full_simple.xml --show-map
cd /home/upm/Desktop
#gnome-terminal -e 'sh -c "sh Script_TFM_controlador.sh;"'

