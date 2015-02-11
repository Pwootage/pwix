/* ENTRY(_start) */

SECTIONS
{
    /* Interrupt table is handled by boot loader */
    . = 0x8000;
    .text :
    {
        __start = .;
        *(.text)
        __text_end = .;
    }
    .rodata : { *(.rodata) }
    .data : { *(.data) }
    .bss : { *(.bss) }
}
