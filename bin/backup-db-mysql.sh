#!/bin/bash
. backup-common.sh
DB_NAME=""
DB_PASWORD=""
DB_USER=""
DESTINO_SQL=$HOME/backup/${DB_NAME}-${TIMESTAMP}.sql

if [ ! -d $DESTINO_SQL ]; then
  mkdir -pv $DESTINO_SQL
fi
mysqldump --opt --password=${DB_PASWORD} --user=${DB_USER} ${DB_NAME} > $DESTINO_SQL

