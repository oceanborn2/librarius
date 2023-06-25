#!/bin/bash


rm -f CMakeCache.txt
rm -f CMakeFiles.txt
cmake -A Linux .

make clean && make


