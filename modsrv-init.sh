#!/bin/bash

source ./.modsrv-conf.sh

if [ $# -lt 5 ]; then
  echo "Please provide four arguments."
  echo "Usage modsrv-init <Server Name> <Java Version> <External Hostname> <Start Script Name> <Zip URL>"
  exit 1
fi

mkdir -p $SERVER_FILES_DIR/$1

docker run --rm --name modsrv-init-$1 \
-e OMSMS_SERVER_START_SCRIPT_NAME="$4" \
-e OMSMS_SERVER_DEPLOYMENT_VALUE="$5" \
-e OMSMS_SERVER_DEPLOYMENT_TYPE=ZIP \
-e OMSMS_SERVER_FILES_INIT='{"AllowFLight": true}' \
-v "$SERVER_FILES_DIR/$1":"/minecraft-server" \
ghcr.io/octoberserver/omsms-server-init:latest

echo "$2" > "$SERVER_FILES_DIR/$1/.java-version"
echo "$3" > "$SERVER_FILES_DIR/$1/.mc-router-host"
echo "$4" > "$SERVER_FILES_DIR/$1/.start-script-name"

./modsrv-start.sh $1
