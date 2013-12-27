#!/bin/bash
HS_HOME=/opt/helper-scripts
if [ -d $HOME/bin ]; then
	mkdir -pv $HOME/bin
fi
echo "# START - helper-scripts stuff"
if [ $HS_HOME = "" ]; then
	echo "HS_HOME not set. Exiting."
	exit 1
else
	. $HS_HOME/conf/vars
	echo "HS_HOME=$HS_HOME"
	cd $HS_HOME/bin
	export "HS_HOME"
	echo "PATH=\$PATH:\$HS_HOME/bin:\$HS_HOME/sbin"
	echo "export PATH HS_HOME"
	echo "\$HS_HOME/bin/backup-historial.sh > \$HOME/.historial-${UID}.log & "
	echo "# END - helper-scripts stuff"
fi


