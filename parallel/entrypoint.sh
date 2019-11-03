#! /bin/sh -e

mkdir -p /root/.parallel/ && touch /root/.parallel/will-cite
LD_LIBRARY_PATH="/parallel/lib" exec /parallel/parallel "$@"
