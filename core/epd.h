#ifndef _EPD_H_
#define _EPD_H_

#include <stdint.h> 
#include <stdlib.h> 

#define UBYTE   uint8_t
#define UWORD   uint16_t
#define UDOUBLE uint32_t

extern UBYTE* createImageCache();
extern void freeImageCache(UBYTE*);

extern int initProc();
extern int frameProc(int,char*);
extern int frameClear();
int drawString(int pos, char *str, int size); //, int foreColor, int backgroundColor) {
extern int closeProc();

#endif
