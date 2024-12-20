if [ $# -lt 1 ]; then
  echo "Please provide an action"
  echo "Usage modsrv <Action>"
  echo "Available actions: init, start, create-session"
  exit 1
fi

if [[ "$1" == "init" ]]; then
  shift
  "$(dirname "${BASH_SOURCE[0]}")"/modsrv-init.sh $@
fi

if [[ "$1" == "start" ]]; then
  shift
  "$(dirname "${BASH_SOURCE[0]}")"/modsrv-start.sh $@
fi

if [[ "$1" == "create-session" ]]; then
  shift
  "$(dirname "${BASH_SOURCE[0]}")"/modsrv-create-session.sh $@
fi
