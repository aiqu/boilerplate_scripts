#!/usr/bin/env bash

SCRIPT_ROOT=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
CONF_FILE="$SCRIPT_ROOT/conf_db.sh"
if [ ! -r $CONF_FILE ];then
  echo "Cannot read $CONF_FILE"
  exit 1
fi

. $CONF_FILE

if [ ! -f $CONF_FILE ];then
  initdb -D $DATA_DIR ${SUPERUSER:+"-U $SUPERUSER"}
  sed -i 's/#listen_addresses = '"'"'localhost'"'"'/listen_addresses = '"'"'*'"'"'/' $CONF_FILE
  sed -i 's/#port = 5432/port = '$PORT'/' $CONF_FILE
fi

if [ -f $DATA_DIR/postmaster.pid ];then
  echo "Postgresql is already running"
else
  nohup postgres -D $DATA_DIR 2>&1 >> $LOG_FILE &
fi

sleep 1 && createdb $DBNAME 2>/dev/null
