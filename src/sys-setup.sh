#!/bin/bash
#
# vim:ft=bash

############### Variables ###############
username=al
userpass=NEW_PASSWD
proxy_hostname=btn
proxy_ip=172.20.10.29
proxy_port=1080

############### Functions ###############

############### Main Part ###############
sudo useradd $username
sudo usermod -aG wheel $username
echo "$userpass" | sudo passwd --stdin $username # Bypass PAM password policies

# Append proxy host
sudo sed -i "\$a$proxy_ip $proxy_hostname" /etc/hosts

# Append to [main] section in /etc/dnf/dnf.conf
sudo sed -i "\$aproxy=socks5://$proxy_hostname:$proxy_port" /etc/dnf/dnf.conf
