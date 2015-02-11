#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#include "framebuffer.h"
#include "uart.h"

void kmain() {
  while (true) {
    framebuffer_init();
    uint32_t c = uart_getc();
    uart_putc(c);
  }
}
