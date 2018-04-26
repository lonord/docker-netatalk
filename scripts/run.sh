#!/bin/bash

netatalk
touch /var/log/afpd.log
tail -f /var/log/afpd.log
