.text
.global _main

_main:
    // Reserve 16 bytes on stack
    sub sp, sp, #16

    // Store a 32-bit value
    mov w1, #25
    str w1, [sp, #0]

    // Load it back
    ldr w0, [sp, #0]

    // Restore stack pointer
    add sp, sp, #16
    ret
