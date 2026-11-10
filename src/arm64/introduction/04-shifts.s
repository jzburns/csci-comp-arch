.text
.global _main

_main:
    // Start with value 5
    mov w1, #5

    // Multiply by 4 using left shift
    lsl w2, w1, #2

    // Divide unsigned value by 2
    lsr w0, w2, #1

    // Return 10
    ret
