#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0) && pwd)
source ${CURRENT}/share.sh

install_asdf_vms () {
  export ASDF_HASHICORP_OVERWRITE_ARCH=amd64
  . $(brew --prefix asdf)/libexec/asdf.sh

  cat ${DOTPATH}/tool-versions |  while read line
  do
    set ${line}
    plugin=${1}
    version=${2}
    github_url=""

    if [ "${plugin}" == "coursier" ]; then
      github_url="https://github.com/onnga-wasabi/asdf-coursier"
    elif [ "${plugin}" == "lazydocker" ]; then
      github_url="https://github.com/comdotlinux/asdf-lazydocker"
    fi

    echo "Plugin add ${plugin} ${github_url}"
    asdf plugin add ${plugin} ${github_url}

    echo "Install ${plugin} ${version}"
    asdf install ${plugin} ${version}
    asdf reshim ${plugin}
  done
}

