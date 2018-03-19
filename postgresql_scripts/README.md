# Postgresql operation script

#### conf_db.sh
- start_db.sh use it for postgresql configuration (datafolders, ports, users, etc...)  
- source it to set postgresql env variable
```
source conf_db.sh
# by using conf_db.sh, you can simply run psql without messy parameters
psql
```

#### start_db.sh  
- First, initialize & run postgresql server as configured in conf_db.sh if not exists.
- Finally, create database if not exists.

#### stop_db.sh
- Stop postgresql server daemon if running.

#### monitor_db.sh
- Show log file using *watch* command
