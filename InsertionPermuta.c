#include <stdio.h>

void insertionSort (int v[], int length) {

  if(length <= 1) {
    return;
  }

  int i, j , k;

  for(i = 0; i < length; i++) {

    k = v[i];
    j = i;

    while (j > 0 && v[j - 1] > k) {

      v[j] = v[j - 1];
      j--;
      
    }

    v[j] = k;
    
  }
  
}

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
			troca(vetor, inf, i);
			permuta(vetor, inf + 1, sup);
			troca(vetor, inf, i); // backtracking
		}
	}
}//end permuta

int main(void) {

  int vetor[] = {10, 20, 1, 2, 5, 25, 0, -1};
  int length = sizeof(vetor) / sizeof(int);
  
  for(int i = 0; i < length; i++) {
    printf("%d ", vetor[i]);
  }

  printf("\n");
  
  insertionSort(vetor, length);

  for(int i = 0; i < length; i++) {
    printf("%d ", vetor[i]);
  }

  return 0;
  
}