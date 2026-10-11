.data
  msg: .asciz "Position %d \n"

.text
.global main

main:
    // Prologue
    sub sp, sp, #16
    // save lr and fp
    stp x29, x30, [sp]

    mov w3, #1
    mov w4, #0

loop:
    add w3, w3, w4
    add w4, w4, #1

    // caller preserved
    // if we forget this, printf
    // will trash them
    sub sp, sp, #16
    stp w3, w4, [sp]

    bl print_val

    ldp w3, w4, [sp]
    add sp, sp, #16

    cmp w4, #11
    b.lt loop

    // Epilogue
    // restore lr and fp
    ldp x29, x30, [sp]
    add sp, sp, #16
    mov w0, w3
    ret

print_val: 
    sub sp, sp, #16
    stp x29, x30, [sp]

    ldr x0, =msg
    mov x1, x4 
    bl printf

    ldp x29, x30, [sp]
    add sp, sp, #16

    ret
