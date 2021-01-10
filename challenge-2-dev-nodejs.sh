#!/bin/bash
 
# update APT repositories before installing anything else
sudo apt-get update
 
# install node.js
wget -qO- https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# install Angular CLI package
sudo npm install -g @angular/cli

# install Nginx
# adding the repository
echo -e "deb [arch=amd64] http://nginx.org/packages/mainline/ubuntu/ bionic nginx \ndeb-src http://nginx.org/packages/mainline/ubuntu/ bionic nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
# adding public key
wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key
# update APT
sudo apt-get update
# install latest version of NGINX
sudo apt-get install -y nginx

# install MongoDB
# install gnupg
sudo apt-get install gnupg
# import public key
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
# create list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
# update APT
sudo apt-get update
# install latest version
sudo apt-get install -y mongodb-org

# install Docker Community Edition
# update APT
sudo apt-get update
# install HTTPS server packages for APT
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# add GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# add repository -> Will only work with Python 3.6 but not the versions above: 3.7, 3.8
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
# update APT
sudo apt-get update
# install Docker CE
sudo apt-get install -y docker-ce

exit 0