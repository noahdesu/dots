#!/bin/bash
set -e

function config_root_password {
  sudo passwd -l root
}

function config_firewall {
  local curr=$(firewall-cmd --get-default-zone)
  if [ "x$curr" != "xdrop" ]; then
    sudo firewall-cmd --set-default-zone drop
  fi
}

function config_hostname {
  hostnamectl set-hostname ${DOTS_HOSTNAME}
}

function config_docker {
  if ! systemctl is-enabled docker.service; then
    sudo systemctl enable docker
    sudo systemctl start docker
  fi

  if ! getent group docker > /dev/null; then
    sudo groupadd docker
  fi

  sudo usermod -aG docker ${USER}
}

function config_libvirt {
  sudo usermod -aG libvirt ${USER}
}

function config_vim {
  vim +PluginInstall +qall
  vim +GoInstallBinaries +qall

  pushd ${DOTS_DIR}/.vim/bundle/YouCompleteMe
  python3 install.py --clangd-completer --clang-completer
  popd
}

function config_ccache {
  ccache -M 30G
}
