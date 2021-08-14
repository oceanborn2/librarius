cmake_minimum_required(VERSION 3.16)
project(clib C)

find_library(bcm2835 REQUIRED)
find_library(m REQUIRED)

#find_library(wiringPI OPTIONAL)

#add_subdirectory(lib/Config)
#add_subdirectory(lib/e-Paper)
#add_subdirectory(lib/fonts)
#add_subdirectory(lib/GUI)

#target_include_directories(ePaper PUBLIC lib/Config lib/e-Paper lib/fonts lib/GUI)

include_directories(BEFORE lib/Config)
include_directories(BEFORE lib/e-Paper)
include_directories(BEFORE lib/fonts)
include_directories(BEFORE lib/GUI)

# include(lib/Config)
# include(lib/e-Paper)
# include(lib/fonts)
# include(lib/GUI)

add_compile_definitions(DEBUG RPI USELIB_RPI USE_BCM2835_LIB)

#add_linker_options(-Wl --gc-sections)

set(SRCS epd.c 
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



#add_executable(${TARGET} main.c ${SRCS})



add_library(epd SHARED ${TARGET} ${SRCS})

target_link_libraries(${TARGET} bcm2835 m)
#add_dependencies(${TARGET} m)
#add_dependencies(${TARGET} bcm2835)



