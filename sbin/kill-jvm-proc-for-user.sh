#!/bin/bash
#
# Kills all java processes by specified user
#
JAVA_PROC_USER=$1
MAX_TIMES=2

if [ "${JAVA_PROC_USER}" != "" ] ; then
	ALL_PROCS="`ps aux | grep java | grep -v grep | grep ${JAVA_PROC_USER}`"
	echo ${ALL_PROCS}
        PID="`echo ${ALL_PROCS}| tail -1 | awk '{print $2}'`"
	TIMES=0
	while [ ! -z "${PID}" ]; do
		echo -n "killing ${PID}'s"	
		kill ${PID}
		echo -n "."
		sleep 30
		TIMES=$((TIMES+1))
		#Attempts MAX_TIMES if it's still running, send a SIGKILL
		if [ ${TIMES} -gt ${MAX_TIMES} ]; then
			echo "Tried ${MAX_TIMES} times to kill PID: ${PID}, sending -9 signal..."
			kill -9 ${PID}
		fi
		ALL_PROCS="`ps aux | grep java | grep -v grep | grep ${JAVA_PROC_USER}`"
		echo ${ALL_PROCS}
	        PID="`echo ${ALL_PROCS}| tail -1 | awk '{print $2}'`"
	done
	echo ""
	echo "No more java process for user ${JAVA_PROC_USER} are running"
else
	echo "Usage: $0 USERNAME_FOR_JAVA_PROC"
fi

