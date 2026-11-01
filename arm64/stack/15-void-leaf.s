/*
void set_value(int *ptr) {
    *ptr = 42;
}

int main(void) {
    int value;
    set_value(&value);
    return 0;
}
*/

.text
.global main

main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16

    mov x0, sp
    bl set_value

    mov w0, #0

    add sp, sp, #16
    ldp x29, x30, [sp], #16
    ret

set_value:
    mov w1, #42
    str w1, [x0]
    ret
