#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string.h>

#define MAX_SIZE 10000
#define NUM_ALGORITHMS 6
#define NUM_TESTS 5

// Estrutura para armazenar resultados
typedef struct {
    char name[50];
    long comparisons;
    long swaps;
    double time;
    int stable;
} AlgorithmResult;

// Funções auxiliares
void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void copyArray(int source[], int dest[], int n) {
    for (int i = 0; i < n; i++) dest[i] = source[i];
}

// Bubble Sort com contadores
void bubbleSortCount(int arr[], int n, AlgorithmResult *result) {
    result->comparisons = 0;
    result->swaps = 0;
    
    for (int i = 0; i < n-1; i++) {
        int swapped = 0;
        for (int j = 0; j < n-i-1; j++) {
            result->comparisons++;
            if (arr[j] > arr[j+1]) {
                swap(&arr[j], &arr[j+1]);
                result->swaps++;
                swapped = 1;
            }
        }
        if (!swapped) break;
    }
}

// Selection Sort com contadores
void selectionSortCount(int arr[], int n, AlgorithmResult *result) {
    result->comparisons = 0;
    result->swaps = 0;
    
    for (int i = 0; i < n-1; i++) {
        int min_idx = i;
        for (int j = i+1; j < n; j++) {
            result->comparisons++;
            if (arr[j] < arr[min_idx]) {
                min_idx = j;
            }
        }
        if (min_idx != i) {
            swap(&arr[min_idx], &arr[i]);
            result->swaps++;
        }
    }
}

// Insertion Sort com contadores
void insertionSortCount(int arr[], int n, AlgorithmResult *result) {
    result->comparisons = 0;
    result->swaps = 0;
    
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;
        
        while (j >= 0) {
            result->comparisons++;
            if (arr[j] > key) {
                arr[j + 1] = arr[j];
                result->swaps++;
                j--;
            } else {
                break;
            }
        }
        arr[j + 1] = key;
        if (j + 1 != i) result->swaps++;
    }
}

// Merge Sort com contadores
void mergeCount(int arr[], int l, int m, int r, AlgorithmResult *result) {
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;
    
    int *L = malloc(n1 * sizeof(int));
    int *R = malloc(n2 * sizeof(int));
    
    for (i = 0; i < n1; i++) L[i] = arr[l + i];
    for (j = 0; j < n2; j++) R[j] = arr[m + 1 + j];
    
    i = 0; j = 0; k = l;
    
    while (i < n1 && j < n2) {
        result->comparisons++;
        if (L[i] <= R[j]) {
            arr[k] = L[i];
            i++;
        } else {
            arr[k] = R[j];
            j++;
        }
        result->swaps++;
        k++;
    }
    
    while (i < n1) {
        arr[k] = L[i];
        result->swaps++;
        i++; k++;
    }
    
    while (j < n2) {
        arr[k] = R[j];
        result->swaps++;
        j++; k++;
    }
    
    free(L);
    free(R);
}

void mergeSortCountRec(int arr[], int l, int r, AlgorithmResult *result) {
    if (l < r) {
        int m = l + (r - l) / 2;
        mergeSortCountRec(arr, l, m, result);
        mergeSortCountRec(arr, m + 1, r, result);
        mergeCount(arr, l, m, r, result);
    }
}

void mergeSortCount(int arr[], int n, AlgorithmResult *result) {
    result->comparisons = 0;
    result->swaps = 0;
    mergeSortCountRec(arr, 0, n-1, result);
}

// Quick Sort com contadores
int partitionCount(int arr[], int low, int high, AlgorithmResult *result) {
    int pivot = arr[high];
    int i = low - 1;
    
    for (int j = low; j <= high - 1; j++) {
        result->comparisons++;
        if (arr[j] < pivot) {
            i++;
            swap(&arr[i], &arr[j]);
            result->swaps++;
        }
    }
    swap(&arr[i + 1], &arr[high]);
    result->swaps++;
    return i + 1;
}

void quickSortCountRec(int arr[], int low, int high, AlgorithmResult *result) {
    if (low < high) {
        int pi = partitionCount(arr, low, high, result);
        quickSortCountRec(arr, low, pi - 1, result);
        quickSortCountRec(arr, pi + 1, high, result);
    }
}

void quickSortCount(int arr[], int n, AlgorithmResult *result) {
    result->comparisons = 0;
    result->swaps = 0;
    quickSortCountRec(arr, 0, n-1, result);
}

// Heap Sort com contadores
void heapifyCount(int arr[], int n, int i, AlgorithmResult *result) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    
    if (left < n) {
        result->comparisons++;
        if (arr[left] > arr[largest]) largest = left;
    }
    
    if (right < n) {
        result->comparisons++;
        if (arr[right] > arr[largest]) largest = right;
    }
    
    if (largest != i) {
        swap(&arr[i], &arr[largest]);
        result->swaps++;
        heapifyCount(arr, n, largest, result);
    }
}

void heapSortCount(int arr[], int n, AlgorithmResult *result) {
    result->comparisons = 0;
    result->swaps = 0;
    
    // Build max heap
    for (int i = n / 2 - 1; i >= 0; i--)
        heapifyCount(arr, n, i, result);
    
    // Extract elements
    for (int i = n - 1; i > 0; i--) {
        swap(&arr[0], &arr[i]);
        result->swaps++;
        heapifyCount(arr, i, 0, result);
    }
}

