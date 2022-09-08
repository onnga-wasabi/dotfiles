#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0) && pwd)
source ${CURRENT}/share.sh

install_dein() {
  echo "Installing dein..."
  if [ ! -e ${HOME}/.cache/dein ]
  then
    cd $(mktemp -d)
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    # For example, we just use `~/.cache/dein` as installation directory
    sh ./installer.sh ~/.cache/dein
    cd ${HOME}
    echo "Installed!"
  else
    echo "Already installed!"
  fi
}
