#include <stdlib.h>     //exit()
#include <signal.h>     //signal()
#include "epd.h"   //Examples

void  Handler(int signo)
{
    printf("\r\nHandler:exit with signal: %3d\n", signo);
    closeProc();
    exit(0);
}

int main(void)
{
    signal(SIGINT, Handler);
    initProc();
    uint stopProc = 0;
    while(!stopProc) {
	frameProc(0);
	DEV_Delay_ms(1000);
    }
    Handler(0);
    return 0;
}
