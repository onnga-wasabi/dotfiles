#!/bin/bash

export DOTPATH="${HOME}/dotfiles"

source ${DOTPATH}/etc/init/ubuntu/scripts.sh
source ${DOTPATH}/etc/init/github/scripts.sh

if [ "`uname | grep Linux`" ]
then
  echo Setting up for Linux platform...
  # さいしょ
  install_ubuntu_utils
  install_zsh
  install_zprezto
  install_powerline_fonts
  # install_pyenv_requirements
  # install_pyenv
  install_nvm
  install_dein
  install_neovim
fi

exec ${SHELL:-zsh}
echo Completed.
