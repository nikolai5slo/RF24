#include <RF24/RF24.h>
#include "_cgo_export.h"

int attachInterruptWrap(int pin, int mode) {
	return attachInterrupt(pin, mode, gocallback);
}