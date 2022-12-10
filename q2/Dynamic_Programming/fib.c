
#include<stdio.h>
#include<stdlib.h>
int
main ()
{
//array fib stores numbers of fibonacci series
  int fib[50];
// inicializa o elemento primeiro em 0
  fib[0] = 0;
// inicializa o segundo elemento em 1
  fib[1] = 1;
//gerar os 50 primeiros elementos
  for (int i = 2; i < 50; i++)
    {

      fib[i] = fib[i - 1] + fib[i - 2];
    }
  printf ("\n A sequencia eh : ");

  for (int i = 0; i < 50; i++)
    {
      printf ("%3d", fib[i]);
    }
  printf ("\n");
  return 0;
}
