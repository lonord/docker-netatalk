#!/bin/bash

PID_FILE=/var/lock/netatalk

touch /var/log/afpd.log
if [ -e $PID_FILE ]; then
	rm $PID_FILE
fi
netatalk
tail -f /var/log/afpd.log
