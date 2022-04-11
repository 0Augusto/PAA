/* Implementacao da variacao do QuickSort, o selectSort, ele é mais rápido. */
#include <stdio.h>
#include <stdlib.h>

 int k;
//Função que troca dois elementos
void swap(int* a, int* b)
{
    int t = *a;
    *a = *b;
    *b = t;
}
 
/* Esta função toma o último elemento como pivô, coloca o elemento pivô em sua posição correta em array e coloca todos menores (menores que o pivô) à esquerda do pivô e todos os elementos maiores à direita do pivô. */
int partition (int arr[], int low, int high)
{
    int pivot = arr[low];    // pivot
    int i = low,j;  // Index of smaller element
 
    for (j = low+1; j <= high; j++)
    {
        // Se o elemento atual eh menor que ou
        // igual ao pivo
        if (arr[j] <= pivot)
        {
            i++;    // increment index of smaller element
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i], &arr[low]);
    return i;
}
 
/* Funcao que implementa o quick
 arr[] --> Array to be sorted,
  low  --> comeca index,
  high  --> termina index */
void quickSelect(int arr[], int low, int high, int k)
{
    if (low < high)
    {
        /* pi eh um particionamento de index, arr[p] lugar certo */
        int pi = partition(arr, low, high);
       // int i;
        // Separadamente os elementos antes
        // particao e pos particao
        if(k <= pi)
            quickSelect(arr, low,pi - 1, k);
        if(k == pi+1)
            return;
        else
       	    quickSelect(arr,pi + 1, high, k);
       /* for (i = low; i < high; i++)
        printf("%d ", arr[i]);
        printf("\n");*/
    }
}
 
/* Funcao que imprime o array */
void printArray(int arr[], int size)
{
    int i;
    for (i=0; i < k; i++)
        printf("%d ", arr[i]);
    printf("\n");
}
/*
//Funcao de permutacao
void permuta(int vetor[], int inf, int sup)
{
	if(inf == sup)
	{
		for(int i = 0; i <= sup; i++)
			printf("%d ", vetor[i]);
		printf("\n");
	}
	else
	{
		for(int i = inf; i <= sup; i++)
		{
			troca(vetor[], inf, int i);
			permuta(vetor, inf + 1, sup);
			troca(vetor[], inf, int i); // backtracking
		}
	}
}//end permuta
*/
//Funcao main
int main()
{
    int n;
    printf("Enter the size\n");
    scanf("%d",&n);
    int i = 0, arr[n];
    int tam = (sizeof(arr[n])/sizeof(int));
    printf("Enter Elements\n");
    for (i = 0; i < n; i++)
    {
    	scanf("%d",&arr[i]);
    }
    printf("Enter K \n");
    scanf("%d",&k);
    quickSelect(arr, 0, n-1, k);
    printf("Lowest k elements: ");
   	printArray(arr, n);
return 0;
}
