/*
 * 07-sum-1-to-10.s
 * sum the numbers from 1 to 10
 */

// program global variables
.data
  msg: .asciz "Position %d \n"

.text
.global main

main:
    // Prologue: save lr and fp
    stp x29, x30, [sp, #-16]!

    mov w3, #0
    mov w4, #1

loop:
    add w3, w3, w4
    add w4, w4, #1

    // x0-x17 are caller preserved
    // if we forget this, the callees
    // will probably trash them
    // so save w3/w4
    stp w3, w4, [sp, #-16]!

    bl print_val

    // now restore w3/w4
    ldp w3, w4, [sp], #16

    // if w4 <= 10, repeat
    cmp w4, #11
    b.lt loop

    // Epilogue: restore lr and fp
    // and set up the return value
    ldp x29, x30, [sp], #16
    mov w0, w3
    ret

print_val: 
    // Prologue: save lr and fp
    stp x29, x30, [sp, #-16]!

    ldr x0, =msg
    mov x1, x4 
    bl printf

    // Epilogue: restore lr and fp
    ldp x29, x30, [sp], #16

    ret
