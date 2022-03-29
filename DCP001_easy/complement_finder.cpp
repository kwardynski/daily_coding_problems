#include <iostream>
#include <list>
#include <set>

using std::list;
using std::set;

main() {

    // Testing variables 1 - expect TRUE
    int int_list[] = { 10, 15, 3, 7 };
    int k = 17;

    // Testing variables 2 - expect FALSE
    // int int_list[] = { 5, 4, 3, 2 };
    // int k = 17;

    // Testing variables 3 - expect TRUE
    // int int_list[] = { 5, 4, 3, 2 };
    // int k = 7;

    // Initialize the comparison variables
    set<int> s;
    bool complement_found = false;

    // Loop through the list
    for (auto const& elem : int_list) {
        if (s.find(elem) != s.end()) {
            complement_found = true;
            break;
        }
        else {
          s.insert(k - elem);
        }
    }

    std::cout << complement_found << std::endl;
    return 0;

}