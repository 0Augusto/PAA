/*
Ordenação - v0.0.1 - 25 / 03 / 2022    Author: Henrique Augusto Rodrigues  
    Para compilar em terminal (janela de comandos):    
    Linux      : gcc -O3 Ordenacao.c -o Ordenacao    
    Windows: gcc -o Ordenacao.exe  Ordenação 
 
   Para executar em terminal (janela de comandos):   
  Linux      :  ./Ordenacao   Windows:   Ordenacao   
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
}//end void

int main()
{
    


}//end main
