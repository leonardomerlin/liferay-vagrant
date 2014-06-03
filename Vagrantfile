# -*- mode: ruby -*-
# vi: set ft=ruby :

require "rubygems"
require "json"

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = CONFIG_HOST_NAME
  config.ssh.forward_agent=true

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
  end
  
  # config.vm.define "liferay" do |liferay|
    # TODO
  # end
  # config.vm.define "db" do |db|
    # TODO
  # end
  # config.vm.define "ci" do |ci|
    # TODO
  # end
  # config.vm.define "qa" do |qa|
    # TODO
  # end
  
  # the first param is the host (localhost) folder
  # the second is the virtual machine folder
  config.vm.synced_folder "shared/", "/vagrant/shared", create: true
  
  config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true

  config.vm.provider "virtualbox" do |vb|   
     # Boot with gui enabled ?
     # vb.gui = true

     # Use VBoxManage to customize the VM.
     vb.customize ["modifyvm", :id, "--name", "development"]
     vb.customize ["modifyvm", :id, "--memory", "512"]
     vb.customize ["modifyvm", :id, "--cpus", "1"]
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
