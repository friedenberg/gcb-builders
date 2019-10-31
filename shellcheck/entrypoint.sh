#! /bin/sh -e

EXIT_STATUS=0

# shellcheck disable=SC2068
for FILE in $@; do
  if /shellcheck -x "$FILE"; then
    EXIT_STATUS=1
  fi
done

exit $EXIT_STATUS
