#!/usr/bin/env bash

set -e

SCRIPT_ROOT=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
CONF_FILE="$SCRIPT_ROOT/conf_db.sh"
if [ ! -r $CONF_FILE ];then
  echo "Cannot read $CONF_FILE"
  exit 1
fi

. $CONF_FILE

if [ ! -f $DBCONF_FILE ];then
  initdb -D $DATA_DIR ${SUPERUSER:+"-U $SUPERUSER"}
  sed -i 's/#listen_addresses = '"'"'localhost'"'"'/listen_addresses = '"'"'*'"'"'/' $DBCONF_FILE
  if [ ! -z $PORT ];then
    sed -i 's/#port = 5432/port = '$PORT'/' $DBCONF_FILE
  fi
  if [ ! -z $SHARED_BUFFERS ];then
    sed -i 's/shared_buffers = 128MB/shared_buffers = '$SHARED_BUFFERS'/' $DBCONF_FILE
  fi
  if [ ! -z $TEMP_BUFFERS ];then
    sed -i 's/#\?temp_buffers = 8MB/temp_buffers = '$TEMP_BUFFERS'/' $DBCONF_FILE
  fi
  if [ ! -z $WORK_MEM ];then
    sed -i 's/#\?work_mem = 4MB/work_mem = '$WORK_MEM'/' $DBCONF_FILE
  fi
fi

if [ -f $DATA_DIR/postmaster.pid ];then
  echo "Postgresql is already running"
else
  nohup postgres -D $DATA_DIR 2>&1 >> $LOG_FILE &
fi

sleep 1 && createdb $DBNAME 2>/dev/null
