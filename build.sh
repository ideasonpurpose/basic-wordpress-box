#!/bin/bash

#
# Build script for the basic-wordpress-box
# steps are kind of self-explanatory
#
set -e
vagrant box update
vagrant up --provision
vagrant halt
rm -f builds/*.{ovf,vmdk}
VBoxManage export packer-base --ovf20 -o builds/basic-wp.ovf
packer build basic-wp.json
vagrant box add --force basic-wp builds/virtualbox-basic-wp.box
