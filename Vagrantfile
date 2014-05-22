# -*- mode: ruby -*-
# vi: set ft=ruby :

# Author: Leonardo Merlin - leonardomerlin@github.com

require "rubygems"
require "json"

CONFIG_HOST_NAME = "development"
CONFIG_MEMORY = "2048"
CONFIG_CPUs = "1"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = CONFIG_HOST_NAME
  config.ssh.forward_agent=true

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
  end

  # config.vm.synced_folder "liferay-deploy/", "/vagrant/liferay-deploy", mount_options: ["dmode=777,fmode=777"]
  # config.vm.synced_folder "liferay-deploy/", "/vagrant/liferay-deploy", create: true
  
  config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true
  # config.vm.network :forwarded_port, guest: 8153, host: 8153, auto_correct: true
  # config.vm.network :forwarded_port, guest: 8154, host: 8154, auto_correct: true
  
  # Choose an interface to bridge your network
  # config.vm.network :public_network

  config.vm.provider "virtualbox" do |vb|   
     # Boot with gui enabled
     vb.gui = true

     # Use VBoxManage to customize the VM.
     vb.customize ["modifyvm", :id, "--name", CONFIG_HOST_NAME]
     vb.customize ["modifyvm", :id, "--memory", CONFIG_MEMORY]
     vb.customize ["modifyvm", :id, "--cpus", CONFIG_CPUs]
  end

  # bootstrap.sh:
  # - point the sources.list to 'br'
  # - apt-get update
  config.vm.provision "shell", path: "./scripts/bootstrap.sh"
  

  config.vm.provision :chef_solo do |chef|
    chef.verbose_logging = true
    # chef.recipe_url = "https://raw.github.com/leonardomerlin/liferay-vagrant/cookbooks.tar.gz"
    # chef.cookbooks_path = [:vm, "cookbooks"]
    
    chef.add_recipe "curl"
    chef.add_recipe "git"

    # chef.add_recipe "java"
    # chef.add_recipe "maven"
    # chef.add_recipe "liferay-setup" # [TODO]

    # chef.add_recipe "ruby"
    chef.add_recipe "sass"
    chef.add_recipe "rake"
    
    chef.add_recipe "gnome" # GUI
    chef.add_recipe "startup-setup" # GUI

    chef.add_recipe "startup-setup-console"
    chef.add_recipe "remove-unused-packages"

    chef.json = {
      'java' => {
        'install_flavor' => 'openjdk',
        'jdk_version' => '7'
      },
      'ruby' => {
        'languages' => {
          'ruby' => {
            'default_version' => '1.9'
          }
        }
      }
    }
  end

  # config.vm.provision "shell", path: "./scripts/bootstrap.sh"
  # config.vm.provision "shell", inline: "sudo apt-get install -y virtualbox-guest-additions"
end
