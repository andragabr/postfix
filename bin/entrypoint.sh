#!/bin/bash
function waitpid()
{
  for pid in "$@"; do
    while kill -0 "$pid" 2> /dev/null; do
      sleep 0.5
    done
  done
}

export KAIGARA_METADATA=${KAIGARA_METADATA-/etc/kaigara/metadata}

if [[ -e ${KAIGARA_METADATA} ]]; then
  kaigara provision
fi

if [[ $# -ne 0 ]]; then
  exec $@
else
  trap "postfix stop" SIGINT SIGTERM
  trap "postfix reload" SIGHUP
  postfix start
  waitpid $(< /var/spool/postfix/pid/master.pid)
fi
