.arm

//Exports
.global _start
_start:
//Allocate a stack (64k at beginning of memory, growing down)
ldr sp, =memend
ldr sp, [sp]
//Aaaand to the kernel!
b kmain
memend: .word 0x1bffffff

//Stick the framebuffer config here (size: )
.align 3
.global fb_config
.comm fb_config 40
