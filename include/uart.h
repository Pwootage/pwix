#ifndef __UART_H
#define __UART_H

#define UART_BASE (0x20201000)
#define UART_SR (UART_BASE + 0x18)

uint32_t uart_getc();
void uart_putc(uint32_t c);

#endif
