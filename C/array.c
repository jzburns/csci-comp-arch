#include <stdio.h>

int array[6] = { 2,3,11,4,55,6 };

int main(int argc, char* argv[]) {
  int *ptr = array;
  *(ptr += 4) += 10;
	printf("New number: %d\n", *ptr);
	return 0;
}


