#! /usr/bin/env bash

# TODO: setup git account information
# do it!


# shell .rc file route
ROOT_DIR="/home/vagrant"
SHELLRC="${ROOT_DIR}/.bashrc"

# install pyenv and setup path variables
git clone https://github.com/yyuu/pyenv.git /home/vagrant/.pyenv --depth=1
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "${SHELLRC}"
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "${SHELLRC}"
. "${SHELLRC}"
echo 'eval "$(pyenv init -)"' >> "${SHELLRC}"

# update python 2.7 -> 2.7.10 and dependencies for development
pyenv install 2.7.10
pyenv global 2.7.10
curl -o- "https://bootstrap.pypa.io/get-pip.py" | python
pip install virtualenv
# Need to escape $@ so that it can be passed into passed into bashrc
cat <<EOT >> "${SHELLRC}"
gpip(){
  PIP_REQUIRE_VIRTUALENV="" pip "\$@"
}
EOT

# install rbenv
git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv --depth=1
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> "${SHELLRC}"
echo 'eval "$(rbenv init -)"' >> "${SHELLRC}"
# install ruby tools for rbenv/linux
git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> "${SHELLRC}"
source $SHELLRC

# install node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

# install node
. "${ROOT_DIR}/.nvm/nvm.sh"
nvm install stable  # run this to install latest stable version of node
nvm alias default stable

# install npm
sudo apt-get install npm -y
# install npm autocomplete
npm completion >> "${SHELLRC}"
