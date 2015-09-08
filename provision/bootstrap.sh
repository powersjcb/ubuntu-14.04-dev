#!/usr/bin/env bash

ROOT_DIR="/home/vagrant"
install_this() {
  sudo apt-get install "$@"
}

apt-get update
# sudo apt-get upgrade -y

# install git
sudo apt-get install git -y
source "${ROOT_DIR}/.bashrc"

# Install development tools:
sudo apt-get install vim -y
sudo apt-get install tmux -y

# setup Solarized theme
gtcbin="`(mktemp -d)`/solarize"
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git "`(dirname \"$gtcbin\")`"
"$gtcbin" dark

# Zsh
sudo apt-get install zsh -y

# Prezto
git clone --recursive https://github.com/powersjcb/prezto.git "${ROOT_DIR}/.zprezto"

shopt -s extglob
for rcfile in $ROOT_DIR/.zprezto/runcoms/!(README.md); do
  ln -s "$rcfile" "${ROOT_DIR}/.$(basename $rcfile)"
done
sudo usermod -s /bin/zsh vagrant


# Lamp dependencies
sudo apt-get install build-essential -y
sudo apt-get install apache2 -y
sudo apt-get install python-setuptools libapache2-mod-wsgi
sudo service apache2 restart


# install rbenv, ruby, python, and rails dependencies
sudo apt-get install gnupg
sudo apt-get install zlib1g-dev
sudo apt-get install libssl-dev
sudo apt-get isntall libreadline-dev -y
sudo apt-get install libyaml-dev
sudo apt-get install libxml2-dev
sudo apt-get install libxslt1-dev
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install python-software-properties
sudo apt-get install libffi-dev
sudo apt-get install libbz2-dev ## for python


# Install databases:
  # setup sqlite3 (optional for install rails dependencies)
sudo apt-get install libsqlite3-dev
sudo apt-get install sqlite3

  # setup mysql
sudo DEBIAN_FRONTEND=noninteractive apt-get install mysql-server -y -q
mysqladmin -u root password foobar
  # login to mysql with "mysql -u root -p"

  # setup postgresql (outsourced to new shell script)
# sudo apt-get install postgresql -y
  # login to postgres with "sudo -i -u postgres"

  # install redis
sudo apt-get install redis-server -y
  # install memcached
sudo apt-get install memcached -y

# compile and install phantomjs (no .debs available as of 2015/9/7)
# sudo apt-get install build-essential g++ flex bison gperf ruby perl \
#   libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
#   libpng-dev libjpeg-dev python libx11-dev libxext-dev
