#!/bin/bash
set -e

if [ "$1" = 'consul' ]; then

    exec gosu /usr/local/consul/consul "$@"
fi

exec "$@"