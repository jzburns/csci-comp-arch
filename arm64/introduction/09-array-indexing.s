.text
.global _main

_main:
    // Reserve space for four 32-bit integers
    sub sp, sp, #16

    mov w1, #10
    str w1, [sp, #0]
    mov w1, #20
    str w1, [sp, #4]
    mov w1, #30
    str w1, [sp, #8]
    mov w1, #40
    str w1, [sp, #12]

    // Load array element at index 2
    mov x1, #2
    ldr w0, [sp, x1, lsl #2]

    add sp, sp, #16
    ret
