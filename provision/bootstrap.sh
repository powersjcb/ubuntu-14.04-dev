#! /usr/bin/env bash

install_this() {
  sudo apt-get install "$@"
}

apt-get update
apt-get upgrade -y

# install git
apt-get install git -y


# Install development tools:
sudo apt-get install build-essential -y
sudo apt-get install apache2 -y
sudo apt-get install python-setuptools libapache2-mod-wsgi
sudo service apache2 restart


# install rbenv, ruby, and rails dependencies
sudo apt-get install zlib1g-dev
sudo apt-get install libssl-dev
sudo apt-get isntall libreadline-dev -y
sudo apt-get install libyaml-dev
sudo apt-get install libxml2-dev
sudo apt-get install libxslt1-dev
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install python-software-properties
sudo apt-get install libffi-dev


# Install databases:
# setup sqlite3 (optional for install rails dependencies)
sudo apt-get install libsqlite3-dev
sudo apt-get install sqlite3

# setup mysql
sudo DEBIAN_FRONTEND=noninteractive apt-get install mysql-server -y -q
mysqladmin -u root password foobar
  # login to mysql with "mysql -u root -p"

# setup postgresql
sudo apt-get install postgresql -y
  # login to postgres with "sudo -i -u postgres"
