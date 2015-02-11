//Useful functions
.global uart_getc
uart_getc:
1:
ldr r1, sfr
ldr r1, [r1]
tst r1, #0x10 //FOr some reason the bit I care about is left-shifted. Odd.
bne 1b

//Read into r0
ldr r1, sbase
ldr r0, [r1]
bx lr

.global uart_putc
uart_putc:
1:
ldr r1, sfr
ldr r1, [r1]
tst r1, #0x20 //send buffer empty
bne 1b

//Write r0
ldr r1, sbase
str r0, [r1]
bx lr


//Constatns
//sbase: .word 0x9000000
//sfr:   .word 0x9000018
sbase: .word 0x20201000
sfr:   .word 0x20201018
