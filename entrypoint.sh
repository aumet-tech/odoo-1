#!/bin/bash

set -e
#pip3 install -r requirements.txt
which python

# set the postgres database host, port, user and password according to the environment
# and pass them as arguments to the odoo process if not present in the config file
: ${HOST:=${DB_PORT_5432_TCP_ADDR:='db'}}
: ${PORT:=${DB_PORT_5432_TCP_PORT:=5432}}
: ${USER:=${DB_ENV_POSTGRES_USER:=${POSTGRES_USER:='odoo'}}}
: ${PASSWORD:=${DB_ENV_POSTGRES_PASSWORD:=${POSTGRES_PASSWORD:='odoo'}}}
echo $HOST
echo $PORT
echo $USER
echo $PASSWORD
DB_ARGS=()

POSTGRES_PASSWORD='aumit-password'
POSTGRES_USER='aumit-user'
DB_PORT_5432_TCP_ADDR='127.0.0.1'
DB_PORT_5432_TCP_PORT=5432


function check_config() {
    param="$1"
    value="$2"
    if grep -q -E "^\s*\b${param}\b\s*=" "$ODOO_RC" ; then
        value=$(grep -E "^\s*\b${param}\b\s*=" "$ODOO_RC" |cut -d " " -f3|sed 's/["\n\r]//g')
    fi;
    DB_ARGS+=("--${param}")
    DB_ARGS+=("${value}")
}
check_config "db_host" "$DB_PORT_5432_TCP_ADDR"
check_config "db_port" "$DB_PORT_5432_TCP_PORT"
check_config "db_user" "$POSTGRES_USER"
check_config "db_password" "$POSTGRES_PASSWORD"

odoo --db_host="aumet-postgres" --db_port="5432" --db_user="aumet-user" --db_password="aumet-password" -i base

exit 1