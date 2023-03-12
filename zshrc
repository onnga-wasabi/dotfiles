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
export LANG=en_US.UTF-8
export PATH="$(brew --prefix mysql-client)/bin:${PATH}"
export HOMEBREW_EDITOR='vim'


# Forcompilers
export OPENBLAS=$(brew --prefix openblas)
export PKG_CONFIG_PATH="$(brew --prefix openblas)/lib/pkgconfig"
export LD_LIBRARY_PATH="$(brew --prefix openblas):${LD_LIBRARY_PATH}"

# llvm
export LDFLAGS="-L$(brew --prefix llvm)/lib"
export CFLAGS="-I$(brew --prefix llvm)/include"
export CPPFLAGS="-I$(brew --prefix llvm)/include"
export LD_LIBRARY_PATH="$(brew --prefix llvm):${LD_LIBRARY_PATH}"

# openssl
export LDFLAGS="${LDFLAGS} -L$(brew --prefix openssl)/lib"
export CFLAGS="${CFLAGS} -I$(brew --prefix openssl)/include"
export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix openssl)/include"
export LD_LIBRARY_PATH="$(brew --prefix openssl):${LD_LIBRARY_PATH}"

# readline
export LDFLAGS="${LDFLAGS} -L$(brew --prefix readline)/lib"
export CFLAGS="${CFLAGS} -I$(brew --prefix readline)/include"
export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix readline)/include"
export LD_LIBRARY_PATH="$(brew --prefix readline):${LD_LIBRARY_PATH}"

autoload -Uz compinit
compinit

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS="di=36"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(brew --prefix llvm)/bin:$PATH"

# Aliases
alias ls='exa --icons --git -F'
alias l='exa -lhF --no-user --no-permissions --git'
alias la='l -a'
alias sed="gsed"
alias realpath='(){ls --no-icons $1(:a)}'
alias loadenv='(){set -a; source $1; set +a;}'
alias vim='echo "vimなんかありませーん, use n instead of vim"'
alias n=nvim
alias vimdiff='nvim -d'
export EDITOR=nvim
alias go=richgo
alias ks=k9s
alias k=kubectl
alias kc=kubectx
alias kn=kubens

# asdf
export ASDF_HASHICORP_OVERWRITE_ARCH=amd64
. $(brew --prefix asdf)/libexec/asdf.sh

## asdf completions
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $(asdf where terraform)/bin/terraform terraform
source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' menu select

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)"

## terraform
export GODEBUG=asyncpreemptoff=1

## Golang
export GOPATH=$(go env GOPATH)
export PATH="$PATH:${GOPATH}/bin"

## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!**/.git/*"'
export FZF_DEFAULT_OPTS="
    --height 80% --reverse --border=sharp --margin=0,1
    --color=light
"

# for finding files in current directories
export FZF_CTRL_T_COMMAND='rg --files --follow -g "!Library/*" --glob "!**/.git/*"'
export FZF_CTRL_T_OPTS="
    --preview 'bat  --color=always --style=header,grid {}'
    --preview-window=right:60%
"

export FZF_CTRL_R_OPTS="
    --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'
"
zd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# open in tmux pane
export FZF_TMUX=1
export FZF_TMUX_OPTS="-p 80%"


# kubectl completion
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
source <(kubectl completion zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/.local/share/gcloud/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/.local/share/gcloud/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/.local/share/gcloud/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/.local/share/gcloud/google-cloud-sdk/completion.zsh.inc"; fi


# load darwin files
if [ $(uname) = "Darwin" ]; then
  source ${HOME}/.zshrc_darwin
fi

# load local rc files
LOCAL_RC_FILE=${HOME}/.zshrc_local
if [ -e ${LOCAL_RC_FILE} ]; then
  source ${LOCAL_RC_FILE}
fi
