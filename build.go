package RF24

/*
#include <interrupt_wrap.h>
#cgo LDFLAGS: -lrf24
 */
import "C"
import (
	"sync"
)

var mutex = &sync.Mutex{}
var intchain chan int

//export gocallback
func gocallback() {
	mutex.Lock()
	defer mutex.Unlock()
	intchain <- 1
}

func AttachInterrupt(pin int, mode int) chan int {
	mutex.Lock()
	defer mutex.Unlock()
	C.attachInterruptWrap(C.int(pin), C.int(mode))
	intchain = make(chan int)
	return intchain
}
