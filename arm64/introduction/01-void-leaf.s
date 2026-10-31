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
 * GNU assembler syntax for AArch64 Linux.
 * Build: gcc 01-void-leaf.s -o 01-void-leaf
 * Run:   ./01-void-leaf
 */

.text
.global main
main:
    // Allocate 32 bytes: frame record (16), local int and padding (16).
    stp x29, x30, [sp, #-32]!
    mov x29, sp

    add x0, sp, #16              // x0 = &value (first argument).
    bl set_value                // bl puts the return address in x30.

    mov w0, #0                  // main returns 0.
    ldp x29, x30, [sp], #32      // Restore fp/lr and deallocate the frame.
    ret

set_value:
    // A leaf calls no other functions, so this leaf need not save x30.
    mov w1, #42
    str w1, [x0]                // Store a 32-bit int through ptr.
    ret                         // A void function supplies no return value.

