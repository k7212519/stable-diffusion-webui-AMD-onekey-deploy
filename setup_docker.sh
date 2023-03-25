#!/bin/bash

sudo usermod -a -G render $LOGNAME
sudo usermod -a -G video $LOGNAME

sudo apt-get update

# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key:
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

#Your default umask may be incorrectly configured, preventing detection of the repository public key file. Try granting read permission for the Docker public key file before updating the package index:
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update

# To install the latest version, run:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker version
echo "docker installed"

#add user/docker to group
sudo groupadd docker
echo "user add groupaad"
sudo gpasswd -a $USER docker
echo "gpasswd"
newgrp docker

