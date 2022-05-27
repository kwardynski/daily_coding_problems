#include <stdio.h>

void tower_of_hanoi(int n, int source, int aux, int goal) {

    if (n > 0) {
        tower_of_hanoi(n-1, source, goal, aux);
        printf("Move %d to %d\n", source, goal);
        tower_of_hanoi(n-1, aux, source, goal);
    }
}


int main() {

    // Define start/end of n values to test (going from 1 to 4)
    int start = 1;
    int end = 4;

    // Call the tower of hanoi solution for the values of n
    for (int i = start; i < end; i ++){
        printf("Tower of Hanoi solution for %d disk(s):\n", i);
        tower_of_hanoi(i, 1, 2, 3);
        printf("\n");
    }
}