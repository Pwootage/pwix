#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#include "arm.h"
#include "framebuffer.h"

void framebuffer_init() {
  FBConfig* FRAMEBUFFER_CONFIG = (FBConfig*)0x40000;
  //Setup fb config
  FRAMEBUFFER_CONFIG->physicalWidth = 640;
  FRAMEBUFFER_CONFIG->physicalHeight = 480;
  FRAMEBUFFER_CONFIG->virtualWidth = 640;
  FRAMEBUFFER_CONFIG->virtualHeight = 480;
  FRAMEBUFFER_CONFIG->pitch = 0;
  //32bit is faster buffer access, even if it wastes space
  FRAMEBUFFER_CONFIG->depth = 32;
  FRAMEBUFFER_CONFIG->xOff = 0;
  FRAMEBUFFER_CONFIG->yOff = 0;
  FRAMEBUFFER_CONFIG->fbPtr = 0;
  FRAMEBUFFER_CONFIG->fbSize = 0;

  //Write into mailbox
  uint32_t* mailbox_base = (uint32_t*)0x2000B880;
  uint32_t* mailbox_sr = mailbox_base + 6; //ptr math = 0x18 bytes
  while (read32(mailbox_sr) & 0x80000000) {} //Wait for room in mailbox
  uint32_t* mailbox_wr = mailbox_base + 8; //ptr math = 0x20 bytes
  write32(mailbox_wr, 0x40040001); //write to mailbox

  //Now we need to wait for mailbox to be read...
  while (true) {
    //Wait for message
    while ((read32(mailbox_sr) & 0x40000000));
    //Wait for OUR message
    if ((read32(mailbox_base) & 0xF) == 1 ) break;
  }

  //FB should be ready!
  uint8_t* fb = FRAMEBUFFER_CONFIG->fbPtr - 0x40000000;
  for (int i = 0; i < 640 * 480; i++) {
    fb[i*4+0] = (uint8_t)(i >> 0);
    fb[i*4+1] = (uint8_t)(i >> 8);
    fb[i*4+2] = (uint8_t)(i >> 16);
    fb[i*4+3] = 0; //Ignored?
  }
}
