#include <stdio.h>
#include <stdlib.h>

int main (int argc, char** argv) {
  int *p = 0;
   {
     int x = 123;
     p = &x;
  } // x is out of scope here

  // Use-after-scope
  printf("%d\n", *p);
	return 0;
}
