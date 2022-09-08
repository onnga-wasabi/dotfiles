#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0) && pwd)
source ${CURRENT}/share.sh

install_asdf_vms () {
  export ASDF_HASHICORP_OVERWRITE_ARCH=amd64
  . $(brew --prefix asdf)/libexec/asdf.sh

  ENABLE_PLUGINS=(`cat ${DOTPATH}/tool-versions | cut -d ' ' -f 1`)
  for plugin in "${ENABLE_PLUGINS[@]}"
  do
    echo "Plugin add ${plugin}"
    asdf plugin add ${plugin}
  done

  echo "Installing asdf VMs..."
  asdf install

  for plugin in "${ENABLE_PLUGINS[@]}"
  do
    asdf reshim ${plugin}
  done
  echo
}
