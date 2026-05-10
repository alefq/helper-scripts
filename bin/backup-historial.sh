#!/bin/bash
# Copia el historial y luego crea un archivo sin duplicados
# desde donde luego se puede consultar con el comando Buscar.sh
#
# afeltes@sodep.com.py
#

STAMP="$(date +%F)"
DIR="$HOME/sysadmin/historicos-bash"
BITACORA="$DIR/.ultimo-backup"

if [ ! -d "$DIR" ]; then
	mkdir -pv "$DIR"
fi

if [ -f "$BITACORA" ] && [ "$(cat "$BITACORA")" = "$STAMP" ]; then
	logger "HISTORY backup ya realizado hoy $STAMP, omitiendo."
	exit 0
fi

cp -vf "$HOME/.bash_history" "$DIR/history-${STAMP}"
cd "$DIR"
echo "" > /tmp/history-global-$UID
chmod -v 0600 /tmp/history-global-$UID
find -maxdepth 1 -type f -not -name '.ultimo-backup' -print0 | xargs -0 cat | strings | sort | uniq >> /tmp/history-global-$UID
mv -vf /tmp/history-global-$UID .
echo "$STAMP" > "$BITACORA"
logger "HISTORY backup completado: $STAMP"

