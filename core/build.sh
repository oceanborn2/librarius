#!/bin/bash

mach=`uname -m`
echo "mach: $mach"

if [[ $mach -eq 'armv6l' ]]; then
	GOOS=linux GOARCH=amd64 go build -ldflags="-extldflags '-L../clib -lm -lepd'"

elif [[ $mach -eq 'arm64' ]]; then
	GOOS=macos GOARCH=arm64 go build -ldflags="-extldflags '-L../clib -lm -lepd'" && scp librarius pascal@plume:~/librarius/core

else
	GOOS=linux GOARCH=arm i go build -ldflags="-extldflags '-L../clib -lm -lepd'" && scp librarius pascal@plume:~/librarius/core
fi




