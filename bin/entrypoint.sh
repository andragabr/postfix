#!/bin/bash

if [[ -f /etc/kaigara/metadata.yml ]]; then
  kaigara provision
fi

if [[ $# -eq 1 ]]; then

  # if `docker run` only has one arguments
  # we assume user is running alternate command like `bash` to inspect the image
  exec "$@"

else
  echo "default command missing"
  exit 1
fi
