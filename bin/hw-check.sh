#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############


for i in {0..7}
do
    echo Checking $i
    hccn_tool -i $i -ip -g
    hccn_tool -i $i -ping -g address 172.20.60.1
    hccn_tool -i $i -lldp -g | grep Ifname
    hccn_tool -i $i -link -g
    hccn_tool -i $i -net_health -g
    hccn_tool -i $i -netdetect -g
    hccn_tool -i $i -gateway -g
    sudo hccn_tool -i $i -tls -s enable 0
    sudo hccn_tool -i $i -tls -g | grep switch
    echo
done
