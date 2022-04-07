#include <iostream>

using namespace std;


int main() {

    // Testing variables
    char lst[] = { 'G', 'B', 'R', 'R', 'B', 'R', 'G' };
    char pivot = 'G';

    // Tracking variables
    size_t list_length = sizeof(lst)/sizeof(lst[0]);
    size_t low = 0;
    size_t mid = 0;
    size_t high = list_length - 1;

    // Traverse through the list and sort
    while (mid <= high) {

        if (lst[mid] == 'R') {
            swap(lst[mid], lst[low]);
            ++mid;
            ++low;
        }

        else if (lst[mid] == 'G') {
            ++mid;
        }

        else {
            swap(lst[mid], lst[high]);
            --high;
        }
    };

    // Display results
    for (const auto& elem : lst) {
        cout << elem << " ";
    }
    cout << endl;

    return 0;
}