#!/bin/bash
 
## install software for the base box to come packaged with - these will always be updated with chef/pupput
apt-get update
apt-get install -y linux-headers-$(uname -r) build-essential dkms zlib1g-dev libssl-dev libreadline6-dev libyaml-dev curl wget git-core gcc g++ make autoconf python-software-properties screen python-simplejson
 
 
## create the vagrant user
sudo useradd -d /home/vagrant -m vagrant -p vagrant
 
## setup the vagrant user groupex
mkdir -m 0711 /home/ubuntu/.ssh/
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' > /home/ubuntu/.ssh/authorized_keys
sudo groupadd admin 
sudo usermod -G admin vagrant
echo '%admin ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
echo 'UseDNS no' >> /etc/ssh/sshd_config
 
## install the vagrant public & private keys
mkdir /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget http://github.com/mitchellh/vagrant/raw/master/keys/vagrant
wget http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub
mv vagrant.pub /home/vagrant/.ssh/authorized_keys
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh