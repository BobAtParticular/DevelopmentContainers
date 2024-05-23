# Kubernetes VM

The docker VM is called `workkubernetes`.

## Creation

`multipass launch --name workkubernetes --cpus 2 --disk 100G --memory 16G  --network name=vmbridge,mac="47:73:ed:4f:70:a9" --cloud-init cloud-init.yaml`

- **`--network`**: Set the mac address `47:73:ed:4f:70:a9` for consistent DHCP leases and local domain resolution. Generated from https://www.browserling.com/tools/random-mac

## Kubernetes setup

`???`

### Connect Portainer

`???`