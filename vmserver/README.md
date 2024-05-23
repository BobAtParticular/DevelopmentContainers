# VM Server

## Install Ubuntu

Using a USB key

- **HOSTNAME**: `vmserver`
- **User**: `boblangley`

## Setup SSH key authentication

Create and edit `./.ssh/authorized_keys`:
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/+o6nTUENUvrj6F7BDxnQ1KLBzr+YauD0HINzCQHKWAaUl4tWv4SIoF34kyzl+ohg5b+UG6b5kSxQnk5sf63qSZsw4mEfJBBydPuwDf+QNsNYDowHQoFn5qPax+iv9rbrPzg1Lc9DIi9ij8/MTruCMX3EW8+wk8N/MhiS8qQf7NQNJRuGmuXkjpp0QGyj6Y1ewjzSyMnoT/rqNsoA/SAs58OVGDY5IuRxjD7WnynujajlNDFxD3HFMSz7e/i8H6Yso2HyWIRPjEwQc5AyjVJSetfaal6y+Y0YzadYpj08uBMsmlGNPMaNh7D+atz0DO2fmTEMFbMh9HDH5YlwFDtv boblangley
```

## Create vmbridge network

Create and edit `/etc/netplan/50-custom.yml`:
```yml
network:
  bridges:
    vmbridge:
      dhcp4: true
      interfaces:
        - enp2s0
```

Make sure the file is readonly:

```shell
sudo chmod 600 /etc/netplan/50-custom.yaml
```

Then update netplan:

```shell
sudo netplan try
```

### Setup Multipass

Install Multipass with the following commands:

```
sudo snap install multipass
sudo snap install lxd
multipass set local.driver=lxd
```

Download `cloud-init.yml` to setup common configuration for the VMs being created:

```shell
wget ??
```

### Install Prometheus

```shell
sudo apt install prometheus
```

### Install Prometheus Node Exporter

```shell
sudo apt install prometheus-node-exporter
```

Configure the `/etc/prometheus/prometheus.yml`:

```yaml
  - job_name: node
    # If prometheus-node-exporter is installed, grab stats about the local
    # machine by default.
    static_configs:
      - targets:
        - 'localhost:9100'
```

### Install Grafana

```shell
sudo apt install grafana

sudo wget https://dl3.pushbulletusercontent.com/8CNhHsCJ1F5YbJFzCuiadWUntHo13nbT/vmserver.crt

sudo wget https://dl3.pushbulletusercontent.com/LFSVXjQ25SJsHkK1UzS6mDM9MX8xHbmS/vmserver.key

sudo chgrp grafana vmserver.crt
sudo chgrp grafana vmserver.key

sudo chmod 400 vmserver.crt
sudo chmod 400 vmserver.key
```

Configure the `/etc/grafana/grafana.ini`:

```ini
# Protocol (http, https, h2, socket)
protocol = https

...

# The http port  to use
http_port = 443

# The public facing domain name used to access grafana from a browser
domain = vmserver.localdomain

...

# https certs & key file
cert_file = /etc/grafana/grafana.crt
cert_key = /etc/grafana/grafana.key
```

Configure the `/etc/systemd/system/grafana-server.service.d/override.conf` to [allow using port 80/443](https://grafana.com/docs/grafana/latest/setup-grafana/start-restart-grafana/#serve-grafana-on-a-port--1024).

```ini
[Service]
# Give the CAP_NET_BIND_SERVICE capability
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_BIND_SERVICE

# A private user cannot have process capabilities on the host's user
# namespace and thus CAP_NET_BIND_SERVICE has no effect.
PrivateUsers=false
```