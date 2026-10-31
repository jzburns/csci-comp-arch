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
 */

.text
.global main

main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov w0, #6
    bl square

    ldp x29, x30, [sp], #16
    ret

square:
    mul w0, w0, w0
    ret 
