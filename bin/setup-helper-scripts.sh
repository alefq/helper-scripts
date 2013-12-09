#!/bin/bash
. ../conf/vars
if [ -d $HOME/bin ]; then
	mkdir -pv $HOME/bin
fi
echo "# START - helper-scripts stuff"
echo "HS_HOME=$HS_HOME"
export "HS_HOME"
echo "PATH=\$PATH:\$HS_HOME/bin:\$HS_HOME/sbin"
echo "export PATH HS_HOME"
echo "\$HS_HOME/bin/backup-historial.sh > \$HOME/.historial-${UID}.log & "
echo "# END - helper-scripts stuff"


