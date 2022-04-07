#include <iostream>

using namespace std;


int main() {

    // Testing variables
    int x = 10;
    int lst[] = { 9, 12, 3, 5, 14, 10, 10 };

    // Tracking variables
    size_t lst_length = sizeof(lst)/sizeof(lst[0]);
    size_t pointer_low = 0;
    size_t current = 0;
    size_t pointer_high = lst_length-1;
    
    // Traverse the list and sort 
    while (current <= pointer_high) {

        // If the current element is less than pivot value, swap it with the
        // element at current and increase both pointers
        if (lst[current] < x) {
            swap(lst[current], lst[pointer_low]);
            ++current;
            ++pointer_low;
        }

        // If the current element is greater than pivot value, swap it with the
        // element and decrease pointer_high
        else if (lst[current] > x) {
            swap(lst[current], lst[pointer_high]);
            --pointer_high;
        }

        // If the current element is equal to pivot value, move to the next one
        else {
            ++current;
        }
    }

    // Print sorted results:
    for (const auto& elem : lst){
        cout << elem << " ";
    }
    cout << endl;

    return 0;
}