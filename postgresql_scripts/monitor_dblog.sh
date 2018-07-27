#!/usr/bin/env bash

SCRIPT_ROOT=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
CONF_FILE="$SCRIPT_ROOT/conf_db.sh"
if [ ! -r $CONF_FILE ];then
  echo "Cannot read $CONF_FILE"
  exit 1
fi

. $CONF_FILE

watch -n0.1 tail -n50 $LOG_FILE
