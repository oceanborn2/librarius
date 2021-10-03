cmake_minimum_required(VERSION 3.16)
project(librarius)
find_library(golang REQUIRED)

#add_subdirectory(e-Paper)
#add_subdirectory(fonts)
set(TARGET librarius)
set(SRCS librarius.go)

add_executable(${TARGET} ${SRCS})
add_dependencies(${TARGET} goshim)
target_link_libraries(${TARGET} goshim pthread epd m)




