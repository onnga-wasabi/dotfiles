install_powerline_fonts () {
  echo "Installing powerline fonts..."
  if [ -z `which zsh` ]
  then
    cd $(mktemp -d)
    git clone -q https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ${HOME}
    echo "Installed!"
  else
    echo "Already installed!"
  fi
}

install_pyenv () {
  echo "Installing pyenv & pyenv-virtualenv..."
  if [ ! -e ${HOME}/.pyenv ]
  then
    if [ -z  $1 ]
    then
      BASE_PTHON_VIRSION=3.7.3
    else
      BASE_PTHON_VIRSION=$1
    fi

    PYENV_ROOT=${HOME}/.pyenv
    PYENV_VIRTUAL=${PYENV_ROOT}/plugins/pyenv-virtualenv

    git clone -q https://github.com/pyenv/pyenv.git ${PYENV_ROOT}
    git clone -q https://github.com/pyenv/pyenv-virtualenv.git ${PYENV_VIRTUAL}
    echo "Installed!"

    echo "Installing python-${BASE_PTHON_VIRSION}..."
    source ${DOTPATH}/.zsh/pyenv.sh
    env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install ${BASE_PTHON_VIRSION}
    pyenv global ${BASE_PTHON_VIRSION}
    echo "Installed!"
  else
    echo "Already installed!"
  fi
}

install_nvm () {
  echo "Installing nvm..."
  if [ ! -e ${HOME}/.nvm ]
  then
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

    source ${DOTPATH}/.zsh/nvm.sh
    nvm install --lts
    nvm use --lts
    echo "Installed!"
  else
    echo "Already installed!"
  fi
}

install_zprezto () {
  echo "Installing zprezto..."
  if [ ! -e ${HOME}/.zlogin ]
  then
    git clone -q --recursive https://github.com/sorin-ionescu/prezto.git ${HOME}/.zprezto
    for rcfile in ${HOME}/.zprezto/runcoms/*
    do
      rcfile_name=`basename ${rcfile}`
      if [ ${rcfile_name} != "README.md" ]
      then
        ln -s $rcfile ${HOME}/.${rcfile_name}
      fi
    done
    echo "Installed!"
  else
    echo "Already installed!"
  fi

  ln -sf ${DOTPATH}/.zshrc ${HOME}/.zshrc && echo "symlink created ${HOME}/.zshrc -> ${DOTPATH}/.zshrc"
  ln -sf ${DOTPATH}/.zpreztorc ${HOME}/.zpreztorc && echo "symlink created ${HOME}/.zpreztorc -> ${DOTPATH}/.zpreztorc"
  ln -sf ${DOTPATH}/.zsh/prezto/prompt_agnoster_setup ${HOME}/.zprezto/modules/prompt/functions/prompt_agnoster_setup && \
    echo "symlink created ${HOME}/.zsh/prezto/modules/prompt/functions/prompt_agnoster_setup"
    echo "-> ${DOTPATH}/.zprezto/prompt_agnoster_setup"
}

install_dein() {
  echo "Installing dein..."
  if [ ! -e ${HOME}/.cache/dein ]
  then
    cd $(mktemp -d)
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    mkdir -p ${HOME}/.cache/dein/plugs
    ln -s ${DOTPATH}/.vim/plug/dein.toml ${HOME}/.cache/dein/plugs/dein.toml
    ln -s ${DOTPATH}/.vim/plug/lazy_dein.toml ${HOME}/.cache/dein/plugs/lazy_dein.toml
    cd ${HOME}
    echo "Installed!"
  else
    echo "Already installed!"
  fi
}

install_tmux () {
  echo "Installing tmux..."
  if [ ! `which tmux` == "${HOME}/local/bin/tmux" ]
  then
    install_libevent
    install_ncurses
    cd $(mktemp -d)
    VERSION="2.8"
    wget -q https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz -O tmux.tar.gz
    mkdir tmux && tar -xzf tmux.tar.gz -C tmux --strip-components 1
    cd tmux
    PKG_CONFIG_PATH=${HOME}/local/lib/pkgconfig ./configure --prefix=${HOME}/local > /dev/null
    make > /dev/null
    make install > /dev/null
    cd ${HOME}
    echo "Installed!"
  else
    echo "Already installed!"
  fi
}

install_libevent () {
    echo "Preparing libevent..."
    cd $(mktemp -d)
    VERSION="2.1.11-stable"
    wget -q https://github.com/libevent/libevent/releases/download/release-${VERSION}/libevent-${VERSION}.tar.gz -O libevent.tar.gz
    mkdir libevent && tar -xzf libevent.tar.gz -C libevent --strip-components 1
    cd libevent
    ./configure --prefix=${HOME}/local > /dev/null
    make > /dev/null
    make install > /dev/null
}

install_ncurses () {
    echo "Preparing ncurses..."
    cd $(mktemp -d)
    VERSION="6.1"
    wget -q ftp://ftp.invisible-island.net/ncurses/ncurses-${VERSION}.tar.gz -O ncurses.tar.gz
    mkdir ncurses && tar -xzf ncurses.tar.gz -C ncurses --strip-components 1
    cd ncurses
    ./configure --prefix=${HOME}/local > /dev/null
    make > /dev/null
    make install > /dev/null
}
install_tmux
