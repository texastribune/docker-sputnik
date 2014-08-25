#!/usr/bin/env bash
#
# WIP just to get this thing working. would be nice not to need this shell script hack
#
service sputnik start
sleep 2
tail -f /var/log/sputnik.log
