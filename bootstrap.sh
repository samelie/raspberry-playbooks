#!/bin/bash

# Install Python & pip
# curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# python3 get-pip.py

# Install ansible.
sudo pip3 install --ignore-installed ansible
ansible-galaxy install -r requirements.yaml
