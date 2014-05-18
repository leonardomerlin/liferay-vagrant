# -*- mode: ruby -*-
# vi: set ft=ruby :

# Author: Leonardo Merlin - leonardomerlin@github.com

require "rubygems"
require "json"

CONFIG_HOST_NAME = "liferay-dev-local"
CONFIG_HOST_PORT = 8080
CONFIG_MEMORY = "2048"
CONFIG_CPUs = "1"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = CONFIG_HOST_NAME
  config.ssh.forward_agent=true

  config.vm.synced_folder "liferay-deploy/", "/vagrant/liferay-deploy", mount_options: ["dmode=777,fmode=777"]
  config.vm.network :forwarded_port, guest: 8080, host: CONFIG_HOST_PORT
  
  config.vm.provider "virtualbox" do |vb|   
     # Boot with gui enabled
     vb.gui = true

     # Use VBoxManage to customize the VM.
     vb.customize ["modifyvm", :id, "--name", CONFIG_HOST_NAME]
     vb.customize ["modifyvm", :id, "--memory", CONFIG_MEMORY]
     vb.customize ["modifyvm", :id, "--cpus", CONFIG_CPUs]
  end

  # Examples:
  # config.vm.provision "shell", path: "setup.sh"
  # config.vm.provision "shell", path: "https://raw.githubusercontent.com/leonardomerlin/vagrant-liferay/scripts/script.sh"
  # config.vm.provision :puppet do |chef|
  # end
end
