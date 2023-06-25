cmake_minimum_required(VERSION 3.18)
project(librarius)

# BTYPE is used to distinguish if performing a local build (local) or a Raspberry build (pi)
#set(BTYPE local)
#set(EPD true)

set(SRCDIR src)
#set(BUILDDIR build)

#include(cmake/toolchains/${BTYPE}.cmake)
#include(cmake/epd.cmake)

#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra")

add_subdirectory(${SRCDIR}/clib)
add_subdirectory(${SRCDIR}/core)


#set(TARGET librarius)
#set(SRCS librarius.go)

#add_executable(${TARGET} ${SRCS})
#add_dependencies(${TARGET} goshim)
#add_dependencies(${TARGET} clib)


#target_link_libraries(${TARGET} goshim pthread epd m)



#some macros taken from : https://github.com/krumberg/cmake_go/blob/main/src/CMakeLists.txt


