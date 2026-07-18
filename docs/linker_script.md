# Linker Script Guidance

This document explains the conventions and important symbols used in linker/STM32F103.ld.

Key symbols
- _estack  : Initial stack top (usually defined in the .isr_vector)
- _sidata  : Source address of .data values in FLASH
- _sdata/_edata : Start and end of .data in RAM
- _sbss/_ebss : Start and end of .bss in RAM

Common placement strategy
- FLASH: .isr_vector, .text, .rodata
- RAM:   .data (copied at runtime), .bss (zeroed at runtime), .noinit (runtime-preserved data)

Tips
- Use ALIGN() to ensure sections meet runtime/hardware alignment requirements.
- Use KEEP() for the interrupt vector to prevent it from being discarded by the linker.
- Update the MEMORY region if you add a bootloader or external flash.

See linker/STM32F103.ld for an example and detailed explanations.
