/* Equivalent C:
 *
 * void set_value(int *ptr) {
 *     *ptr = 42;
 * }
 *
 * int main(void) {
 *     int value;
 *     set_value(&value);
 *     return 0;
 * }
 *
 */

.text
.global main
main:
    stp x29, x30, [sp, #-32]!
    mov x29, sp

    add x0, sp, #16
    bl set_value 

    mov w0, #0
    ldp x29, x30, [sp], #32
    ret

set_value:
    mov w1, #42
    str w1, [x0]          
    ret 

