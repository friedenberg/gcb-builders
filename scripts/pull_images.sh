#! /bin/bash -e

BRANCH_NAME=$1
export BRANCH_NAME

shift

dockerpullone() {
  docker pull "$@" || true
}

dockerpullboth() {
  parallel --line-buffer dockerpullone \
    ::: "$*:master" "$*:$BRANCH_NAME"
}

export -f dockerpullone
export -f dockerpullboth

parallel --line-buffer dockerpullboth \
  ::: "$@"
