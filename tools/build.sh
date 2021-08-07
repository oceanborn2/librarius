#!/bin/bash

export GOOS=linux
export GOARCH=

pushd
cd ../core
go build
scp librarius pi@plume:~/librarius
popd


