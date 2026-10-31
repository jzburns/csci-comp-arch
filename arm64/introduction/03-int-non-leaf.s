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
    bl twice_next

    ldp x29, x30, [sp], #16
    ret

twice_next:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    bl add_one
    lsl w0, w0, #1 

    ldp x29, x30, [sp], #16
    ret

add_one:
    add w0, w0, #1
    ret

