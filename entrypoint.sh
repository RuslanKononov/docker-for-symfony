#!/bin/sh

## Do whatever you need with env vars here ...

/usr/local/bin/setup.sh 1001 1001 www-data

# default behaviour is to launch nginx
if test -z "${1}" ; then
  echo "Starting nginx..."
  exec $(which nginx) -c /etc/nginx/nginx.conf -g "daemon off;" ${EXTRA_ARGS}
else
  # Hand off to the CMD
  exec "$@"
fi
