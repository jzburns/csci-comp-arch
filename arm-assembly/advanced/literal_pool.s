/*
 * this code demonstrates the purpose of
 * the literal pool for optimizing immediate 
 * offset addressing
 */
global_start

_start:
	ldr r0, =array	// trigger literal pool creation
	str r2, [r0, #4]
	ldr r7, =0x00FFFFAA
	add r5, r6, r7
	add r5, r6, r7
	ldr r1, =array	// does this add another element to the pool?

labelx:
	add r5, r6, r7
	.ltorg					// force the placement of the literal pool here

.data
	array: .word 1,2,3,4,5,6
