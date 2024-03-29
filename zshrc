#/var/folders/hh/vrcl1wp93xxb5dpqkrl93r4m0000gn/T/python-build.20230401212955.12059 ~/dotfiles/etc/brew
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
export PATH="/opt/homebrew/bin:${PATH}"
export PATH="/opt/homebrew/sbin:${PATH}"
export PATH="$(brew --prefix mysql-client)/bin:${PATH}"
export HOMEBREW_EDITOR='vim'


# Forcompilers
OPENBLAS_PREFIX=$(brew --prefix openblas)
export OPENBLAS=${OPENSSL_PREFIX}
export PKG_CONFIG_PATH="${OPENSSL_PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}"

# llvm
LLVM_PREFIX=$(brew --prefix llvm)
export PATH="${LLVM_PREFIX}/bin:$PATH"
export LDFLAGS="${LDFLAGS} -L${LLVM_PREFIX}/lib"
export CFLAGS="${CFLAGS} -I${LLVM_PREFIX}/include"
export CPPFLAGS="${CPPFLAGS} -I${LLVM_PREFIX}/include"
export LD_LIBRARY_PATH="${LLVM_PREFIX}/lib:${LD_LIBRARY_PATH}"
export CC="clang"
export CXX="clang++"
export CXX_STANDARD="14"
export CMAKE_CXX_FLAGS="${CMAKE_CXX_FLAG} -std=c++14"

# boost
BOOST_PREFIX=$(brew --prefix boost)
export PATH="${BOOST_PREFIX}/bin:$PATH"
export LDFLAGS="${LDFLAGS} -L${BOOST_PREFIX}/lib"
export CFLAGS="${CFLAGS} -I${BOOST_PREFIX}/include"
export CPPFLAGS="${CPPFLAGS} -I${BOOST_PREFIX}/include"
export LD_LIBRARY_PATH="${BOOST_PREFIX}/lib:${LD_LIBRARY_PATH}"

# mecab
MECAB_PREFIX=$(brew --prefix mecab)
export PATH="${MECAB_PREFIX}/bin:${PATH}"
export LDFLAGS="${LDFLAGS} -L${MECAB_PREFIX}/lib"
export CFLAGS="${CFLAGS} -I${MECAB_PREFIX}/include"
export CPPFLAGS="${CPPFLAGS} -I${MECAB_PREFIX}/include"
export PKG_CONFIG_PATH="${MECAB_PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}"

# openssl
OPENSSL_PREFIX=$(brew --prefix openssl@1.1)
export PATH="${OPENSSL_PREFIX}/bin:${PATH}"
export LDFLAGS="${LDFLAGS} -L${OPENSSL_PREFIX}/lib"
export CFLAGS="${CFLAGS} -I${OPENSSL_PREFIX}/include"
export CPPFLAGS="${CPPFLAGS} -I${OPENSSL_PREFIX}/include"
export PKG_CONFIG_PATH="${OPENSSL_PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}"

autoload -Uz compinit
compinit

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS="di=36"

# asdf
export ASDF_HASHICORP_OVERWRITE_ARCH=amd64
. $(brew --prefix asdf)/libexec/asdf.sh

## asdf completions
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $(asdf where terraform)/bin/terraform terraform
source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' menu select

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

## terraform
export GODEBUG=asyncpreemptoff=1

## Golang
export GOPATH=$(go env GOPATH)
export PATH="$PATH:${GOPATH}/bin"

# go install するツールが動かないことがある
# こんなの初見無理ゲーすぎる
# https://note.sarisia.cc/entry/linuxbrew-go/#fnref:1:~:text=Go%20%E3%82%B3%E3%83%B3%E3%83%91%E3%82%A4%E3%83%A9%E3%81%AF%E3%80%81%E3%83%87%E3%83%95%E3%82%A9%E3%83%AB%E3%83%88%E3%81%A7%E3%82%B9%E3%82%BF%E3%83%86%E3%82%A3%E3%83%83%E3%82%AF%E3%83%AA%E3%83%B3%E3%82%AF%E3%81%95%E3%82%8C%E3%81%9F%E3%83%90%E3%82%A4%E3%83%8A%E3%83%AA%E3%82%92%E5%90%90%E3%81%8D%E5%87%BA%E3%81%99%E3%81%8C%E3%80%81%20cgo%20%E3%82%92%E7%94%A8%E3%81%84%E3%81%9F%E3%82%B3%E3%83%BC%E3%83%89%E3%81%8C%E5%90%AB%E3%81%BE%E3%82%8C%E3%81%A6%E3%81%84%E3%82%8B%E3%81%A8%E3%83%80%E3%82%A4%E3%83%8A%E3%83%9F%E3%83%83%E3%82%AF%E3%83%AA%E3%83%B3%E3%82%AF%E3%81%95%E3%82%8C%E3%81%9F%E3%83%90%E3%82%A4%E3%83%8A%E3%83%AA%E3%82%92%E5%87%BA%E5%8A%9B%E3%81%99%E3%82%8B%E3%82%89%E3%81%97%E3%81%841%E3%80%82
export CGO_ENABLED=0

## ffmpeg
export ASDF_FFMPEG_ENABLE="libmp3lame"

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
zgd() {
  local dir
  local workdir
  if [[ $1 ]] then;
      workdir=$1
  else
      workdir=${HOME}/"workspace"
  fi
  dir=$(rg --files --hidden --follow --glob "**/.git/*" $workdir | rev | cut -d '/' -f 3- | rev | sort | uniq | fzf +m) &&
  cd "$dir"
}

# open in tmux pane
export FZF_TMUX=1 export FZF_TMUX_OPTS="-p 80%"

# kubectl completion
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
source <(kubectl completion zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$(asdf where gcloud)/path.zsh.inc" ]; then . "$(asdf where gcloud)/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$(asdf where gcloud)/completion.zsh.inc" ]; then . "$(asdf where gcloud)/completion.zsh.inc"; fi

# 一番最後に共有を追加
export CFLAGS="$CFLAGS -I$(brew --prefix)/include"
export LDFLAGS="$LDFLAGS -L$(brew --prefix)/lib"


# load darwin files
if [ $(uname) = "Darwin" ]; then
  source ${HOME}/.zshrc_darwin
fi

# load local rc files
LOCAL_RC_FILE=${HOME}/.zshrc_local
if [ -e ${LOCAL_RC_FILE} ]; then
  source ${LOCAL_RC_FILE}
fi

export PATH="$HOME/.local/bin:$PATH"

# Aliases
alias exa="eza"
alias ls="exa --icons --git -F"
alias l="exa -lhF --no-user --no-permissions --git"
alias la="l -a"
alias sed="gsed"
alias realpath="(){ls --no-icons $1(:a)}"
alias loadenv="(){set -a; source $1; set +a;}"
alias vim='echo "vimなんかありませーん, use n instead of vim"'
alias n=nvim
alias vimdiff="nvim -d"
export EDITOR=nvim
alias ks=k9s
alias k=kubectl
alias kc=kubectx
alias kn=kubens
alias ta="tmux a"
alias go=richgo
