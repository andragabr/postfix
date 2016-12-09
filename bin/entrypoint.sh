#!/bin/bash

if [[ -f /etc/kaigara/metadata.yml ]]; then
  kaigara provision
fi

if [[ $# -eq 1 ]]; then

  # if `docker run` only has one arguments
  # we assume user is running alternate command like `bash` to inspect the image
  exec "$@"

else
  function anywait()
  {
    for pid in "$@"; do
      while kill -0 "$pid"; do
        sleep 0.5
      done
    done
  }

  trap "postfix stop" SIGINT SIGTERM
  trap "postfix reload" SIGHUP
  postfix start
  anywait $(< /var/spool/postfix/pid/master.pid)
fi
