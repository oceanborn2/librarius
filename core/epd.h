#ifndef _EPD_H_
#define _EPD_H_

#include <stdint.h> 
#include <stdlib.h> 


#define UBYTE   uint8_t
#define UWORD   uint16_t
#define UDOUBLE uint32_t



UBYTE* createImageCache();
void freeImageCache(UBYTE*);

int initProc();
int frameProc(int);
int closeProc();

#endif
