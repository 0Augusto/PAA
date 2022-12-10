// knapsack problem usando
// branch and bound
#include <bits/stdc++.h>
using namespace std;

// Estrutura para cada Item que armazena e corresponde o
// valor do item
struct Item
{
	float weight;
	int value;
};

// Node structure para armazenar informacao de decisão
// tree
struct Node
{
// nível --> Nível do nó na árvore de decisão (ou índice
// em arr[]
// lucro --> lucro dos nós no caminho da raiz até este
// nó (incluindo este nó)
// limite ---> Limite superior do lucro máximo na subárvore
// deste nó/
	int level, profit, bound;
	float weight;
};

// Função de comparação para classificar Item de acordo com
// relação val/peso
bool cmp(Item a, Item b)
{
	double r1 = (double)a.value / a.weight;
	double r2 = (double)b.value / b.weight;
	return r1 > r2;
}

// Retorna o limite de lucro na subárvore enraizada com u.
// Esta função usa principalmente a solução Greedy para encontrar
// um limite superior no lucro máximo.
int bound(Node u, int n, int W, Item arr[])
{
	// se o peso ultrapassar a capacidade da mochila, retorna
// 0 como limite esperado
	if (u.weight >= W)
		return 0;

	// inicializa o limite do lucro pelo lucro atual
	int profit_bound = u.profit;

	// começa a incluir itens do índice 1 mais para o atual
// índice de itens
	int j = u.level + 1;
	int totweight = u.weight;

	// verificando a condição do índice e a capacidade da mochila
    // condicao
	while ((j < n) && (totweight + arr[j].weight <= W))
	{
		totweight += arr[j].weight;
		profit_bound += arr[j].value;
		j++;
	}

	// Se k não for n, inclua o último item parcialmente para
// limite superior do lucro
	if (j < n)
		profit_bound += (W - totweight) * arr[j].value /
										arr[j].weight;

	return profit_bound;
}

// Retorna o lucro máximo que podemos obter com a capacidade W
int knapsack(int W, Item arr[], int n)
{
	// ordenando o item com base no valor por unidade
// peso.
	sort(arr, arr + n, cmp);

	// faz uma fila para atravessar o nó
	queue<Node> Q;
	Node u, v;

	// nó fictício no início
	u.level = -1;
	u.profit = u.weight = 0;
	Q.push(u);

	// Um por um extrai um item da árvore de decisão
// calcula o lucro de todos os filhos do item extraído
// e continue salvando maxProfit
	int maxProfit = 0;
	while (!Q.empty())
	{
		//Desenfileira um nó
		u = Q.front();
		Q.pop();

		// Se estiver iniciando o nó, atribui o nível 0
		if (u.level == -1)
			v.level = 0;

		// Se não houver nada no próximo nível
		if (u.level == n-1)
			continue;

		// Caso contrário, se não for o último nó, então incrementa o nível,
// e calcula o lucro dos nós filhos.
		v.level = u.level + 1;

		// Pegando o item do nível atual add current
// peso e valor do nível para o nó u's
//peso e valor
		v.weight = u.weight + arr[v.level].weight;
		v.profit = u.profit + arr[v.level].value;

		// Se o peso acumulado for menor que W e
// o lucro é maior que o lucro anterior,
// atualiza o lucro máximo
		if (v.weight <= W && v.profit > maxProfit)
			maxProfit = v.profit;

		// Obter o limite superior do lucro para decidir
// se deve ou não adicionar v a Q.
		v.bound = bound(v, n, W, arr);

		// Se o valor vinculado for maior que o lucro,
// então só entra na fila para mais
// consideração
		if (v.bound > maxProfit)
			Q.push(v);

		// Faça a mesma coisa, mas sem tirar
// o item na mochila
		v.weight = u.weight;
		v.profit = u.profit;
		v.bound = bound(v, n, W, arr);
		if (v.bound > maxProfit)
			Q.push(v);
	}

	return maxProfit;
}

// programa de driver para testar a função acima
int main()
{
	int W = 10; // Peso da mochila
	Item arr[] = {{2, 40}, {3.14, 50}, {1.98, 100},
				{5, 95}, {3, 30}};
	int n = sizeof(arr) / sizeof(arr[0]);

	cout << "Maximum possible profit = "
		<< knapsack(W, arr, n);

	return 0;
}


