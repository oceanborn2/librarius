#!/bin/bash


. ../../vars.sh

GOOS=$GOOS GOARCH=$MACH go build -ldflags="-extldflags '-L../clib -lm -lepd'"


