#!/bin/bash
STAMP="`date +%F`"
PGPASSWORD="mypassword"
DB_HOST="localhost"
DB_NAME="db_chat"
DB_USER="postgres"
echo -n "Starting postgres full backup: "
date
pg_dump --format=c --no-owner --no-privileges -h ${DB_HOST} -U ${DB_USER} ${DB_NAME} -f /opt/samba/backup/db_capa-${STAMP}.backup
echo -n "Backup finished."
date
