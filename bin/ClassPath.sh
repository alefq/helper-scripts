#!/bin/sh
NARGS=$#
i=1
CP=$CLASSPATH

while [ $i -le $NARGS ]; do
	FILE=`eval echo '$'$i''`
	#echo "Archivo: $FILE"
	i=$((i+1))
	if [ -d $FILE ];then
		echo "Agregando directorio: $FILE"
		CLASS_COLLECTION="`find $FILE -type f -regex \
			'.*jar\|.*.zip\|.*.war' -print`"
		for cc in $CLASS_COLLECTION; do
			echo "Agregando: $cc"
			CP=$CP:$cc
		done
	else
		if [ -f $FILE ];then
			echo "es un archivo: $FILE"
			CP=$CP:$FILE
		else
			echo "No existe $FILE"
		fi
	fi
done
echo "CLASSPATH: $CP"
echo -e "unset CLASSPATH\n export CLASSPATH=$CP" > INCLUDE
echo "Execute \". INCLUDE\" to include new CLASSPATH to your current shell"

