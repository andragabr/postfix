#!/bin/bash

if [[ -f /etc/kaigara/metadata.yml ]]; then
  kaigara provision
fi

if [[ $# -eq 1 ]]; then

  # if `docker run` only has one arguments
  # we assume user is running alternate command like `bash` to inspect the image
  exec "$@"

else
  function waitpid()
  {
    for pid in "$@"; do
      while kill -0 "$pid" 2> /dev/null; do
        sleep 0.5
      done
    done
  }

  trap "postfix stop" SIGINT SIGTERM
  trap "postfix reload" SIGHUP
  postfix start
  waitpid $(< /var/spool/postfix/pid/master.pid)
fi
