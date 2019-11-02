#!/bin/zsh

source ${HOME}/.zshrc

is_exits () {
  if [ -e $1 ]
  then
      echo "OK: $1 exits."
  else
      echo "NG: $1 doesn't exit."
      exit 1
  fi
}

is_available () {
  if type $1 > /dev/null 2>&1
  then
    echo "OK: $1 is available."
  else
    echo "NG: $1 is not available."
    exit 1
  fi
}

assert () {
  echo $1
  if [ $1 = $2 ]
  then
    echo "OK: $1 is $2."
  else
    echo "NG: $1 is not $2."
    exit 1
  fi
}

is_exits "${HOME}/.zshrc"
# powerline
if [ "$(uname)" = "Darwin" ]
then
  font_dir="$HOME/Library/Fonts"
else
  font_dir="$HOME/.local/share/fonts"
fi
is_exits "${font_dir}"
is_available "pyenv"
is_available "node"
is_available "nvim"
assert "`tmux -V`" "tmux 2.8"
