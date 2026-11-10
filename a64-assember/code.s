.text
// abc
cmp x0, x1
sub x0, x1, x5 // subtract this first
mov x0, x5 // comment 
add x0, x1, x5
ldr x0, [ x1 ] //comment
ldr x0, [ x1 ]
ldr x0, [ x1, #6 ]
ldr x0, [ x1 ], #6 // another long comment
ldr x0, [ x1 ], X6 // another long comment
ldr x0, [ x1, #-32 ]! // another long comment
ldr x0, [ x1, x22 ]! // another long comment
ldr x0, [ sp ] // another long comment
ldr x0, =array // load the address of the first element of var into r0
here:
	mov x0, #6 
	mov x0, x5 // comment 

.data
