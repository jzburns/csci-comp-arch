.text
.global _main

_main:
    // Save return address
    str x30, [sp, #-16]!

    mov w0, #6
    mov w1, #7
    bl multiply_values

    // Restore return address
    ldr x30, [sp], #16
    ret

multiply_values:
    // Return w0 * w1
    mul w0, w0, w1
    ret
