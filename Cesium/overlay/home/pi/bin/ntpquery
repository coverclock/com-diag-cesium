#!/bin/bash
# Copyright 2018 by the Digital Aggregates Corporation, Arvada Colorado USA.

TMPFILE=$(mktemp ${TMPDIR:="/tmp"}/$(basename $0 .sh).XXXXXXXXXX)
trap "rm -f ${TMPFILE}" HUP INT TERM EXIT

while true; do
	NOWTIME=$(date +"%Y-%m-%d %H:%M:%S.%N %Z")
	echo ${NOWTIME:0:23} ${NOWTIME:30} > ${TMPFILE}
	/usr/local/bin/ntpq -c "rv 0 reftime" -c peers -c associations >> ${TMPFILE}
	clear
	head -23 ${TMPFILE}
	sleep 64
done
