#!/bin/bash
set -e

DOTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR=${HOME}/src

source setup/config.sh
source setup/dotfiles.sh
source setup/packages.sh
source setup/src.sh

pushd ${DOTS_DIR}
git submodule update --init --recursive
popd

export DOTS_HOSTNAME=gordon

config_root_password
config_hostname
config_firewall
install_dotfiles
install_packages
install_srcs
config_docker
config_libvirt
config_vim
config_ccache
