#!/bin/bash

sshfs -o reconnect -o idmap=user -o allow_other pi@plume:/home/pi/librarius /mnt/plume
exit 0

