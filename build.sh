#!/bin/bash

#
# Build script for the basic-wordpress-box
# steps are kind of self-explanatory
#
set -e    # script should exit on error
vagrant box update
vagrant up --provision
vagrant halt
mkdir -p box
rm -f box/*.{ovf,vmdk}
VBoxManage export packer-base --ovf20 -o box/basic-wp.ovf
PACKER_LOG=1 packer build basic-wp.json
vagrant box add --force basic-wp box/virtualbox-basic-wp.box
