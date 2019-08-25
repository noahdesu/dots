#!/bin/bash
set -e

function _git_clone {
  local origin=${1}
  shift

  if [[ ! ${origin} =~ \/([a-zA-Z0-9\_\.\-]+)\.git ]]; then
    echo "invalid repo: ${origin}"
    exit 1
  fi

  local destdir=${SRC_DIR}/${BASH_REMATCH[1]}
  if [ ! -d "${destdir}" ]; then
    local staging_dir=$(mktemp -d)
    # clone upstream
    git clone ${origin} ${staging_dir} || return 0
    pushd ${staging_dir}
    git submodule update --init --recursive
    # add remotes
    while (( "$#" >= 2 )); do
      git remote add ${1} ${2}
      shift; shift
    done
    git fetch --all || return 0
    popd
    # ship it
    mv ${staging_dir} ${destdir}
  fi
}

function install_srcs {
  _git_clone git@github.com:noahdesu/kubensis.git
  _git_clone https://github.com/smfrpc/smf.git \
    nw git@github.com:noahdesu/smf.git
}
