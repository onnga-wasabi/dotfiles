#!/bin/bash

for f in ${DOTPATH}/.??*
do
  [[ "$f" == "${DOTPATH}/.git" ]] && continue
  [[ "$f" == "${DOTPATH}/.DS_Store" ]] && continue
  [[ "$f" == "${DOTPATH}/.zsh" ]] && continue
  [[ "$f" == "${DOTPATH}/.vim" ]] && continue
  [[ "$f" == "${DOTPATH}/.init.vim" ]] && continue

  echo "$f"
  ln -sf $f ${HOME}/
done


mkdir -p ${HOME}/.config/nvim
ln -sf ${DOTPATH}/.init.vim ${HOME}/.config/nvim/init.vim

mkdir -p ${HOME}/.cache/dein/plugs
ln -sf ${DOTPATH}/.vim/plug/dein.toml ${HOME}/.cache/dein/plugs/dein.toml
ln -sf ${DOTPATH}/.vim/plug/lazy_dein.toml ${HOME}/.cache/dein/plugs/lazy_dein.toml
