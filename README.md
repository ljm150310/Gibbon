# Gibbon

Project summary
- Purpose: A personal mini computer project based on the STM32F103C8T6 (Cortex-M3).
- Current status: Prototype / In development. Update the status at the top of this README as needed.

English summary
- Project: Gibbon — a small personal computer based on the STM32F103C8T6.
- Status: Prototype / in-development.

Quick start
- Hardware (overview)
  - MCU: STM32F103C8T6 (Cortex-M3)
  - Typical peripherals: USART, SPI, I2C, GPIO, external crystal (see docs/pinout.md)

- Toolchain
  - Recommended: arm-none-eabi toolchain (gcc, objcopy, ld)
  - Examples:
    - Build:
      ```bash
      make all
      ```
    - Flash (using st-flash):
      ```bash
      st-flash write build/firmware.bin 0x8000000
      ```

Repository structure
- src/ — Assembly and startup code (.s / .S)
- linker/ — Linker scripts (.ld)
- docs/ — Design documents, memory map, pinout, linker script explanation
- tools/ — Build and flashing helper scripts

Memory map & linker script
- MCU FLASH: 0x08000000 (64 KiB)
- MCU RAM:   0x20000000 (20 KiB)
- See docs/memory_map.md and linker/STM32F103.ld for details

Contributing
- See CONTRIBUTING.md for comment guidelines and PR requirements.

License
- Repository license: GPL-2.0. Keep this license or justify changes in a PR.
