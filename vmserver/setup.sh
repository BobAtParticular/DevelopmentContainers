#!/bin/bash

# Add my authorized key
cat "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/+o6nTUENUvrj6F7BDxnQ1KLBzr+YauD0HINzCQHKWAaUl4tWv4SIoF34kyzl+ohg5b+UG6b5kSxQnk5sf63qSZsw4mEfJBBydPuwDf+QNsNYDowHQoFn5qPax+iv9rbrPzg1Lc9DIi9ij8/MTruCMX3EW8+wk8N/MhiS8qQf7NQNJRuGmuXkjpp0QGyj6Y1ewjzSyMnoT/rqNsoA/SAs58OVGDY5IuRxjD7WnynujajlNDFxD3HFMSz7e/i8H6Yso2HyWIRPjEwQc5AyjVJSetfaal6y+Y0YzadYpj08uBMsmlGNPMaNh7D+atz0DO2fmTEMFbMh9HDH5YlwFDtv boblangley" > ~/.ssh/authorized_keys

# Setup the vmbridge network
cp ./etc/netplan/50-vmbridge.yaml /etc/netplan/
chmod 600 /etc/netplan/50-custom.yaml
netplan try

# Setup multipass

snap install multipass
snap install lxd
multipass set local.driver=lxd

cp ./home/boblangley/cloud-init.yml /home/boblangley/

# Install prometheus

apt install prometheus

# Install prometheus node exporter

apt install prometheus-node-exporter

snap install yq

yq -i /etc/prometheus/prometheus.yml 'scrape_configs.(job_name==node)static_configs.targets += "localhost:9100"'