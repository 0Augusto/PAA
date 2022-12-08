#include <stdio.h>
#include <stdlib.h>

#define H 10
#define L 10

int labirinto[L][H] = {
//C: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9      L
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, // 0
    {1, 1, 0, 1, 0, 0, 1, 1, 1, 0}, // 1
    {0, 1, 0, 1, 0, 0, 1, 0, 1, 0}, // 2
    {0, 1, 1, 1, 0, 0, 1, 1, 1, 0}, // 3
    {0, 0, 1, 0, 0, 0, 1, 0, 0, 0}, // 4
    {0, 0, 1, 1, 1, 0, 1, 0, 0, 0}, // 5
    {0, 1, 0, 0, 1, 1, 1, 0, 0, 0}, // 6
    {0, 1, 0, 0, 1, 0, 1, 0, 1, 1}, // 7
    {0, 1, 1, 1, 1, 0, 1, 1, 1, 0}, // 8
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}  // 9
};

void imprime_labirinto(int * fim) {

    for (int i = 0; i < L; i++) {
        printf("\n");

        for (int j = 0; j < H; j++) {
            printf("%d  ", labirinto[i][j]);
        }
    }
}

void backtracking(int * pos, int * saida) {
    // Verifica se ja esta resolvido
    if (    //Topo
        labirinto[ pos[0] - 1 ][ pos[1] ] != 0
        &&
        0 <= pos[1] < H
        &&
        0 <= (pos[0] - 1) < L
    ) {
        pos[0]--;

        labirinto[ pos[0] ][ pos[1] ] = 8;

        backtracking(pos, saida);

    } else if ( //Direita
        labirinto[ pos[0] ][ pos[1] + 1 ] != 0
        &&
        0 <= pos[0] < L
        &&
        0 <= (pos[1] + 1) < H
    ) {
        printf("\nENTREI\n");
        pos[0]--;

        labirinto[ pos[0] ][ pos[1] ] = 8;

        backtracking(pos, saida);

    } else if ( //Baixo
        labirinto[ pos[0] + 1 ][ pos[1] ] != 0
        &&
        0 <= pos[1] < H
        &&
        0 <= (pos[0] + 1) < L
    ) {
        pos[0]++;

        labirinto[ pos[0] ][ pos[1] ] = 8;

        backtracking(pos, saida);

    } else if ( //Esquerda
        labirinto[ pos[0] ][ pos[1] - 1 ] != 0
        &&
        0 <= pos[0] < L
        &&
        0 <= (pos[1] - 1) < H
    ) {
        pos[1]--;

        labirinto[ pos[0] ][ pos[1] ] = 8;

        backtracking(pos, saida);

    } else {
        printf("\nERRO!\nLabinto sem saida");
    }

    if (labirinto[ pos[0] ][ pos[1] ] == labirinto[ saida[0] ][ saida[1] ]) {
        imprime_labirinto(saida);
        printf("\nSAI\n");
    }
}

int main() {

    int saida[] = {7, 9};
    int pos[] = {1, 0};

    backtracking(pos, saida);
    return 0;
}
