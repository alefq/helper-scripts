#!/bin/bash
CLASSNAME=Logger.class
LIB_DIR="${HOME}/.m2/"
cd ${LIB_DIR}
for j in `find -name "*.jar"`; do 
	#echo $j 
	FOUND="`unzip -l $j | grep $CLASSNAME`" 
	if [ "$FOUND" != "" ];  then
		echo "${CLASSNAME} found in ${j}: ${FOUND}"
	fi
done 

