// compile: gcc -c src2.s -o src2.o
// view disassembly: objdump -d src2.o 
.global main
main:
	// immediate
	add r5, r1, #2

	// register
	add r5, r1, r2

	// immediate shifted register
	add r5, r1, r2, lsl #2

	// register shifted register
	add r5, r1, r2, lsl r3
