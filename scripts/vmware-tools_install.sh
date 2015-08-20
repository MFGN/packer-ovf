#!/bin/bash

if grep -q -i 'red hat' /proc/version ;
then
  yum install -y kernel-devel Kernel-headers make gcc
else
  apt-get -y install build-essential make gcc linux-headers-$(uname -r)
fi

sudo mkdir /media/cdrom 
sudo mount -o loop /home/vagrant/linux.iso /media/cdrom
sudo cp /media/cdrom/VMwareTools*.tar.gz /home/vagrant
tar xfz VMwareTools*.tar.gz
cd /home/vagrant/vmware-tools-distrib
sudo ./vmware-install.pl -d
sudo umount /media/cdrom
cd /home/vagrant
rm -rf vmware-tools-distrib
rm -f VMwareTools*.tar.gz
rm linux.iso
