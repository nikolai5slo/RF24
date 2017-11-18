%module RF24  

%{
#include "RF24/RF24.h"
%}

%typemap(gotype) (const void* buf, uint8_t len) %{[]byte%}

%typemap(in) (const void* buf, uint8_t len) {
   $1 = ($1_ltype)$input.array;
   $2 = $input.len;
}


%typemap(gotype) (void* buf, uint8_t len) %{[]byte%}

%typemap(out) (void* buf, uint8_t len) {
   $1 = ($1_ltype)$input.array;
   $2 = $input.len;
}

%ignore attachInterrupt;

%include "stdint.i"

%include "RF24.h"
%include "utility/RPi/interrupt.h"
