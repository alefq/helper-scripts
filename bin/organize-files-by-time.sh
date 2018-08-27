#!/bin/bash
# put this in your logrotate conf 
# whether you want the files to be organized by day, week or month
# Suggestion: use it from anacrond with this line: 
#
# @monthly 	15	organize-files	/opt/helper-scripts/bin/organize-files-by-time.sh m /path/to/dir
#
#
# Result after a few months you'll get a dir like this organized:
#
# drwxr-xr-x 2 user user    4096 oct 19 13:24 201409
# drwxr-xr-x 2 user user   16384 oct 19 13:24 201408
# drwxr-xr-x 2 user user   12288 oct 19 23:15 201410
# -rw-r----- 1 user user   22123 oct 20 17:40 JMeterWebSocketSampler-1.0.2-SNAPSHOT.jar
#
# Each month, a new directory will be created and all files moved to that directory
# 

if [ $# -ne 2 ]; then
	echo "Usage: $0 [d|w|m] [DIR TO ORGANIZE]"
	echo "h: hourly, d: daily, w: weekly, m: monthly"
	exit 1
fi

DIR_TO_ROTATE=$2
OWNER="`stat -c '%U' $DIR_TO_ROTATE`"
NEW_DIR_MONTHLY=$DIR_TO_ROTATE/`date +%Y%m`
NEW_DIR_WEEKLY_DAILY=$DIR_TO_ROTATE/`date +%Y%m%d`
NEW_DIR_WEEKLY_DAILY_HOURLY=$DIR_TO_ROTATE/`date +%Y%m%d-%H_%M`
echo "$1"
case "$1" in
	d|D|daily)
	NEW_DIR=$NEW_DIR_WEEKLY_DAILY
	;;
	w|W|weekly)
	NEW_DIR=$NEW_DIR_WEEKLY_DAILY
	;;
	m|M|montlhy)
	NEW_DIR=$NEW_DIR_MONTHLY
	;;
	h|H|hourly)
	NEW_DIR=$NEW_DIR_WEEKLY_DAILY_HOURLY
	;;
	*)
	#default to daily
	NEW_DIR=$NEW_DIR_WEEKLY_DAILY
	;;
esac
mkdir -p $NEW_DIR

cd $DIR_TO_ROTATE
find . -maxdepth 1 -type f -exec mv -v -t $NEW_DIR {} + 
chown -R $OWNER $NEW_DIR

