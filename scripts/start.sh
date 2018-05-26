#!/bin/bash

touch /var/log/afpd.log
netatalk
tail -f /var/log/afpd.log
