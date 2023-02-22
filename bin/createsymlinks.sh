#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0) && pwd)
source ${CURRENT}/share.sh

link_rc_files () {
  RC_FILES="
    zshrc
    zpreztorc
    tmux.conf
    tmux-powerlinerc
    vimrc
    tool-versions
    gitconfig
    gitignore_global
    latexmkrc
    default-python-packages
    tigrc
  "

  for rc_file in ${RC_FILES}
  do
    ln -sf ${DOTPATH}/${rc_file} ${HOME}/.${rc_file}
    echo "symlink created ${HOME}/.${rc_file} -> ${DOTPATH}/${rc_file}"
  done

  # nvim
  ln -sf ${DOTPATH}/config/nvim/ ${HOME}/.config/
  echo "symlink created ${DOTPATH}/config/nvim/ -> ${HOME}/.config/nvim"
  echo

  # cspell
  ln -sf ${DOTPATH}/config/cspell/ ${HOME}/.config/
  echo "symlink created ${DOTPATH}/config/cspell/ -> ${HOME}/.config/cspell"
  echo

  # iTerm 2
  ln -sf ${DOTPATH}/etc/iterm/Preferences/com.googlecode.iterm2.plist ${HOME}/Documents/Preferences/com.googlecode.iterm2.plist
  echo "symlink created ${DOTPATH}/etc/iterm/Preferences/com.googlecode.iterm2.plist -> ${HOME}/Documents/Preferences/com.googlecode.iterm2.plist"
  echo
}
