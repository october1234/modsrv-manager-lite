source ./.modsrv-conf.sh

if [ $# -lt 1 ]; then
  echo "Please provide one argument."
  echo "Usage modsrv-start <Server Name>"
  exit 1
fi

if [ ! -d "$SERVER_FILES_DIR/$1" ]; then
  echo "Server files not found, please init server first: $SERVER_FILES_DIR/$1"
fi

docker run -it -d --rm --name modsrv-$1 \
-l mc-router.host=$(cat "$SERVER_FILES_DIR/$1/.mc-router-host") \
-v "$SERVER_FILES_DIR/$1":"/minecraft-server" \
--network minecraft \
"eclipse-temurin:$(cat "$SERVER_FILES_DIR/$1/.java-version")-jre-alpine" /bin/sh -c "cd /minecraft-server && /minecraft-server/$(cat "$SERVER_FILES_DIR/$1/.start-script-name")"

./modsrv-create-session.sh $1
