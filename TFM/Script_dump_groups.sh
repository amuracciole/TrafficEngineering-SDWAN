#!/bin/bash

echo
sudo ovs-ofctl -O OpenFlow13 dump-groups $1
echo "\n Presione ENTER para continuar..."
read enter
