.text
.global _main

_main:
    // Load two integer values
    mov w0, #5
    mov w1, #7

    // Add them
    add w0, w0, w1

    // Return 12
    ret
