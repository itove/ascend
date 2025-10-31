#!/bin/bash
#
# vim:ft=bash

echo DANGEROUS!!!
echo You are about to create a new filesystem, which will DESTROY your data!!!
echo Sure you wanna do this?
read -p "Type YES to confirm. [YES/n] "
[ "$REPLY" != YES ] && exit

vgname=elwynn
lvname=stromwind
mountpoint=/mnt/d
disks=(/dev/nvme0n1 /dev/nvme1n1)

echo Creating PVs for disks: ${disks[@]}
sudo pvcreate ${disks[@]}

echo Create VG $vgname
sudo vgcreate $vgname ${disks[@]}

echo Creating LV $lvname
sudo lvcreate -l 100%FREE -n $lvname $vgname
# sudo lvcreate --extents 100%FREE --name $lvname $vgname

echo Creating xfs filesystem...
sudo mkfs.xfs /dev/$vgname/$lvname

echo Creating mountpoint: $mountpoint
sudo mkdir $mountpoint

echo Mounting...
mount /dev/$vgname/$lvname $mountpoint

# Append to /etc/fstab
