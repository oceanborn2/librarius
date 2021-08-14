#!/bin/bash

#pushd
cd ../core
GOOS=linux GOARCH=arm go build && scp librarius pi@plume:~/librarius/core
#popd


