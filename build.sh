#!/bin/bash

#
# Build script for the basic-wordpress-box
# steps are kind of self-explanatory
#

vagrant up
vagrant halt
VBoxManage export packer-base --ovf20 -o builds/basic-wp.ovf
packer build basic-wp.json
vagrant box add basic-wp builds/virtualbox-basic-wp.box