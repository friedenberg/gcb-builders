#! /bin/sh -e

PROGRAM=$1

shift

case ${PROGRAM%% *} in

  shellcheck | hadolint) ;;

  *)
    exec $PROGRAM $@
    exit $?
    ;;

esac

echo $@ | xargs -n 1 -P 8 $PROGRAM
