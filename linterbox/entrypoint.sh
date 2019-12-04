#! /bin/sh -e

PROGRAM=$1
PROGRAM_NAME=${PROGRAM%% *}

shift

#extract name of program without glob
case "$PROGRAM_NAME" in

  shellcheck | hadolint | kubeval)
    parallel "$PROGRAM_NAME" ::: $*
    exit $?
    ;;

  *)
    exec "$PROGRAM" $*
    exit $?
    ;;

esac

