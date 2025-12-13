/*
 * simple.C
 * a file to show the layout of objects
 * in the a.out executable
 * using objdump -s -C
 * */
#include <stdio.h>

// initialized global variable (r/w)
int global_var1 = 100;

// uninitialized global variable (r/w)
int global_var2;

// initialized global variable (r/w) string
char global_var3[] = "This is a global string";

int main(int argc, char* argv[]) {
        int local_var = 99;
        // the reference to prinf should be mentioned in the .dynstr
        // the string itself ("Globals are ...") is r/o in .data
        printf("Globals are %d %d %s\n", global_var1, global_var2, global_var3);
        return 0;
}
