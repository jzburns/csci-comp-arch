/*
void change_value(int value) {
    value = 42;
}

void change_reference(int *ptr) {
    *ptr = 42;
}

int main(void) {
    int val = 6;
    change_value(val);
    int after_value = val;
    change_reference(&val);
    return val - after_value;
}
*/

.text
.global main
main:
    stp x29, x30, [sp, #-32]!
    mov x29, sp
    mov w0, #6
    str w0, [sp, #16]

    ldr w0, [sp, #16]
    bl change_value
    ldr w0, [sp, #16]
    str w0, [sp, #20]

    add x0, sp, #16
    bl change_reference

    ldr w0, [sp, #16]
    ldr w1, [sp, #20]
    sub w0, w0, w1
    ldp x29, x30, [sp], #32
    ret

change_value:
    mov w0, #42
    ret

change_reference:
    mov w1, #42
    str w1, [x0]
    ret
