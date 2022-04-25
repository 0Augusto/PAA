#include <stdlib.h>

void mergesort(int * vetor, int inicio, int fim) { //Na primeira chamada, mergesort(vetor, 0, n-1)

    if(inicio < fim) {

        int meio = (inicio + fim) / 2;
        mergesort(vetor, inicio, meio);
        mergesort(vetor, meio+1, fim);
        intercalar(vetor, inicio, meio, fim);
    }
}

void intercalar(int * array, int inicio, int meio, int fim) {

    int n1, n2, i, j, k;

   //Definir tamanho dos dois subarrays
   n1 = meio - inicio + 1;
   n2 = fim - meio;

   int * a1 = (int *) malloc((n1 + 1) * sizeof(int)); 
   int * a2 = (int *) malloc((n2 + 1) * sizeof(int));

   //Inicializar primeiro subarray
   for(i = 0; i < n1; i++){
      a1[i] = array[inicio + i];
   }

   //Inicializar segundo subarray
   for(j = 0; j < n2; j++){
      a2[j] = array[meio + j + 1];
   }

   //Sentinela no final dos dois arrays.
   a1[i] = a2[j] = 0x7FFFFFFF;

   //Intercalacao propriamente dita
   for(i = j = 0, k = inicio; k <= fim; k++){
      array[k] = (a1[i] <= a2[j]) ? a1[i++] : a2[j++];
   }
}
