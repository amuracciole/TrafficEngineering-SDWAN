#!/bin/bash

sudo ovs-ofctl -O OpenFlow13 dump-groups $1
