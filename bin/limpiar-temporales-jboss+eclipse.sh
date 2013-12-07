#!/bin/bash
# limpia los temporales del Jboss y del eclipse
# afeltes@sodep.com.py
#
#JBOSS_HOME=/opt/tekoporu/server/jboss-6.1
JBOSS_HOME=/opt/demoiselle/server/jboss-6.1
#JBOSS6_HOME=/opt/jboss-6.0
JBOSS6_HOME=/opt/demoiselle/server/jboss-6.1.0.Final
JBOSS7_TMP_HOME=/opt/demoiselle/server/jboss-7.1/standalone/tmp
WORKSPACE_DIR=$HOME/workspaces
JBOSS_SERVER_NAME=default
ZEN="zenity --info --title Temporales --text"
 
cd $CURRENT_JBOSS_HOME
 
f_limpiar_jboss() {
	CURRENT_JBOSS_HOME=$1
	if [ -d $CURRENT_JBOSS_HOME ]; then
 		$ZEN "Limpiando temporales de $CURRENT_JBOSS_HOME" &
		echo "Limpiando directorios temporales del JBoss $CURRENT_JBOSS_HOME"
		echo "Limpiando data"
		rm -rf $CURRENT_JBOSS_HOME/server/${JBOSS_SERVER_NAME}/data/*
		echo "Limpiando work"
		rm -rf $CURRENT_JBOSS_HOME/server/${JBOSS_SERVER_NAME}/work/*
		echo "Limpiando tmp"
		rm -rf $CURRENT_JBOSS_HOME/server/${JBOSS_SERVER_NAME}/tmp/*
	fi
}
 
f_limpiar_jboss $JBOSS_HOME 
sleep 3
f_limpiar_jboss $JBOSS6_HOME 

rm -rf $JBOSS7_TMP_HOME/vfs/*
rm -rf $JBOSS7_TMP_HOME/auth/*
rm -rf $JBOSS7_TMP_HOME/tmp/*
 
if [ "$1" = "W" ]; then
	#Si se pasó el parámetro W limpiamos también el workspace
	$ZEN "Limpiando temporales de $WORKSPACE_DIR" & 
	echo "Limpiando temporales del workspace"
	cd $WORKSPACE_DIR
	find $WORKSPACE_DIR -type f -name "*.tmp" -print0 | xargs -0 rm -v
fi
echo "listo"

