// abc
cmp r0, r1
sub r0, r1, r5 // subtract this first
mov r0, r5 // comment 
add r0, r1, r5
ldr r0, [ r1 ] //comment
ldr r0, [ r1 ]
ldr r0, [ r1, #6 ]
ldr r0, [ r1 ], #6 // another long comment
ldr r0, [ r1 ], r6 // another long comment
ldr r0, [ r1, #32 ]! // another long comment
ldr r0, [ r1, r3 ]! // another long comment
here:
	mov r0, #6 
	mov r0, r5 // comment 
