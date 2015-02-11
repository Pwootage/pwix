/* ENTRY(_start) */

SECTIONS
{
    /* Interrupt table */
    . = 0x0000;
    __iv_table = .;
    .text :
    {
        iv.o(.text)
        . = 0x100;
        __start = .;
        __text_start = .;
        *(.text)
    }

    . = ALIGN(4096); /* align to page size */
    __text_end = .;

    __rodata_start = .;
    .rodata :
    {
        *(.rodata)
    }
    . = ALIGN(4096); /* align to page size */
    __rodata_end = .;

    __data_start = .;
    .data :
    {
        *(.data)
    }
    . = ALIGN(4096); /* align to page size */
    __data_end = .;

    __bss_start = .;
    .bss :
    {
        bss = .;
        *(.bss)
    }
    . = ALIGN(4096); /* align to page size */
    __bss_end = .;
    __end = .;
}
