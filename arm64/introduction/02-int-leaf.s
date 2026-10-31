/* Equivalent C:
 *
 * int square(int value) {
 *     return value * value;
 * }
 *
 * int main(void) {
 *     return square(6);
 * }
 *
 * GNU assembler syntax for AArch64 Linux.
 * Build: gcc 02-int-leaf.s -o 02-int-leaf
 * Run:   ./02-int-leaf; echo $?     # Exit status: 36
 */

.text
.global main

main:
    // main calls another function, so preserve its own return address.
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov w0, #6                  // First int argument goes in w0.
    bl square                   // square returns its int result in w0.

    ldp x29, x30, [sp], #16      // Leave w0 unchanged for main's return.
    ret

square:
    // No calls, local storage or callee-saved registers are needed.
    mul w0, w0, w0              // w0 = value * value.
    ret                         // Return using the address in x30.
