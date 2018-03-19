#!/usr/bin/env bash

DATA_DIR="$HOME/data/postgresql"
CONF_FILE="$DATA_DIR/postgresql.conf"
PORT=10100
LOG_FILE="$HOME/data/postgresql/server.log"
PID_FILE="$DATA_DIR/postmaster.pid"
DBNAME="visual_localization"
SUPERUSER=""

# define PG* environment variable
export PGPORT=$PORT
export PGDATABASE=$DBNAME
export USER=$SUPERUSER
