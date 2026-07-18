# Contributing

Thank you for your interest in contributing to Gibbon! Please read the following guidelines before submitting changes.

Documentation and comment guidelines
- Repository-level documentation (README, docs/) should be in English.
- Code comments (.s / .ld) should be in English. If you add public-facing interfaces, consider adding brief Chinese notes for the maintainers only, but keep the primary comments in English.
- Every file must have a header that includes: a short description, target MCU, toolchain, author, license (e.g., GPL-2.0), and date.
- Routine/function comments should include: purpose, input parameters, clobbered registers, return values, and preconditions.

Commit conventions
- Use a short summary line (<=50 characters) for the commit message, optionally followed by a paragraph describing the change.
- Describe in the PR whether documentation or comments were updated.

Code review checklist
- Does the change affect memory mapping or the linker script?
- If yes, update docs/memory_map.md or docs/linker_script.md accordingly.

Style suggestions
- In assembly, prefer meaningful symbols over magic numbers (e.g., use CLOCK_HZ rather than 72000000 inline).
- Use TODO: and FIXME: tags for future work so they are easy to find.
