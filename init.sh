#!/bin/sh
sudo dnf install git ansible -y
git clone https://github.com/radtkedev/fedora
ansible-playbook -c local -i localhost, fedora/ansible.yml
rm -rf fedora
