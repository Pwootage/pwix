#ifndef __FRAMEBUFFER_H
#define __FRAMEBUFFER_H

void framebuffer_init();

typedef struct {
  uint32_t physicalWidth;
  uint32_t physicalHeight;
  uint32_t virtualWidth;
  uint32_t virtualHeight;
  uint32_t pitch;
  uint32_t depth;
  int32_t xOff;
  int32_t yOff;
  uint8_t* fbPtr;
  uint32_t fbSize;
} FBConfig;

//__asm__(".align 2");
extern FBConfig FRAMEBUFFER_CONFIG;

#endif
