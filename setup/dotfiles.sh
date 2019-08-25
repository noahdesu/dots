#!/bin/bash
set -e

DOTFILES="
  .gitconfig
  .gitignore_global
  .tmux.conf
  .vim
  .vimrc
"

function install_dotfiles {
  for dotfile in ${DOTFILES}; do
    link=${HOME}/${dotfile}
    target=${DOTS_DIR}/${dotfile}
    if [ "$(readlink ${link})" != ${target} ]; then
      rm -f ${link}
      ln -s ${DOTS_DIR}/${dotfile} ${link}
    fi
  done
}
