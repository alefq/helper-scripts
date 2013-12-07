#!/bin/bash
# Copia el historial y luego crea un archivo sin duplicados
# desde donde luego se puede consultar con el comando Buscar.sh
#
# afeltes@sodep.com.py
#

STAMP="`date +%F`"
DIR="$HOME/sysadmin/historicos-bash"
if [ ! -d $DIR ]; then
	mkdir -pv $DIR
fi
cp -vf $HOME/.bash_history $DIR/history-${STAMP}
cd $DIR
cat * | sort | uniq   > /tmp/history-global-$UID
mv -vf /tmp/history-global-$UID .


