# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "docker-host"
  # config.vm.network :forwarded_port, guest: 80, host: 4567
  config.vm.provision "file", source: "~/.gitconfig", destination: "/home/vagrant/.gitconfig"

  # config.vm.provision :docker
  config.vm.provision :shell, path: "provision/bootstrap.sh"
  config.vm.provision :shell, path: "provision/postgres_install.sh"
  config.vm.provision :shell, path: "provision/git_installs.sh"

  config.vm.synced_folder ".", "/home/vagrant/src"


  # TODO: fwd psql/
  # redis/mysql/sqlite/memcached ports
end
