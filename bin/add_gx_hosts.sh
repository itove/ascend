#!/bin/bash
#
# vim:ft=bash

############### Functions ###############
addhost(){
    if [ -z $1 ]; then
        echo usage: addhost 127.0.0.1 backend
        exit
    fi

    ip=$1
    host=$2
    hosts=/etc/hosts

    sudo sed -i "/ $host$/d" $hosts
    sudo sed -i "\$a$ip $host" $hosts
}

############### Main Part ###############
addhost 172.20.84.67 gx1
addhost 172.20.84.77 gx2
addhost 172.20.84.189 gx3
addhost 172.20.84.50 gx4

addhost 127.0.0.1 $HOSTNAME
