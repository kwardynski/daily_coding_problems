#include <iostream>

int find_last_survivor(int prisoners, int steps) {
    if (prisoners == 1) {
        return 1;
    }
    else {
        return (find_last_survivor(prisoners-1, steps) + steps-1) % prisoners + 1;
    }
}



int main() {
    std::cout << "N = 5,  k = 2  | " << find_last_survivor(5, 2) << std::endl;
    std::cout << "N = 7,  k = 4  | " << find_last_survivor(7, 4) << std::endl;
    std::cout << "N = 15, k = 6  | " << find_last_survivor(15, 6) << std::endl;
}