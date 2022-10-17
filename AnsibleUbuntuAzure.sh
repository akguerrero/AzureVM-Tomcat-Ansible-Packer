#!/bin/bash

# Update apt
sudo apt-get update

# Install Ansible and Python
sudo apt-get install -y libssl-dev libffi-dev python-dev python3-pip

# Install Ansible az collection for interacting with Azure.
ansible-galaxy collection install azure.azcollection

# Install Ansible modules for Azure
sudo pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt

# Fixing a future issue, read the word document
sudo pip3 install --force-reinstall pyopenssl

# Verify installation
ansible --version

