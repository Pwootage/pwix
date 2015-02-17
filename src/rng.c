
#include <stddef.h>
#include <stdint.h>


int32_t state = 0xc4a758ec;
int32_t rand() {
  //Linear congruential generator - not particularly good but good enough for now
  //Note: c99 params per wikipedia (also, glibc uses these)
  state = state * 1103515245 + 12345;
  return state;
}
