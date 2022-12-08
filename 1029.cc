#include <cstdio>
#include <cstdlib>
 
 
#define lln unsigned long long int
#define MAX 20001

int cont = 0;

int fibonacci(int n){
	cont++;
	if (n == 0 || n == 1)
		return n;
	else 
		return fibonacci(n-1) + fibonacci(n -2); 
}

int main(void){

	int n,fib;

	scanf("%i",&n);
	while(n--){
		scanf("%i",&fib);
		printf("fib(%i) = %i calls = %i\n",fib,cont-1,fibonacci(fib));
		cont = 0;
	}
}
