#!/bin/bash
apt-get -y install build-essential make gcc linux-headers-$(uname -r)
 
sudo mount -o loop ~/linux.iso /media/cdrom
sudo cp /media/cdrom/VMwareTools*.tar.gz ~/
tar xfz VMwareTools*.tar.gz
cd ~/vmware-tools-distrib
sudo ./vmware-install.pl -d
sudo umount /media/cdrom
cd ~
rm -rf vmware-tools-distrib
rm -f VMwareTools*.tar.gz
rm linux.iso