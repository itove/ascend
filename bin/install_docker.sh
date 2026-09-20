#!/bin/bash
#
# vim:ft=bash
# Install docker on openEuler 22.03 LTS / 5.10.0-60.18.0.50.oe2203.aarch64

sudo dnf -y install dnf-plugins-core
# use rhel repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
# or centos
# sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Edit `/etc/yum.repos.d/docker-ce.repo`, change `$releasever` to `8`.
# docker on 9/10 requires glibc 2.38, but glibc server is 2.34.
$ sudo sed -i.bak s/\$releasever/8/ /etc/yum.repos.d/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER
sudo systemctl enable --now docker
