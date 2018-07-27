#!/usr/bin/env bash

DATA_DIR=${DATA_DIR:-"$HOME/data/postgresql"}
DBCONF_FILE=${DBCONF_FILE:-"$DATA_DIR/postgresql.conf"}
PORT=${PORT:-10100}
LOG_FILE=${LOG_FILE:-"$DATA_DIR/server.log"}
PID_FILE=${PID_FILE:-"$DATA_DIR/postmaster.pid"}
DBNAME=${DBNAME:-"mydatabase"}
SUPERUSER=${SUPERUSER}
SHARED_BUFFERS=${SHARED_BUFFERS}
TEMP_BUFFERS=${TEMP_BUFFERS}
WORK_MEM=${WORK_MEM}

# define PG* environment variable
export PGPORT=$PORT
export PGDATABASE=$DBNAME
export USER=$SUPERUSER
