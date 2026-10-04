.text
.global _main

_main:
    // w1 = current value
    // w0 = running sum
    mov w1, #1
    mov w0, #0

loop:
    add w0, w0, w1
    add w1, w1, #1

    // Stop after adding 10
    cmp w1, #11
    b.lt loop

    // Return 55
    ret
