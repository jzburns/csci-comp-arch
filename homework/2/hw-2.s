.global _start
.text

_start:
    mov     r1, #0         @ e3a01000
    mov     r2, #10        @ e3a0200a
    mov     r3, #0         @ e3a03000
    mov     r4, #5         @ e3a04005

loop:
    subs    r5, r3, r4     @ e0535004
    addlt   r0, r0, r2     @ b0800002
    addlt   r3, r3, #1     @ b2833001
    blt     loop            @ bafffffb

    bl      .+4            @ ebffffff

after_push:
    str     lr, [sp, #-4]! @ e52de004

    mov     r4, #15         @ e3a0400f
    mov     r5, #10         @ e3a0500a
    add     r6, r5, r4      @ e0856004
    subs    r5, r3, r4      @ e0535004
    b       after_push      @ eafffff9
