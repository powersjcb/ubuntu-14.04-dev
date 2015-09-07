#! /usr/bin/env bash

apt-get update
apt-get upgrade -y

# install git
apt-get install git -y


# Install development tools:
sudo apt-get -y install build-essential
sudo apt-get install apache2 -y
sudo apt-get install python-setuptools libapache2-mod-wsgi
sudo service apache2 restart

# Install databases:
# setup mysql
sudo DEBIAN_FRONTEND=noninteractive apt-get install mysql-server -y -q
mysqladmin -u root password foobar
  # login to mysql with "mysql -u root -p"

# setup postgresql
sudo apt-get install postgresql -y
  # login to postgres with "sudo -i -u postgres"
