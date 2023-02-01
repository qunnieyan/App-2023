#!/bin/bash

VAGRANT_HOST_DIR=/mnt/host_machine

sudo apt-get update > /dev/null 2>&1
echo "[+]" $( date +%T ) "Installing Java"
sudo apt-get -y install default-jdk > /dev/null 2>&1

echo "[+]" $( date +%T ) "Installing Node & npm"
sudo apt-get -y install nodejs npm > /dev/null 2>&1

echo "[+]" $( date +%T ) "Installing pip"
sudo apt-get install -y python3-pip > /dev/null 2>&1

#git 
echo "[+]" $( date +%T ) "Installing Git"
sudo apt-get install -y git >/dev/null 2>&1

# MySQL install
echo "[+]" $( date +%T ) "Installing MySQL"
# Download and Install the Latest Updates for the OS
sudo dpkg-reconfigure -f noninteractive tzdata >/dev/null 2>&1

# Install essential packages
sudo apt-get -y install zsh htop >/dev/null 2>&1

# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
sudo apt install -y mariadb-server >/dev/null 2>&1

## Docker
echo "[+]" $( date +%T ) "Installing Docker and Docker-Compose"
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common >/dev/null 2>&1
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update >/dev/null 2>&1
sudo apt install docker-ce -y >/dev/null 2>&1
sudo usermod -aG docker vagrant >/dev/null 2>&1
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose >/dev/null 2>&1
sudo chmod 777 /usr/local/bin/docker-compose >/dev/null 2>&1

