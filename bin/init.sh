#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0) && pwd)
source ${CURRENT}/share.sh
source ${CURRENT}/brew.sh
source ${CURRENT}/setup_prezto.sh
source ${CURRENT}/createsymlinks.sh
source ${CURRENT}/setup_tmux.sh
source ${CURRENT}/asdf.sh
source ${CURRENT}/nvim.sh
source ${CURRENT}/iterm.sh


install_brew_bundle
install_prezto
install_tmux_powerline
link_rc_files
create_preference_dir
install_asdf_vms
