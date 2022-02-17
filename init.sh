#!/bin/sh
sudo dnf install git ansible python3-libselinux -y
git clone https://github.com/radtkedev/fedora
ansible-playbook -c local -i localhost, fedora/ansible.yml
rm -rf fedora
