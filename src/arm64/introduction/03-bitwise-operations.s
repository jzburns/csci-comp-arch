.text
.global _main

_main:
    // Two small bit patterns
    mov w1, #0b1100
    mov w2, #0b1010

    // AND keeps common 1 bits
    and w3, w1, w2

    // OR combines 1 bits
    orr w4, w1, w2

    // EOR keeps differing bits
    eor w0, w1, w2

    // Return EOR result
    ret
