#!/bin/bash

#
# Build script for the basic-wordpress-box
# steps are kind of self-explanatory
#
set -e    # script should exit on error
vagrant box update
vagrant up --provision
vagrant halt


VBoxManage sharedfolder remove packer-base --name vagrant
#VBoxManage modifyvm packer-base --uart1 off
VBoxManage modifyvm packer-base --audio none
VBoxManage modifyvm packer-base --uartmode1 disconnected


mkdir -p box
rm -f box/*.{ovf,vmdk}

VBoxManage export packer-base --ovf20 -o box/basic-wp.ovf

PACKER_LOG=1 packer build basic-wp.json
vagrant box add --force basic-wp box/virtualbox-basic-wp.box
