#!/bin/bash
#
# vim:ft=bash

set -e

disks=(/dev/nvme0n1 /dev/nvme1n1)

echo DANGEROUS!!!
echo You are about to create a new filesystem, which will DESTROY your data on ${disks[@]}!!!
echo Sure you wanna do this?
read -p "Type YES to confirm. [YES/n] "
[ "$REPLY" != YES ] && exit

vgname=elwynn
lvname=stromwind
mountpoint=/mnt/d

echo Creating PVs for disks: ${disks[@]}
sudo pvcreate ${disks[@]}

echo Create VG $vgname
sudo vgcreate $vgname ${disks[@]}

echo Creating LV $lvname
sudo lvcreate -l 100%FREE -n $lvname $vgname
# sudo lvcreate --extents 100%FREE --name $lvname $vgname

echo Creating xfs filesystem...
sudo mkfs.xfs /dev/$vgname/$lvname

sleep 2

uuid=$(lsblk -n -o UUID -l /dev/$vgname/$lvname)
echo Created: /dev/$vgname/$lvname UUID: $uuid

echo Creating mountpoint: $mountpoint
sudo mkdir $mountpoint

echo Append to /etc/fstab...
sudo sed -i '$a'"UUID=$uuid $mountpoint                  xfs     defaults        0 0" /etc/fstab

echo Mounting...
sudo mount -a
