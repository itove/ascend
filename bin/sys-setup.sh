#!/bin/bash
#
# vim:ft=bash

############### Variables ###############
user=al
userpass=NEW_PASSWD
proxy_hostname=btn
proxy_ip=172.20.10.29
proxy_port=1080

############### Functions ###############

############### Main Part ###############
sudo useradd $user
echo "$userpass" | sudo passwd --stdin $user # Bypass PAM password policies

# Append proxy host
sudo sed -i "\$a$proxy_ip $proxy_hostname" /etc/hosts

# Use Kylin offical repo
sudo mv /etc/yum.repos.d/base.repo /etc/yum.repos.d/back/
sudo mv /etc/yum.repos.d/back/kylin_aarch64.repo /etc/yum.repos.d/

# Append to [main] section in /etc/dnf/dnf.conf
sudo sed -i "\$aproxy=socks5://$proxy_hostname:$proxy_port" /etc/dnf/dnf.conf

sudo usermod -aG wheel $user
# Allow user to run docker commands without sudo
sudo usermod -a -G docker $user
