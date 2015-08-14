#!/bin/bash

if grep -q -i 'red hat' /proc/version ;
then
  SSHD_CONFIG_FILE="/etc/ssh/ssh_config"
  SSHD_SERVICE="sshd"
else
  SSHD_CONFIG_FILE="/etc/ssh/sshd_config"
  SSHD_SERVICE="ssh"
fi

cp $SSHD_CONFIG_FILE{,.old}
sed -i 's/^#.*PermitRootLogin yes/PermitRootLogin no/g' $SSHD_CONFIG_FILE
sed -i 's/^#.*UseDNS.*/UseDNS no/g' $SSHD_CONFIG_FILE
sed -i 's/^#.*PasswordAuthentication no/PasswordAuthentication yes/g' $SSHD_CONFIG_FILE
sed -i 's/^#.*PasswordAuthentication yes/PasswordAuthentication yes/g' $SSHD_CONFIG_FILE
sed -i 's/^#.*PubkeyAuthentication.*/PubkeyAuthentication yes/g' $SSHD_CONFIG_FILE
sed -i 's/^#.*RSAAuthentication.*/RSAAuthentication yes/g' $SSHD_CONFIG_FILE
sed -i '/AuthorizedKeysFile/s/^#*//'  $SSHD_CONFIG_FILE

if ! grep -q -i UseDNS $SSHD_CONFIG_FILE ;
then
  echo -e "UseDNS no" >> $SSHD_CONFIG_FILE
fi