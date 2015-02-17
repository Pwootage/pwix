#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#include "framebuffer.h"
#include "uart.h"
#include "rng.h"

void kmain() {
  framebuffer_init();
  uint32_t* fb = (uint32_t*)(FRAMEBUFFER_CONFIG->fbPtr - 0x40000000);
  while (true) {
    for (int i = 0; i < 640 * 480; i++) {
      fb[i] = rand();
    }
  }
}
