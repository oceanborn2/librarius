#!/bin/bash

GOOS=linux GOARCH=arm go build && scp librarius pi@plume:~/librarius/core


