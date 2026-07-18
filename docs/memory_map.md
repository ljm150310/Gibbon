# Memory Map

Target MCU: STM32F103C8T6

Typical memory layout
- FLASH:  0x08000000 — 0x0800FFFF (64 KiB)
- SRAM:   0x20000000 — 0x20004FFF (20 KiB)

Why document the memory map
- The linker script, startup code, and features like DMA or a bootloader depend on correct memory boundaries.
- When adding peripherals or a bootloader, the linker script must be updated to avoid address conflicts.

Common considerations
- The .isr_vector section must be placed at the start of FLASH (typically 0x08000000).
- The .data section has initial values in FLASH (_sidata) and must be copied to RAM at startup (_sdata/_edata).
- The .bss section must be zeroed at startup (_sbss/_ebss).
- Use KEEP() to prevent the linker from discarding critical symbols such as the interrupt vector.

Reference files
- linker/STM32F103.ld
- src/startup.s
