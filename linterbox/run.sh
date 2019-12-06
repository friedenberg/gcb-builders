#! /bin/sh -e

PARALLEL_COMMAND="parallel --keep-order --line-buffer -N1"
PROGRAM="$1"
FILES="$2"

shift

PROGRAM="/bin/wrapper.sh $PROGRAM"

if [[ find = "${FILES%% *}" ]]; then
  set -o noglob
  $FILES | $PARALLEL_COMMAND "$PROGRAM"
else
  $PARALLEL_COMMAND "$PROGRAM" ::: $FILES
fi
