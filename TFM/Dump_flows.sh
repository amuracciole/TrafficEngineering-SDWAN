#!/bin/bash

echo
sudo ovs-ofctl -O OpenFlow13 dump-flows $1
echo "\n Presione ENTER para continuar..."
read enter
