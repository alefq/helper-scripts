#!/bin/bash
#
# requires wethr from snap store and pango1.0-tools
#
# running from crontab
export DISPLAY=:0
WFILE=/tmp/.weather-info-$UID
DEBUG=0

if [ $DEBUG -eq 0 ]; then
	/snap/bin/wethr > $WFILE 2>/dev/null
else 
	/snap/bin/wethr > $WFILE 
fi
pango-view --background=#ffffff  --font=onot -qo /tmp/weather-$UID.jpg $WFILE

