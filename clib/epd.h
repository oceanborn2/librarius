#ifndef _EPD_H_
#define _EPD_H_

#include "DEV_Config.h"
#include "GUI_Paint.h"
#include "GUI_BMPfile.h"
#include "ImageData.h"
#include "Debug.h"
#include <stdlib.h> // malloc() free()

UBYTE* createImageCache();
void freeImageCache(UBYTE* imageCache);

int initProc();
int frameProc(int);
int closeProc();

#endif
