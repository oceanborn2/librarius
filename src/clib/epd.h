#ifndef _EPD_H_
#define _EPD_H_

#include "DEV_Config.h"
#include "GUI_Paint.h"
#include "GUI_BMPfile.h"
#include "Debug.h"
#include <stdlib.h> 

UBYTE* createImageCache();
void freeImageCache(UBYTE*);

int initProc();
extern int frameProc(int,char*);
int frameClear();
int drawString(int pos, char *str, int size); //, int foreColor, int backgroundColor);
int closeProc();

#endif