// Testes de desempenho
void testAlgorithms() {
    int sizes[] = {100, 500, 1000, 5000, 10000};
    AlgorithmResult results[NUM_ALGORITHMS];
    
    // Inicializar resultados
    AlgorithmResult algorithms[NUM_ALGORITHMS] = {
        {"Bubble Sort", 0, 0, 0.0, 1},
        {"Selection Sort", 0, 0, 0.0, 0},
        {"Insertion Sort", 0, 0, 0.0, 1},
        {"Merge Sort", 0, 0, 0.0, 1},
        {"Quick Sort", 0, 0, 0.0, 0},
        {"Heap Sort", 0, 0, 0.0, 0}
    };
    
    printf("=== ANÁLISE COMPARATIVA DE ALGORITMOS DE ORDENAÇÃO ===\n\n");
    
    for (int s = 0; s < NUM_TESTS; s++) {
        int n = sizes[s];
        int *original = malloc(n * sizeof(int));
        int *arr = malloc(n * sizeof(int));
        
        // Gerar array aleatório
        srand(time(NULL));
        for (int i = 0; i < n; i++) {
            original[i] = rand() % 10000;
        }
        
        printf("\n=== TAMANHO DO ARRAY: %d ===\n", n);
        printf("%-20s %12s %12s %12s\n", 
               "Algoritmo", "Comparações", "Trocas", "Tempo(ms)");
        printf("----------------------------------------------------------\n");
        
        // Testar cada algoritmo
        for (int a = 0; a < NUM_ALGORITHMS; a++) {
            copyArray(original, arr, n);
            
            clock_t start = clock();
            
            switch(a) {
                case 0: bubbleSortCount(arr, n, &algorithms[a]); break;
                case 1: selectionSortCount(arr, n, &algorithms[a]); break;
                case 2: insertionSortCount(arr, n, &algorithms[a]); break;
                case 3: mergeSortCount(arr, n, &algorithms[a]); break;
                case 4: quickSortCount(arr, n, &algorithms[a]); break;
                case 5: heapSortCount(arr, n, &algorithms[a]); break;
            }
            
            clock_t end = clock();
            algorithms[a].time = ((double)(end - start) * 1000.0) / CLOCKS_PER_SEC;
            
            printf("%-20s %12ld %12ld %12.3f\n", 
                   algorithms[a].name,
                   algorithms[a].comparisons,
                   algorithms[a].swaps,
                   algorithms[a].time);
        }
        
        free(original);
        free(arr);
    }
    
    // Análise Teórica vs Prática
    printf("\n\n=== ANÁLISE TEÓRICA vs PRÁTICA ===\n");
    printf("Para n = 10000:\n");
    printf("1. Bubble Sort (O(n²)): Esperado ~50M comparações\n");
    printf("2. Merge Sort (O(n log n)): Esperado ~138k comparações\n");
    printf("3. Quick Sort (O(n log n) médio): Esperado ~160k comparações\n");
    printf("4. Insertion Sort (O(n²)): Esperado ~25M comparações\n");
}

// Demonstração de complexidade com notação assintótica
void demonstrateComplexity() {
    printf("\n\n=== CÁLCULO DE COMPLEXIDADE ASSINTÓTICA ===\n");
    
    printf("\n1. Bubble Sort - Pior Caso:\n");
    printf("   Comparações: ∑(i=1 até n-1) (n-i) = n(n-1)/2 = O(n²)\n");
    
    printf("\n2. Merge Sort - Recurrence Relation:\n");
    printf("   T(n) = 2T(n/2) + O(n)\n");
    printf("   Pelo Teorema Mestre:\n");
    printf("   a=2, b=2, f(n)=O(n)\n");
    printf("   n^(log_b a) = n^1 = n\n");
    printf("   Caso 2: T(n) = O(n log n)\n");
    
    printf("\n3. Quick Sort - Análise:\n");
    printf("   Melhor caso: T(n) = 2T(n/2) + O(n) = O(n log n)\n");
    printf("   Pior caso: T(n) = T(n-1) + O(n) = O(n²)\n");
    
    printf("\n4. Notação Assintótica Prática:\n");
    printf("   O(1) < O(log n) < O(n) < O(n log n) < O(n²) < O(2^n)\n");
}

int main() {
    testAlgorithms();
    demonstrateComplexity();
    
    printf("\n\n=== CONCLUSÕES ===\n");
    printf("1. Para pequenos conjuntos (n < 100): Insertion Sort pode ser mais eficiente\n");
    printf("2. Para conjuntos médios (100 < n < 1000): Quick Sort é geralmente o mais rápido\n");
    printf("3. Para grandes conjuntos (n > 1000): Merge Sort e Heap Sort são mais estáveis\n");
    printf("4. Bubble Sort e Selection Sort devem ser evitados para n > 1000\n");
    printf("5. Quick Sort tem melhor caso médio, mas Merge Sort garante O(n log n) no pior caso\n");
    
    return 0;
}
