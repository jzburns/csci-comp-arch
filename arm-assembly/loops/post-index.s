.global main
main:
	ldr r0, =array1
	mov r1, #0
	mov r2, #0

loop:
	cmp r2, #6
	bge end
	ldr r3, [r0, r1]
	add r3, r3, #10
	// save r3 on the stack too
	push { r3 }
	str r3, [r0], #4
	add r2, r2, #1
	b loop
end:
	svc #0

.data

array1: .word 2,3,11,4,55,6
