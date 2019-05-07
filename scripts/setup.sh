#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# # Install Ansible prereqs
# sudo apt-get -y update
# sudo apt-get -y install software-properties-common

# # Install Ansible.
# sudo apt-add-repository -y ppa:ansible/ansible
# sudo apt-get -y update
# sudo apt-get -y install ansible
