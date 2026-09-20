#!/bin/bash
#
# vim:ft=bash
# Install docker on openEuler 22.03 LTS / 5.10.0-60.18.0.50.oe2203.aarch64

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

# Edit `/etc/yum.repos.d/docker-ce.repo`, change `$releasever` to `10`.
$ sudo sed -i.bak s/\$releasever/10/ /etc/yum.repos.d/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER
sudo systemctl enable --now docker
