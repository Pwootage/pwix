#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#include "uart.h"

void kmain() {
  while (true) {
    uint32_t c = uart_getc();
    uart_putc(c);
  }
}
