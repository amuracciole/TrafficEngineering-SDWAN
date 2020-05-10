#!/bin/bash

sudo ovs-ofctl -O OpenFlow13 dump-ports $1
