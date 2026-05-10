.global main

main:
	ldr r0, =array
	mov r2, #10
	str r2, [r0, #4]
	ldr r7, =0X00FFFFAA
	add r5, r6, r7
	.ltorg // can be placed anywhere
	add r5, r6, r7
	ldr r1, =array
labelx:
	add r5, r6, r7
.data
	array: .word 1,2,3,4,5,6
