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
 */

.text
.global main

main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov w0, #20
    bl twice_next               // Result: (20 + 1) * 2 = 42 in w0.

    ldp x29, x30, [sp], #16
    ret

twice_next:
    // Save our caller's fp/lr before bl overwrites x30.
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    bl add_one                  // Argument and returned int both use w0.
    lsl w0, w0, #1              // next stays in a register; no stack slot needed.

    ldp x29, x30, [sp], #16      // Restore our caller's return address.
    ret

add_one:
    add w0, w0, #1              // Leaf helper: no frame needed here.
    ret

