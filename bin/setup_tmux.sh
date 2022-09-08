#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0) && pwd)
source ${CURRENT}/share.sh

install_tmux_powerline () {
  echo "Installing tmux-powerline..."
  if [ ! -e ${HOME}/.tmux-powerline ]
  then
    ln -s ${DOTPATH}/submodules/tmux-powerline ${HOME}/.tmux-powerline
    echo "Installed!"
  else
    echo "Already installed!"
  fi
  ln -sf ${DOTPATH}/etc/tmux/tmux-powerline/themes/origin.sh ${HOME}/.tmux-powerline/themes/origin.sh
  echo
}
