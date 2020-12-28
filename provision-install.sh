#!/bin/bash

echo -n "Update all packages installed on the system..."
sudo apt-get update
apt-get upgrade -y 

# Install nginx
apt-get install -y nginx 

#sudo service nginx start
echo "Status of nginx:"
echo "----------------"
sudo systemctl status nginx 

# vérification de la version de curl
curl --version

# installation CURL si besoin
sudo apt-get install curl


echo "Install latest Node.js and npm on Ubuntu"
echo "----------------------------------------"

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt-get install -y nodejs

# Vérification version nodejs et npm
echo "nodejs version: " 
node --version
echo "npm version: " 
npm --version


echo "Mongodb installation"
echo "--------------------"

curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# apt-key list


echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

sudo apt update -y

sudo apt install -y mongodb-org

sudo systemctl start mongod.service

echo "mongodb status:"
echo "---------------"
sudo systemctl status mongod
sudo systemctl enable mongod

echo "mongose current version "
echo "----------------------- "
mongo --eval 'db.runCommand({ connectionStatus: 1 })'



echo "installing certificate for Docker ..."
echo "---------------------------------"    

apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

apt-get update
apt-cache policy docker-ce

echo "----------------------"    
echo "installation"
echo "----------------------"     
apt-get install -y docker-ce

systemctl enable docker
systemctl start docker

echo "Docker CE run "
echo "--------------"     
systemctl status docker
	 
echo "Docker CE access to download image of Docker Hub "
echo "-------------------------------------------------"   
docker run hello-world

     apt-get install -y openssh-server
     systemctl enable ssh
     systemctl start ssh
     systemctl status ssh
	 
echo "--------------------------"   
echo "Installing Angular/cli ..."
echo "--------------------------"   
sudo npm install -g @angular/cli

ng --version
tsc --version

echo "Create new project angular/cli"
echo "------------------------------"   

mkdir /vagrant/projects
cd /vagrant/projects

sudo ng new app-project

cd app-project


ng serve --host 0.0.0.0 --poll=2000