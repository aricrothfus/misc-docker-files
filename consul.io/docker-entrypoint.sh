#!/bin/bash
set -e
echo "$@"
if [ "$1" = 'consul' ]; then
  echo "ccc $@"
    exec /usr/local/consul/consul "$@"
fi

exec "$@"
