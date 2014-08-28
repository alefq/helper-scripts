#/bin/bash
STAMP="`date +%F.%s`"
DATE_TIME="`date +%F_%H:%M`"
# get from http://weather.noaa.gov
CITY_CODE=SGAS #Asuncion

if [ ! -d /tmp/.weather-$UID ]; then
	mkdir -p /tmp/.weather-$UID
fi
WEATHER=/tmp/.weather-$UID/weather-$STAMP.log
curl -s http://weather.noaa.gov/pub/data/observations/metar/stations/${CITY_CODE}.TXT  > $WEATHER
# I can't finid a pattern on noaa output
# ad-hoc temperature parsing
tail -1 $WEATHER | awk -F/ '{print $1} ' | awk '{print $NF} '

