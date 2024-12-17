#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Please provide one argument."
  echo "Usage modsrv-create-session <Server Name>"
  exit 1
fi

if [ "$(docker ps -q -f name=modsrv-$1)" == "" ]; then
  echo "Server container is not running"
  exit 1
fi

tmux new-session -s modsrv-$1 -n "十月模組伺服器[$1]" "docker attach modsrv-$1"

