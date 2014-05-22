#!/bin/bash

# make a backup of sources.list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.old

echo "Set sources to BR"
sudo sed 's/\/us/\/br/g' /etc/apt/sources.list.old > /etc/apt/sources.list

echo "Update the system!"
sudo apt-get update -y