# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below.

Vagrant.configure("2") do |config|
  
config.vm.box = "base"
config.vm.boot_timeout = 120

#config .vm.define "base" do |base|
#	base.vm.hostname = "base"
#	base.vm.network "private_network", ip:"192.168.123.122"
#end 

config.vm.define "develop" do |develop|
  develop.vm.hostname = "develop"
  develop.vm.network "private_network", ip: "192.168.123.11"
  develop.vm.provision "file", source: "./app", destination: "/tmp/"
  develop.vm.provision "shell", path: "./shell/environment.sh"
end

config.vm.define "builder" do |builder|
# This machine gets RPM pakage "demo-1" from github and store it in its repository.
# Pacage  have to be stored in RPMForLink folder on github
  builder.vm.hostname = "builder"
  builder.vm.network "private_network", ip: "192.168.123.22"
  builder.vm.provision "shell", path: "./shell/builder.sh"
end

config.vm.define "prod" do |prod|
  prod.vm.hostname = "prod"
  prod.vm.network "private_network", ip: "192.168.123.33"
  prod.vm.provision "shell", path: "./shell/prod.sh"
end

  config.vm.provider "virtualbox" do |vb|
  #   vb.gui = true   ### may be We will need this on demo
  #   vb.memory = "1024"
  end


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
