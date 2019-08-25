#!/bin/bash
set -e

function _fetch_exe {
  local url=${2}
  local exe=${HOME}/bin/${1}
  test -d ${HOME}/bin || mkdir ${HOME}/bin
  if [ ! -x ${exe} ]; then
    curl -Lo ${exe} ${url}
    chmod +x ${exe}
  fi
}

function install_packages {
  sudo dnf upgrade -y

  for name in google-chrome; do
    sudo cp ${DOTS_DIR}/setup/${name}.repo /etc/yum.repos.d/${name}.repo
  done

  sudo dnf install -y \
    ccache \
    cmake \
    ctags \
    docker \
    docker-compose \
    fzf \
    gcc-c++ \
    git \
    golang \
    google-chrome-stable \
    libu2f-host \
    make \
    python3-devel \
    the_silver_searcher \
    tmux \
    vim-enhanced
}
