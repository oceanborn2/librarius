#!/bin/bash

MACH=`uname -m | tr '[:upper:]' '[:lower:]'`
GOOS=`uname  | tr '[:upper:]' '[:lower:]'`
HOST=`hostname`
echo "builder MACH: $MACH"
echo "builder GOOS: $GOOS"
echo "builder HOST: $HOST"

if [[ "$1x" -eq "targetx" ]];
then
	GOOS="linux"
	MACH="armv6l"
fi

#if [[ $MACH -eq 'armv6l' ]]; then
#	GOOS=$GOOS GOARCH=$MACH go build -ldflags="-extldflags '-L../clib -lm -lepd'"
#
#elif [[ $MACH -eq 'arm64' ]]; then
#	GOOS=$GOOS GOARCH=$MACH go build -ldflags="-extldflags '-L../clib -lm -lepd'"
#
#elif [[ $MACH -eq 'amd64' && $os -eq 'linux' ]]; then
#	GOOS=linux GOARCH=$MACH go build -ldflags="-extldflags '-L../clib -lm -lepd'" && scp librarius pascal@plume:~/librarius/core
#elif [[ $MACH -eq 'amd64' && $os -eq 'windows' ]]; then
#	GOOS=linux GOARCH=$MACH go build -ldflags="-extldflags '-L../clib -lm -lepd'" core
#else
#	echo "unknown GOARCH and GOOS configuration"
#fi

GOOS=$GOOS GOARCH=$MACH go build -ldflags="-extldflags '-L../clib -lm -lepd'"

# copy the file locally as we are on the target already
if [[ "$HOST" != 'plume' ]];
then
	scp librarius pascal@plume:~/librarius/
fi

