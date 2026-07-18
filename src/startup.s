@ File: startup.s
@ Purpose: Minimal startup and vector table template for STM32F103C8T6 (Cortex-M3)
@ MCU: STM32F103C8T6
@ Toolchain: arm-none-eabi (GNU assembler syntax)
@ License: GPL-2.0

/* Vector table: must be placed at the start of FLASH */
    .syntax unified
    .cpu cortex-m3
    .thumb

    .section .isr_vector,"a",%progbits
    .type g_pfnVectors, %object
    .size g_pfnVectors, .-g_pfnVectors
g_pfnVectors:
    .word _estack
    .word Reset_Handler
    .word NMI_Handler
    .word HardFault_Handler
    /* Add more interrupt vectors here as needed */

/* Weak default handlers */
    .weak NMI_Handler
    .weak HardFault_Handler
    .type NMI_Handler, %function
NMI_Handler:
    b .

    .type HardFault_Handler, %function
HardFault_Handler:
    b .

/* External symbols defined in the linker script */
    .extern _sidata
    .extern _sdata
    .extern _edata
    .extern _sbss
    .extern _ebss
    .extern _estack

/* Reset handler: initialize data and bss, then branch to main */
    .type Reset_Handler, %function
Reset_Handler:
    /* Disable interrupts (optional) */
    cpsid i

    /* Copy .data from FLASH (_sidata) to RAM (_sdata.._edata) */
    ldr r0, =_sidata
    ldr r1, =_sdata
    ldr r2, =_edata
1:  cmp r1, r2
    ittt lo
    ldrlo r3, [r0], #4
    strlo r3, [r1], #4
    blo 1b

    /* Zero .bss (_sbss .. _ebss) */
    ldr r0, =_sbss
    ldr r1, =_ebss
    movs r2, #0
2:  cmp r0, r1
    it lo
    strlo r2, [r0], #4
    blo 2b

    /* Re-enable interrupts */
    cpsie i

    /* Branch to main (must be provided in C or assembly) */
    bl main

    /* If main returns, loop forever */
    b .
