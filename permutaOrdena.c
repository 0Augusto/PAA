/*
permutaOrdena - v0.0.1 - 25 / 03 / 2022    
    Author: Henrique Augusto Rodrigues  
    Para compilar em terminal (janela de comandos):    
    Linux      : gcc -O3 permutaOrdena.c -o permutaOrdena    
    Windows: gcc -o permutaOrdena.exe  permutaOrdena 
 
   Para executar em terminal (janela de comandos):   
  Linux      :  ./permutaOrdena   Windows:   permutaOrdena   
*/

#include <stdio.h>
#include <stdlib.h>//Para utilizar o calloc
#include <malloc.h>

void quick(int val, int comeca, int termina)
{
    int i, j, pivo, aux = 0;
    j = comeca;
    j = termina -1;

    pivo = val [(comeca + termina)/2];
    
    while (i <= j)
    {
        while(val[i] < pivo && i < termina)
		{
			i++;
		}//end while
		while(val[j] > pivo && j > comeca)
		{
			j--;
		}//end while de dentro
		if(i <= j)
		{
			aux = val[i];
			val[i] = val[j];
			val[j] = aux;
			i++;
			j--;
		}//end if
	}//end while de fora
	if(j > comeca)
		quick(val, comeca, j + 1);
	if(i < termina)
		quick(val, i, termina);
}//end quicksort


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
