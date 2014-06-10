#!/bin/bash
# afeltes@sodep.com.py
#
. $HS_HOME/bin/common.sh

if [ $# -eq 2 ]; then
	$0 $1 $2 BG &
else 
	if [ $# -eq 3 ] && [ $3 == 'BG' ]; then
		echo -n "Alarm will popup on: "
		date -d ${1}minutes
		echo ""
		sleep $1m
		while [ 1 ]; do
			wall "$2"
			#xmessage -nearmouse "$2"
			aplay /usr/lib/libreoffice/share/gallery/sounds/kling.wav /usr/lib/libreoffice/share/gallery/sounds/kling.wav &
			xmessage -nearmouse -buttons \
				"Repetir en 5 minutos":1,"Repetir en 15 minutos":2,"Repetir en 1 hora":3,"Desactivar":4 -default \
				"Desactivar" "$2 - Alarma iniciada en: $DATE_TIME"
			RET=$?
            case "$RET" in
				1)
					sleep 5m
					;;
				2)
					sleep 15m
					;;
				3)
					sleep 1h
					;;
				*)
					exit 0
			esac
		done	
	else
		echo "uso: $0 #minutos MENSAJE"	
	fi
fi

