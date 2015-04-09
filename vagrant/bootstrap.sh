#!/bin/bash

# Add swap
fallocate -l512M /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab

# Cleanup
apt-get -y autoremove
