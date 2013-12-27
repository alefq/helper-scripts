#!/bin/bash
netstat -tnp | grep ESTABLISHED | grep -v thunderbird  | grep -v pidgin \
	| grep -v firefox  | grep -v Google | grep -v 127.0.0.1 \
	|  tail -10 | awk '{printf "%22s\t%22s\n", $5, $7}'


