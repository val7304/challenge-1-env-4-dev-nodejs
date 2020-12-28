# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  # config.vm.box_url = "https://vagrantcloud.com/ubuntu/bionic64"

  config.vm.hostname = "dev-nodejs"
  config.vm.synced_folder "./projects", "/var/www/projects", type: "virtualbox"	

  # Network
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 4200, host: 4200
  config.vm.network "forwarded_port", guest: 27017, host: 27017
   
  config.vm.define "dev-nodejs"
  config.vm.provider "virtualbox" do |vb|
      vb.name = "dev-nodejs"  
      vb.memory = "2048"  # 1GB Memory
      vb.cpus = 4
  end
        
  # Provision
  config.vm.provision :shell, path: "provision-install.sh"
  
end
