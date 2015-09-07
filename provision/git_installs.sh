#! /usr/bin/env bash

# TODO: setup git account information
# do it!


# shell .rc file route
SHELLRC="/home/vagrant/.bashrc"

# install pyenv and setup path variables
git clone https://github.com/yyuu/pyenv.git /home/vagrant/.pyenv --depth=1
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "${SHELLRC}"
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "${SHELLRC}"
echo 'eval "$(pyenv init -)"' >> "${SHELLRC}"
exec $BASH
