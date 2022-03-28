#include <algorithm>
#include <iostream>
#include <vector>

using std::cout;
using std::endl;
using std::reverse;
using std::size_t;
using std::vector;

int main() {

    // Initial list of building heights: EAST -> WEST
    vector<int> building_heights = { 3, 7, 8, 3, 6, 1 };    // expected result: 3
    // vector<int> building_heights = { 1, 2, 3, 4, 5, 6 };    // expected result: 1
    // vector<int> building_heights = { 6, 5, 4, 3, 2, 1 };    // expected result: 6

    // Reverse the list so we can do a forward pass
    reverse(building_heights.begin(), building_heights.end());

    // Set "comparison" variables
    size_t sunset_view_count = 0;   // total buildings with view of sunset
    int max_height = 0;             // highest building encountered so far

    // Traverse through list and update sunset_view_count, max_height as necessary
    for (const auto &building : building_heights) {
        if (building > max_height) {
            max_height = building;
            ++sunset_view_count;
        }
    }

    cout << "A total of " << sunset_view_count << " building(s) have a sunset view." << endl;
    return 0;
}