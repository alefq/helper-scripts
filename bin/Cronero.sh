#!/bin/bash
_really_really_kill_it()
{
	while [ ! -z "`pidof $1`" ]; do
		echo -n "killing $1's"	
		killall $1
		echo -n "."
		sleep 10
	done
	echo ""
	echo "killed all $1's"
}

export DISPLAY=:3

case "$1" in
  start)
	if [ -z "`pidof java`" ];then
		 /home/afeltes/opt/azureus/azureus &
	fi
	/home/afeltes/bin/Wget-diario.sh cron &
        ;;
  stop)
	_really_really_kill_it wget
	_really_really_kill_it java
        ;;
esac

