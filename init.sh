#!/bin/sh
dnf install git ansible -y
git clone https://github.com/radtkedev/fedora
cd fedora
ansible-playbook -c local -i localhost, ansible.yml
cd ..
rm -rf fedora
