install_ubuntu_utils () {
  echo "Installing ubuntu utils..."
  INIT_REQUIRED_FLAG=0
  for package in curl wget git tig tmux
  do
    if [ -z `which ${package}` ]
    then
      INIT_REQUIRED_FLAG=1
    fi
  done

  if [ $INIT_REQUIRED_FLAG = 1 ]
  then
    sudo apt-get update -qq > /dev/null
    sudo apt-get install -qq -y locales > /dev/null
    sudo locale-gen en_US.UTF-8 > /dev/null
    sudo apt-get install -qq -y curl wget git tig tmux > /dev/null
    echo "Installed!"
  else
    echo "Already initialized!"
  fi
}

install_zsh () {
  echo "Installing zsh..."
  if [ -z `which zsh` ]
  then
    sudo apt-get update -qq
    sudo apt-get install -qq -y zsh > /dev/null
    echo "Installed!"
  else
    sudo chsh $USER -s $(which zsh)
    echo "Already installed!"
  fi
}

install_pyenv_requirements () {
  echo "Installing pyenv requirements..."
  if [ ! -e ${HOME}/.pyenv ]
  then
    sudo apt-get update -qq
    sudo DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends\
      make build-essential libssl-dev zlib1g-dev libbz2-dev\
      libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev\
      xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev > /dev/null
    echo "Installed!"
  else
    echo "Already installed!"
  fi
}

install_neovim () {
  echo "Installing neovim..."
  if [ ! -e ${DOTPATH}/bin/squashfs-root ]
  then
    cd $(mktemp -d)
    wget --quiet https://github.com/neovim/neovim/releases/download/v0.4.2/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract > /dev/null
    cp -r ./squashfs-root ${DOTPATH}/bin/
    mkdir -p ${HOME}/.config/nvim
    ln -s ${DOTPATH}/.init.vim ${HOME}/.config/nvim/init.vim
    echo "Installed!"
  else
    echo "Already installed!"
  fi
}
