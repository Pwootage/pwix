// IVs
.global __iv_table
__iv_table:
ldr pc, __start_adr // Reset
ldr pc, __start_adr // Undefined Instruction
ldr pc, __start_adr // SWI
ldr pc, __start_adr // Prefetch Abort
ldr pc, __start_adr // Data Abort
ldr pc, __start_adr // Reserved
ldr pc, __start_adr // IRQ
ldr pc, __start_adr // FIQ
__start_adr: .word __start
