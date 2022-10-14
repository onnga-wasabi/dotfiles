#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0) && pwd)
source ${CURRENT}/share.sh

install_asdf_vms () {
  export ASDF_HASHICORP_OVERWRITE_ARCH=amd64
  . $(brew --prefix asdf)/libexec/asdf.sh

  ENABLE_PLUGINS=(`cat ${DOTPATH}/tool-versions | cut -d ' ' -f 1`)
  for plugin in "${ENABLE_PLUGINS[@]}"
  do
    github_url=""
    if [ "${plugin}" == "coursier" ]; then
      github_url="https://github.com/onnga-wasabi/asdf-coursier"
    elif [ "${plugin}" == "lazydocker" ];; then
      github_url="https://github.com/comdotlinux/asdf-lazydocker"
    fi
    echo "Plugin add ${plugin} ${github_url}"
    asdf plugin add ${plugin} ${github_url}
  done

  echo "Installing asdf VMs..."
  asdf install

  for plugin in "${ENABLE_PLUGINS[@]}"
  do
    asdf reshim ${plugin}
  done
  echo
}
