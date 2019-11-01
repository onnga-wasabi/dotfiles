#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export LC_CTYPE="en_US.UTF-8"

export DOTPATH=${HOME}/dotfiles
export PATH=${DOTPATH}/bin:${PATH}

source ${DOTPATH}/.zsh/pyenv.sh
source ${DOTPATH}/.zsh/neovim.sh
source ${DOTPATH}/.zsh/nvm.sh

# lscolors
export lscolors=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# PIPENV
export PIPENV_VENV_IN_PROJECT=1

export PATH=${HOME}/local/bin:${PATH}
export LD_LIBRARY_PATH=${HOME}/local/lib:${LD_LIBRARY_PATH}
export TERM=screen-256color

if [ -e ${HOME}/.zsh_local.sh ]
then
  source ${HOME}/.zsh_local.sh
fi
