# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu1404"
  config.vm.hostname = "CodeCheck-Env"
  config.vm.network "private_network", ip: "192.168.33.101"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end
end
