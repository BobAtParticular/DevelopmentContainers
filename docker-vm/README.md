# Docker VM

The docker VM is called `workdocker`.

## Creation

`multipass launch --name workdocker --cpus 2 --disk 100G --memory 16G  --network name=vmbridge,mac="b6:64:16:f8:4a:13" --cloud-init cloud-init.yaml`

- **`--network`**: Set the mac address `b6:64:16:f8:4a:13` for consistent DHCP leases and local domain resolution. Generated from https://www.browserling.com/tools/random-mac

## Docker setup

`sudo snap install docker`

### Run Portainer

This is the docker run command used to create the Portainer container:

`sudo docker run -d -p 80:8000 -p 443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data -v ./certs:/certs portainer/portainer-ce:latest --sslcert /certs/portainer.crt --sslkey /certs/portainer.key`

- **`-p` Port 80/443**: Sets the default website for `https://workdocker` to be Portainer.