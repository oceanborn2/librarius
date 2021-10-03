#!/bin/bash

GOOS=linux GOARCH=amd64 go build -ldflags="-extldflags '-L../clib -lm -lepd'"

GOOS=linux GOARCH=arm go build && scp librarius pi@plume:~/librarius/core


