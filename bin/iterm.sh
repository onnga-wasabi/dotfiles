#!/usr/bin/env bash

CURRENT=$(cd $(dirname $0) && pwd)
source ${CURRENT}/share.sh

create_preference_dir() {
  echo "Createing Preference dir..."
  mkdir -p ${HOME}/Documents/Preferences
  echo "Created!"
}
