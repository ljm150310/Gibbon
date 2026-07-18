/*
   linker/STM32F103.ld  — Linker script for STM32F103C8T6
   License: GPL-2.0

   Notes:
   - FLASH: 0x08000000, 64 KiB
   - RAM:   0x20000000, 20 KiB
   - Key symbols (used by startup.s and other code):
       _estack, _sidata, _sdata, _edata, _sbss, _ebss
*/

MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 64K
  RAM   (rwx): ORIGIN = 0x20000000, LENGTH = 20K
}

ENTRY(Reset_Handler)

SECTIONS
{
  .isr_vector ORIGIN(FLASH) :
  {
    KEEP(*(.isr_vector))
  } > FLASH

  .text :
  {
    *(.text*)
    *(.rodata*)
    KEEP(*(.init))
    KEEP(*(.fini))
  } > FLASH

  /* Initial values for .data are stored in FLASH, and copied to RAM at runtime */
  .data : AT(ADDR(.text) + SIZEOF(.text))
  {
    _sdata = .;
    *(.data*)
    _edata = .;
  } > RAM

  .bss :
  {
    _sbss = .;
    *(.bss*)
    *(COMMON)
    _ebss = .;
  } > RAM

  /* Define a user heap/stack region if needed */
  ._user_heap_stack :
  {
    . = ALIGN(8);
    __stack_start__ = .;
    . = . + 0x1000; /* example: 4 KiB stack */
    __stack_end__ = .;
  } > RAM

  /* End of RAM symbol */
  end_of_ram = ORIGIN(RAM) + LENGTH(RAM);
}
