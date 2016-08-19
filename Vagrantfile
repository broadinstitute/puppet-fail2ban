# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.2-64-nocm"
  # config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  config.vm.network "private_network", type: "dhcp",
    virtualbox__intnet: "vboxnet1"

  config.vm.hostname = "puppet-fail2ban.example.com"

  config.vm.provider "virtualbox" do |vb|
   vb.gui = false
   vb.memory = "1024"
   vb.name = "puppet-fail2ban"
  end

  config.vm.provision "file", source: "vagrant_files/Gemfile", destination: "/tmp/Gemfile"
  config.vm.provision "file", source: "vagrant_files/Gemfile.lock", destination: "/tmp/Gemfile.lock"
  config.vm.provision "file", source: "vagrant_files/hiera.yaml", destination: "/tmp/hiera.yaml"
  config.vm.provision "shell", path: "vagrant_files/centos7-init.sh"

  config.vm.synced_folder ".", "/etc/puppet/modules/fail2ban"

  config.ssh.insert_key = false
end
