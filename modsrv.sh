if [ $# -lt 1 ]; then
  echo "Please provide an action"
  echo "Usage modsrv <Action>"
  echo "Available actions: init, start, create-session"
  exit 1
fi

SCRIPT_FOLDER="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

if [[ "$1" == "init" ]]; then
  shift
  $SCRIPT_FOLDER/modsrv-init.sh $@
fi

if [[ "$1" == "start" ]]; then
  shift
  $SCRIPT_FOLDER/modsrv-start.sh $@
fi

if [[ "$1" == "create-session" ]]; then
  shift
  $SCRIPT_FOLDER/modsrv-create-session.sh $@
fi
