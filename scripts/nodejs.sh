#!/bin/bash

sudo apt-get install -y python-software-properties
sudo apt-get install -y --no-install-recommends nodejs npm
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update

# avoid 'sudo' before npm
npm config set prefix ~/npm
echo "export PATH=$HOME/npm/bin:$PATH" >> ~/.bashrc && source ~/.bashrc
echo "export NODE_PATH=$NODE_PATH:/home/vagrant/npm/lib/node_modules" >> ~/.bashrc && source ~/.bashrc

# install packages: yeoman, coffeescript
npm install -g yo
npm install -g coffee-script

# REMEMBER: you need to install gulp at project too.
# Ex.: $ cd path-to-project/ && npm install gulp
npm install -g gulp


# 
# TEST
# 
# phantomjs:
sudo apt-get install -y fontconfig
npm install -g phantomjs
