#!/bin/bash
#
# requires wethr from snap store and pango1.0-tools
#
WFILE=/tmp/.weather-info-$UID
DEBUG=0

if [ -z $DISPLAY ]; then
	# probably running from crontab
	export DISPLAY=:0
fi

if [ $DEBUG -eq 0 ]; then
	#cpulimit -f -l 10 /snap/bin/wethr > $WFILE 2>/dev/null
	/snap/bin/wethr > $WFILE 2>/dev/null
else 
	#cpulimit -f -l 10 /snap/bin/wethr > $WFILE 
	/snap/bin/wethr > $WFILE 
fi
#cpulimit -f -l 10 pango-view --background=#ffffff  --font=onot -qo /tmp/weather-$UID.jpg $WFILE
pango-view --background=#ffffff  --font=onot -qo /tmp/weather-$UID.jpg $WFILE

