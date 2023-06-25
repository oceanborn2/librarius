#!/bin/bash

pushd
cd src/clib
cmake .
make clean && make
popd

pushd
cd src/core
./build.sh
popd

#TODO: Make install remotely?
# copy the file locally as we are on the target already
if [[ "$HOST" != 'plume' ]];
then
	scp librarius pascal@plume:~/librarius/
fi

