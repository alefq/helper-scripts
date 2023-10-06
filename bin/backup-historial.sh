#!/bin/bash
# Copia el historial y luego crea un archivo sin duplicados
# desde donde luego se puede consultar con el comando Buscar.sh
#
# afeltes@sodep.com.py
#

STAMP="`date +%F`"
FLAG="/tmp/$(date +%Y-%m-%d-%H-%M)"
echo $FLAG
DIR="$HOME/sysadmin/historicos-bash"
if [ -f ${FLAG}.tmp ]; then
	logger "HISTORY ${FLAG}"
	exit 0
else 
	if [ ! -d $DIR ]; then
		mkdir -pv $DIR
	fi
	touch ${FLAG}.tmp
	cp -vf $HOME/.bash_history $DIR/history-${STAMP}
	cd $DIR
	echo "" > /tmp/history-global-$UID
	chmod -v 0600 /tmp/history-global-$UID
	find -maxdepth 1 -type f -print0 | xargs -0 cat | strings | sort | uniq   >> /tmp/history-global-$UID
	mv -vf /tmp/history-global-$UID .
	rm -v ${FLAG}.tmp
fi

