cmake_minimum_required(VERSION 3.16)
project(bcm2835 C)

add_library(bcm2835 STATIC bcm2835.c bcm2835.h)

