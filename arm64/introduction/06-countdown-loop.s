.text
.global _main

_main:
    // Count down from 5
    mov w1, #5

loop:
    sub w1, w1, #1

    // Continue until zero
    cbnz w1, loop

    // Return final count
    mov w0, w1
    ret
