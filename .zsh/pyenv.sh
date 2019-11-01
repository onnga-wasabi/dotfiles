export PYENV_ROOT=${HOME}/.pyenv
export PATH=${HOME}/.pyenv/bin:${PATH}
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv rehash
