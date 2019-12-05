#! /bin/sh -e

PROGRAM=$1
#extract name of program without glob
PROGRAM_NAME=${PROGRAM%% *}

shift

PROGRAM="/bin/wrapper.sh $PROGRAM"

case "$PROGRAM_NAME" in

  shellcheck | hadolint | kubeval)
    if [[ find = "${1%% *}" ]]; then
      set -o noglob
      $* | parallel "$PROGRAM"
    else
      parallel "$PROGRAM" ::: $*
    fi
    ;;

  *)
    "$PROGRAM" $*
    ;;

esac

