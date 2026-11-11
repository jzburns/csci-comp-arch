#include <stdio.h>

// global variable
char msg[] = "Position %d \n";

int main (int argc, char* argv[]) {
	int i = 0;
	printf(msg, i);
	return i;
}

