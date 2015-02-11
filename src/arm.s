.arm

.global write32
write32:
str r1, [r0]
bx lr

.global read32
read32:
ldr r0, [r0]
bx lr
