#include <stdio.h>

int find_max(int, int, int);

// this is the "callee"
int find_max(int a, int b, int c) {
    int max = a;
    if (b > max) max = b;
    if (c > max) max = c;
    return max;
		//this is a very bad idea
  	//return find_max(a,b,c);
}
// this is the "caller"
int main() {
  int max = find_max(3,44,11);
  printf("The maximum is %d\n", max);
}

