#!/bin/bash

mach=`uname -m`
if [[ $mach -eq 'armv6l' ]]; then
	GOOS=linux GOARCH=amd64 go build -ldflags="-extldflags '-L../clib -lm -lepd'"
else
	GOOS=linux GOARCH=arm i go build -ldflags="-extldflags '-L../clib -lm -lepd'" && scp librarius pi@plume:~/librarius/core
fi




