#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <time.h>
#include <semaphore.h>

#define NUM_LANES 2
#define MERGE_POINT 10
#define NUM_VEHICLES 20

// Estruturas de dados
typedef struct {
    int id;
    int lane;
    int position;
    int merged;
} Vehicle;

typedef struct {
    Vehicle *vehicles[NUM_VEHICLES];
    int count;
    pthread_mutex_t lock;
    sem_t merge_sem;
    int current_lane_turn; // Controle de alternância
} TrafficSystem;

// Variáveis globais
TrafficSystem traffic;
int simulation_running = 1;

// Inicialização do sistema
void init_traffic_system() {
    traffic.count = 0;
    pthread_mutex_init(&traffic.lock, NULL);
    sem_init(&traffic.merge_sem, 0, 1); // Semáforo binário para ponto de fusão
    traffic.current_lane_turn = 0; // Começa com pista 0
}

// Função para criar veículo
Vehicle* create_vehicle(int id, int lane) {
    Vehicle* v = malloc(sizeof(Vehicle));
    v->id = id;
    v->lane = lane;
    v->position = 0;
    v->merged = 0;
    return v;
}

// Função para simular movimento do veículo
void* vehicle_thread(void* arg) {
    Vehicle* v = (Vehicle*)arg;
    
    while (simulation_running && v->position < MERGE_POINT + 5) {
        usleep(100000 + rand() % 200000); // Velocidade variável
        
        pthread_mutex_lock(&traffic.lock);
        v->position++;
        
        // Verifica se chegou no ponto de fusão
        if (v->position == MERGE_POINT && !v->merged) {
            printf("Veículo %d (Pista %d) chegou ao ponto de fusão\n", 
                   v->id, v->lane);
            
            // Implementação do Zipper Merge
            while (1) {
                if (traffic.current_lane_turn == v->lane) {
                    // É a vez desta pista
                    sem_wait(&traffic.merge_sem); // Entra na seção crítica
                    
                    printf("  -> Veículo %d (Pista %d) FUNDE\n", 
                           v->id, v->lane);
                    
                    // Alterna a pista para o próximo veículo
                    traffic.current_lane_turn = (traffic.current_lane_turn + 1) % NUM_LANES;
                    
                    v->merged = 1;
                    sem_post(&traffic.merge_sem);
                    break;
                }
                usleep(50000); // Aguarda sua vez
            }
        }
        
        pthread_mutex_unlock(&traffic.lock);
    }
    
    printf("Veículo %d (Pista %d) concluiu o trajeto\n", v->id, v->lane);
    free(v);
    return NULL;
}

// Função para simulação com fusão antecipada (para comparação)
void* early_merge_simulation() {
    printf("\n=== SIMULAÇÃO FUSÃO ANTECIPADA ===\n");
    
    int lane_0_queue = 0;
    int lane_1_queue = 0;
    
    for (int i = 0; i < NUM_VEHICLES; i++) {
        int lane = rand() % NUM_LANES;
        
        if (lane == 0) {
            lane_0_queue++;
            printf("Veículo %d muda para pista principal cedo (Fila pista 0: %d)\n", 
                   i, lane_0_queue);
        } else {
            // Fusão antecipada: todos tentam mudar cedo
            if (lane_0_queue > lane_1_queue + 2) {
                lane_1_queue++;
                printf("Veículo %d mantém na pista de aceleração (Fila pista 1: %d)\n",
                       i, lane_1_queue);
            } else {
                lane_0_queue++;
                printf("Veículo %d muda para pista principal cedo (Fila pista 0: %d)\n",
                       i, lane_0_queue);
            }
        }
        
        usleep(50000);
    }
    
    printf("Resultado: Fila pista 0 = %d, Fila pista 1 = %d\n", 
           lane_0_queue, lane_1_queue);
    return NULL;
}

// Função principal
int main() {
    srand(time(NULL));
    pthread_t threads[NUM_VEHICLES];
    
    printf("=== SIMULAÇÃO ZIPPER MERGE ===\n");
    printf("Ponto de fusão na posição %d\n\n", MERGE_POINT);
    
    // Inicializa sistema
    init_traffic_system();
    
    // Cria veículos em threads separadas
    for (int i = 0; i < NUM_VEHICLES; i++) {
        int lane = rand() % NUM_LANES;
        Vehicle* v = create_vehicle(i, lane);
        
        printf("Veículo %d criado na Pista %d\n", i, lane);
        
        pthread_create(&threads[i], NULL, vehicle_thread, v);
        usleep(200000 + rand() % 300000); // Intervalo entre criação de veículos
    }
    
    // Aguarda conclusão da simulação
    sleep(10);
    simulation_running = 0;
    
    // Aguarda todas as threads
    for (int i = 0; i < NUM_VEHICLES; i++) {
        pthread_join(threads[i], NULL);
    }
    
    // Limpeza
    pthread_mutex_destroy(&traffic.lock);
    sem_destroy(&traffic.merge_sem);
    
    // Executa simulação comparativa
    early_merge_simulation();
    
    printf("\n=== ANÁLISE ===\n");
    printf("Zipper Merge:\n");
    printf("- Utiliza todas as pistas até o ponto de fusão\n");
    printf("- Alternância ordenada no ponto de fusão\n");
    printf("- Maior eficiência na utilização da via\n\n");
    
    printf("Fusão Antecipada:\n");
    printf("- Formação de longas filas em uma pista\n");
    printf("- Subutilização da capacidade da via\n");
    printf("- Maior probabilidade de congestionamentos\n");
    
    return 0;
}
