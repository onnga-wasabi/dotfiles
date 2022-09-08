#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0) && pwd)
source ${CURRENT}/share.sh

install_prezto () {
  echo "Installing zprezto..."
  if [ ! -e ${HOME}/.zlogin ]
  then
    ln -s ${DOTPATH}/submodules/prezto ${HOME}/.zprezto

	ln -sf ${DOTPATH}/submodules/prezto/runcoms/zlogin ${HOME}/.zlogin
	ln -sf ${DOTPATH}/submodules/prezto/runcoms/zlogout ${HOME}/.zlogout
    echo "Installed!"
  else
    echo "Already installed!"
  fi
  ln -sf ${DOTPATH}/etc/prezto/prompt/prompt_agnoster_setup ${HOME}/.zprezto/modules/prompt/functions/prompt_agnoster_setup
  echo
}
