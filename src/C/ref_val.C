#include <stdio.h>

//int val(int a, int b);
int ref(int* a, int* b);

int main(int argc, char* argv[]) {
	int a = 5;
	int b = 6;
	//int i = val(a,b);
	int i = ref(&a,&b);
	return 0;
}

/**
int val(int a, int b){
	int q = a += b;	
	return q;
}

**/

int ref(int* a, int* b){
	*a = 55;
	*b = 27;
	return 9;
}
