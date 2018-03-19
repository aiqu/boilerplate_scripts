#!/usr/bin/env bash

SCRIPT_ROOT=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
CONF_FILE="$SCRIPT_ROOT/conf_db.sh"
if [ ! -r $CONF_FILE ];then
  echo "Cannot read $CONF_FILE"
  exit 1
fi

. $CONF_FILE

if [ ! -r $PID_FILE ];then
  echo "Cannot read postgresql server pid file"
  exit 1
fi

kill $(cat $PID_FILE | head -n1)
