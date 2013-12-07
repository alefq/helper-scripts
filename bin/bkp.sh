#!/bin/sh
#
# Simple backup a file, appending a timestamp to filename
#
STAMP="`date +%F.%s`"
cp -v $1 $1-${STAMP}

