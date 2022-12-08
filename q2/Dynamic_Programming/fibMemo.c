//Complexidade O(n)
//Top-Down
#include <stdio.h>
#include <stdlib.h>

#define N 10
static size_t count = 0;

void iterativeFibonacci(int *resArray, int n)
{
	for (int i = 0; i < n; i++) {
		resArray[i] = i == 0 || i == 1 ? i : resArray[i-1] + resArray[i-2];
	}
}

/**
* Constroi a cache representando a sequencia de Fibonacci.
* Note que, o segundo parametro eh um array index que permite a cache ser
* cehcada pelo elemento requerido. 
*/
int recursiveFibonacci(int *cache, int n)
{
	count++; // For analysis only

	// If the cache holds -1 at the required index, it has not yet been computed.
	if (cache[n] == -1) {
		cache[n] = recursiveFibonacci(cache, n - 1) + recursiveFibonacci(cache, n - 2);
	}
	return cache[n];
}

void printArray(int *arr, int n) {
	for (int i = 0; i < n; i++) {
		printf(i == 0 ? "[ %d" : ", %d", arr[i]);
	}
	puts(" ]\n");
}

int main(void)
{
	int r[N];
	iterativeFibonacci(r, N);
	printArray(r, N);
	
	// Inicializa um array de N elementos, cada elemento set para -1
	// Isso eh uma extensao GNU para o compilador GCC 
	int cache[N] = { [0 ... N-1] = -1 };

	// Os dois elementos da sequencia conhecidos setados na cache
	cache[0] = 0;
	cache[1] = 1;

	// A funcao recebe um ponteiro para a cache do array e indexa para o ultimo elemento.
	recursiveFibonacci(cache, N - 1);
	printArray(cache, N);
	printf("recursiveFibonacci() chamou %lu vezes.\n", count);
	return 0;
}
