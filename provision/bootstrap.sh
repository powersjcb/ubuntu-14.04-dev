#!/usr/bin/env bash
SETUSER="vagrant"
ROOT_DIR="/home/vagrant"
install_this() {
  sudo apt-get install "$@"
}

sudo apt-get update
sudo apt-get upgrade -y

# install git
sudo apt-get install git -y
source "${ROOT_DIR}/.bashrc"

# Install development tools:
sudo apt-get install tree
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
chsh -s $(which zsh)


# Web server dependencies
sudo apt-get install build-essential -y
sudo apt-get install apache2 -y
sudo apt-get install python-setuptools libapache2-mod-wsgi
sudo service apache2 restart

sudo apt-get install nginx


# install rbenv, ruby, python, and rails dependencies
sudo apt-get install gnupg
sudo apt-get install libssl-dev -y
sudo apt-get install zlib1g-dev
sudo apt-get isntall libreadline-dev -y
sudo apt-get install libyaml-dev
sudo apt-get install libxml2-dev
sudo apt-get install libxslt1-dev
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install python-software-properties
sudo apt-get install libffi-dev
sudo apt-get install libbz2-dev ## for python


# Install databases:
  setup sqlite3 (optional for install rails dependencies)
sudo apt-get install libsqlite3-dev
sudo apt-get install sqlite3

  # setup mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

sudo apt-get install mysql-server -y 2> /dev/null
sudo apt-get install mysql-client -y 2> /dev/null


if [ ! -f /var/log/dbinstalled ];
then
    echo "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY '${SETUSER}'" | mysql -uroot -pROOTPASSWORD
    echo "CREATE DATABASE internal" | mysql -uroot -pROOTPASSWORD
    echo "GRANT ALL ON *.* TO '${SETUSER}'@'localhost'" | mysql -uroot -pROOTPASSWORD
    echo "flush privileges" | mysql -uroot -pROOTPASSWORD
    touch /var/log/dbinstalled
    if [ -f /vagrant/data/initial.sql ];
    then
        mysql -uroot -pROOTPASSWORD internal < /vagrant/data/initial.sql
    fi
fi

sudo service mysql restart

  # setup postgresql (outsourced to new shell script)
# sudo apt-get install postgresql -y
  # login to postgres with "sudo -i -u postgres"

  # install redis
sudo apt-get install redis-server -y
  # install memcached
sudo apt-get install memcached -y
#
# compile and install phantomjs (no .debs available as of 2015/9/7)
# sudo apt-get install build-essential g++ flex bison gperf ruby perl \
#   libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
#   libpng-dev libjpeg-dev python libx11-dev libxext-dev
