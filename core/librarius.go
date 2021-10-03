package main

/*
#cgo CFLAGS: -g -Wall
#cgo LDFLAGS: -L../clib -lepd -lm
#include "epd.h"
*/
import "C"

import (
	"fmt"
	"time"
	"unsafe"
)

func initScreens() {
	C.initProc()
}

func initAll() {
	initScreens()
}

type Event struct {
	id   int
	desc string
}

type Context struct {
	timestamp  time.Time
	weekDay    time.Weekday
	weekNumber int
	weekEven   bool
	yearDay    int
	year       int
	leapYear   bool
	month      time.Month
	monthDay   int
	events     []Event
}

func updateContext(ctx *Context) {
	t := time.Now()
	ctx.timestamp = t
	ctx.weekDay = t.Weekday()
	_, ctx.weekNumber = t.ISOWeek()
	ctx.weekEven = ctx.weekNumber%2 == 0
	ctx.monthDay = ctx.timestamp.Day()
	ctx.yearDay = ctx.timestamp.YearDay()
	year := ctx.timestamp.Year()
	month := ctx.timestamp.Month()
	ctx.month = month
	ctx.year = year
	ctx.leapYear = year%4 == 0 && year%100 != 0 || year%400 == 0
}

func displayStr(pos int, str string) {
	println(str)
	ptrStr:=C.CString(str);
	defer C.free(unsafe.Pointer(ptrStr));
	C.drawString(C.int(pos), ptrStr, 16) //, BLACK, WHITE);
}

func display(ctx Context) {
	var pos = 10

	displayStr(pos, "timestamp     : " +  fmt.Sprintf("", ctx.timestamp))
	pos += 10
	displayStr(pos, "weeknumber     : " +  fmt.Sprintf("", ctx.weekNumber))
/*
	println("odd/even week : ", ctx.weekEven)
	println("weekday       : ", fmt.Sprintf("%d", ctx.weekDay))
	println("leapYear      : ", ctx.leapYear)
	println("year          : ", fmt.Sprintf("%d", ctx.year))
	println("yearday       : ", fmt.Sprintf("%d", ctx.yearDay))
	println("month         : ", fmt.Sprintf("%d", ctx.month))
	println("monthDay      : ", fmt.Sprintf("%d", ctx.monthDay))
	println("---------------------------------")*/
}

func main() {
	fmt.Println("Librarius service")
	initAll()
	defer C.closeProc();
	C.frameClear();
	ctx := Context{}
	for {
		updateContext(&ctx)
		time.Sleep(10 * time.Second)
		display(ctx)
	}
}
