install_powerline_fonts () {
  echo "Installing powerline fonts..."
  if [ -z `which zsh` ]
  then
    cd $(mktemp -d)
    git clone -q https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
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

  ln -sf ${DOTPATH}/.zsh/.z* ${HOME}/ && echo "symlink created ${HOME}/.z* -> ${DOTPATH}/.zsh/.z*"
  ln -sf ${DOTPATH}/.zsh/prezto/prompt_agnoster_setup ${HOME}/.zprezto/modules/prompt/functions/prompt_agnoster_setup && \
    echo "symlink created ${HOME}/.zsh/prezto/modules/prompt/functions/prompt_agnoster_setup"
    echo "-> ${DOTPATH}/.zprezto/modules/prompt/functions/prompt/functions/prompt_agnoster_setup"
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
    echo "Installed!"
  else
    echo "Already installed!"
  fi
}
