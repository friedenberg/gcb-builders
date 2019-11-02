#! /bin/sh -e

EXIT_STATUS=0

PROGRAM=$1

shift

case ${PROGRAM%% *} in

  shellcheck | hadolint) ;;

  *)
    exec "$PROGRAM"
    exit $?
    ;;

esac

# shellcheck disable=SC2068
for FILE in $@; do
  if ! ($PROGRAM "$FILE"); then
    EXIT_STATUS=1
  fi
done

exit $EXIT_STATUS
