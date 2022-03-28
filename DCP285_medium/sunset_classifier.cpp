#include <algorithm>
#include <iostream>
#include <vector>

using std::cout;
using std::endl;
using std::reverse;
using std::vector;

int main() {

    // Initial list of building heights: EAST -> WEST
    vector<int> building_heights = { 3, 7, 8, 3, 6, 1 };    // expected result: 3
    // vector<int> building_heights = { 1, 2, 3, 4, 5, 6 };    // expected result: 1
    // vector<int> building_heights = { 6, 5, 4, 3, 2, 1 };    // expected result: 6

    // Reverse the list so we can do a forward pass
    reverse(building_heights.begin(), building_heights.end());

    // Set "comparison" variables
    typedef vector<int>::size_type vlen;
    vlen sunset_view_count = 0;           // total buildings with view of sunset
    int max_height = 0;                   // highest building encountered so far

    // Loop through list and update sunset_view_count, max_height as necessary
    for (vlen i = 0; i != building_heights.size(); ++i) {
        if (building_heights[i] > max_height) {
            max_height = building_heights[i];
            ++sunset_view_count;
        }
    }

    cout << "A total of " << sunset_view_count << " building(s) have a sunset view." << endl;
    return 0;
}