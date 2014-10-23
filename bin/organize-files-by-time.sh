#!/bin/bash
# put this in your logrotate conf 
# whether you want the files to be organized by day, week or month
# Suggestion: use it from anacrond with this line: 
# @monthly 	15	organize-files	/opt/helper-scripts/bin/organize-files-by-time.sh m /path/to/dir
#
if [ $# - ne 2 ]; then
	echo "Usage: $0 [d|w|m] [DIR TO ORGANIZE]"
	echo "d: daily, w: weekly, m: monthly"
	exit 1
fi

DIR_TO_ROTATE=$2
OWNER="`stat -c '%U' DIR_TO_ROTATE`"
NEW_DIR_MONTHLY=$DIR_TO_ROTATE/`date +%Y%m`
NEW_DIR_WEEKLY_DAILY=$DIR_TO_ROTATE/`date +%Y%m%d`
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
	*)
	#default to daily
	NEW_DIR=$NEW_DIR_WEEKLY_DAILY
	;;
esac
mkdir -p $NEW_DIR

cd $DIR_TO_ROTATE
find . -maxdepth 1 -type f -exec mv -v -t $NEW_DIR {} + 
chown -R $OWNER $NEW_DIR

