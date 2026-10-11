.data
  msg: .asciz "Position %d \n"

.text
.global main

main:
    // Prologue: save lr and fp
    stp x29, x30, [sp, #-16]!

    mov w3, #1
    mov w4, #0

loop:
    add w3, w3, w4
    add w4, w4, #1

    // caller preserved
    // if we forget this, the callees
    // will trash them
    stp w3, w4, [sp, #-16]!

    bl print_val

    ldp w3, w4, [sp], #16

    cmp w4, #11
    b.lt loop

    // Epilogue: restore lr and fp
    // and set up the return value
    ldp x29, x30, [sp], #16
    mov w0, w3
    ret

print_val: 
    stp x29, x30, [sp, #-16]!

    ldr x0, =msg
    mov x1, x4 
    bl printf

    ldp x29, x30, [sp], #16

    ret
