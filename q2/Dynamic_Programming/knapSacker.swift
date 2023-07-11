/*

O Problema da Mochila é um problema clássico de otimização na ciência da computação. Dado um conjunto de itens, cada um com um peso e um valor, a tarefa é determinar a combinação mais valiosa de itens que pode ser incluída em uma mochila com um limite de peso dado, sem excedê-lo.

O problema pode ser formulado da seguinte forma:

Entrada:
pesos: um array de pesos dos itens.
valores: um array de valores dos itens.
capacidade: o peso máximo que a mochila pode suportar.

Saída:
O valor máximo que pode ser alcançado ao incluir um subconjunto de itens na mochila.

A abordagem de programação dinâmica é comumente usada para resolver o Problema da Mochila. Ela envolve a criação de uma tabela para armazenar o valor máximo que pode ser alcançado para diferentes combinações de itens e limites de peso.

Neste exemplo, definimos a estrutura Item para representar cada item com seu peso e valor. A função knapsack recebe um array de itens e a capacidade como entrada e retorna o valor máximo que pode ser alcançado.

Usamos uma matriz bidimensional dp para armazenar os valores máximos. As linhas representam os itens e as colunas representam a capacidade de peso. Inicializamos a primeira linha e coluna com zeros, pois representam o caso de não ter itens ou capacidade de peso zero.

Os loops aninhados percorrem cada item e capacidade de peso. Para cada item, comparamos duas opções: incluir o item atual ou excluí-lo. Escolhemos a opção que maximiza o valor.

Por fim, retornamos o valor máximo encontrado em dp[numItems][capacity].

A complexidade de tempo dessa solução de programação dinâmica para o Problema da Mochila é O(numItems * capacity), onde numItems é o número de itens e capacity é a capacidade máxima de peso. A complexidade de espaço também é O(numItems * capacity), pois precisamos armazenar os resultados intermediários na matriz bidimensional dp.

*/

struct Item {
    let weight: Int
    let value: Int
}

func knapsack(items: [Item], capacity: Int) -> Int {
    let numItems = items.count
    var dp = Array(repeating: Array(repeating: 0, count: capacity + 1), count: numItems + 1)
    // dp[i][j] will store the maximum value for a knapsack with capacity j considering the first i items

    for i in 1...numItems {
        let item = items[i - 1]
        // We subtract 1 from i to access the corresponding item in the items array

        for j in 1...capacity {
            if item.weight > j {
                // If the current item's weight is greater than the current capacity j,
                // we cannot include it, so we take the maximum value obtained without this item
                dp[i][j] = dp[i - 1][j]
            } else {
                // Otherwise, we have two options: include the current item or exclude it
                // We choose the option that maximizes the value
                dp[i][j] = max(dp[i - 1][j], item.value + dp[i - 1][j - item.weight])
            }
        }
    }

    return dp[numItems][capacity]
    // Return the maximum value achievable with all items and the given capacity
}

// Example usage:
let items = [
    Item(weight: 2, value: 3),
    Item(weight: 3, value: 4),
    Item(weight: 4, value: 5),
    Item(weight: 5, value: 6)
]

let capacity = 5

let maxValue = knapsack(items: items, capacity: capacity)
print("Maximum value: \(maxValue)")

