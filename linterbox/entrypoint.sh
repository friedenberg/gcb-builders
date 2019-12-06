#! /bin/sh -e

parallel --keep-order --line-buffer -N2 /bin/run.sh ::: "$@"
