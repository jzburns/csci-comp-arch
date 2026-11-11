// there is no .data section here
// there are no global variables in this program

.text
// .text is used for instructions only

.global _main 

// entrypoint OS begins execution of the program
// int main (int argc, char *argv[])
// main should return an int but return it to where?
// to the OS

_main:
    // Compare two values
    mov w1, #9    // w reg => 32 bit int
    mov w2, #12   // w reg => 32 bit int

    cmp w1, w2    // alias => subs xzr, ...

    // Branch if 9 is less than 12
    b.gt less_case // this will evaluate to true - N=1

    mov w0, #0  //w0 is where the OS looks for the return value from main
    ret

less_case:
    mov w0, #1 // places 1 into the 32 bit reg w0
               // w0 is where the OS looks for the return value from main
    ret        // return control to the OS
