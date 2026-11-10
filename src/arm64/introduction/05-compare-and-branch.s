.text
.global _main

_main:
    // Compare two values
    mov w1, #9
    mov w2, #12
    cmp w1, w2

    // Branch if 9 is less than 12
    b.lt less_case

    mov w0, #0
    ret

less_case:
    mov w0, #1
    ret
