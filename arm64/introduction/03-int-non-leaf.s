/* Equivalent C:
 *
 * int add_one(int value) {
 *     return value + 1;
 * }
 *
 * int twice_next(int value) {
 *     int next = add_one(value);
 *     return next * 2;
 * }
 *
 * int main(void) {
 *     return twice_next(20);
 * }
 *
 * GNU assembler syntax for AArch64 Linux.
 * Build: gcc 03-int-non-leaf.s -o 03-int-non-leaf
 * Run:   ./03-int-non-leaf; echo $?     # Exit status: 42
 */

.text
.global main
.type main, %function
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov w0, #20
    bl twice_next               // Result: (20 + 1) * 2 = 42 in w0.

    ldp x29, x30, [sp], #16
    ret
.size main, .-main

.type twice_next, %function
twice_next:
    // Save our caller's fp/lr before bl overwrites x30.
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    bl add_one                  // Argument and returned int both use w0.
    lsl w0, w0, #1              // next stays in a register; no stack slot needed.

    ldp x29, x30, [sp], #16      // Restore our caller's return address.
    ret
.size twice_next, .-twice_next

.type add_one, %function
add_one:
    add w0, w0, #1              // Leaf helper: no frame needed here.
    ret
.size add_one, .-add_one

// Every allocation is matched by deallocation; sp stays 16-byte aligned.
.section .note.GNU-stack,"",%progbits
