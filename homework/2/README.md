# HW2 – ARM Assembly Reconstruction

## Given hex dump
e3a01000
e3a0200a
e3a03000
e3a04005
e0535004
b0800002
b2833001
bafffffb
ebffffff
e52de004
e3a0400f
e3a0500a
e0856004
e0535004
e0535004

## Instruction decoding
1. mov r1, #0
2. mov r2, #10
3. mov r3, #0
4. mov r4, #5
5. subs r5, r3, r4
6. addlt r0, r0, r2
7. addlt r3, r3, #1
8. blt loop
9. bl .+4
10. str lr, [sp, #-4]!
11. mov r4, #15
12. mov r5, #10
13. add r6, r5, r4
14. subs r5, r3, r4
15. subs r5, r3, r4

## Program logic
The loop executes while r3 < r4 (signed comparison).
Each iteration adds 10 to r0 and increments r3.
The loop runs 5 times, resulting in r0 = 50.

## Reason for crash
The instruction `str lr, [sp, #-4]!` pushes LR onto the stack.
Since SP is never initialized, it starts at 0x00000000.
This causes an invalid memory access and program termination.
