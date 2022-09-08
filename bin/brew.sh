#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0) && pwd)
source ${CURRENT}/share.sh

install_brew_bundle () {
  echo "Installing Brew Bundles..."
  cd ${DOTPATH}/etc/brew && brew bundle
  echo
}
