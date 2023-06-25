cmake_minimum_required(VERSION 3.18)
project(clib C)

# Forcing values to link to Raspberry's architecture settings
set(SYSTEM linux)
set(CMAKE_SYSTEM_NAME Linux)
#set(CMAKE_SYSTEM_VERSION 10.0.10240.0)

#set(CMAKE_BUILD_RPATH ../../build)



set(CMAKE_LIBRARY_ARCHITECTURE arm)
set(CMAKE_C_LIBRARY_ARCHITECTURE arm)
#set(CMAKE_C_COMPILER clang-11)

message("SYSTEM: " ${SYSTEM})
message("SYSTEM name: " ${CMAKE_SYSTEM_NAME})

set(CMAKE_HOST_SYSTEM_NAME macos)


#find_library(m REQUIRED)
#find_library(bcm2835 REQUIRED)
#find_library(wiringPI OPTIONAL)

include_directories(BEFORE lib/Config)
include_directories(BEFORE lib/e-Paper)
include_directories(BEFORE lib/fonts)
include_directories(BEFORE lib/GUI)
include_directories(BEFORE lib/bcm2835)

add_compile_definitions(DEBUG RPI USELIB_RPI USE_BCM2835_LIB)

#add_linker_options(-Wl --gc-sections)

set(SRCS epd.c
    lib/bcm2835/bcm2835.c
	lib/e-Paper/EPD_7in5_V2.c
	lib/Config/RPI_sysfs_gpio.c
	lib/Config/DEV_Config.c
#	lib/Config/sysfs_gpio.c
#	lib/Config/sysfs_software_spi.c
#	lib/Config/dev_hardware_SPI.c
	lib/GUI/GUI_BMPfile.c
	lib/GUI/GUI_Paint.c
	lib/Fonts/font8.c
	lib/Fonts/font12.c
	#lib/Fonts/font12CN.c
	lib/Fonts/font16.c
	lib/Fonts/font20.c
	lib/Fonts/font24.c
	#lib/Fonts/font24CN.c
)

set(TARGET epd)
add_library(epd SHARED ${TARGET} ${SRCS})
target_link_libraries(${TARGET} m)


# Ultimately, the DLLs should be unlinked from the program when it is built locally (macos or x64 linux)
file(GLOB SOFILE
	"*.so"
	"*.dylib"
	"*.dll" # to cover all OS cases
)

file(COPY ${SOFILE} DESTINATION ../core)

