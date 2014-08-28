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
tail -1 $WEATHER | awk '{print $6}' | awk -F/ '{print $1}'

