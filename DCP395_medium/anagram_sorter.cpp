#include <algorithm>
#include <iostream>
#include <vector>
#include <map>
#include <string>

using namespace std;

int main () {

    string word_list[] = {"eat", "ate", "apt", "pat", "tea", "now"};

    // Initialize "comparison" variables
    string sorted_word;                                 // string to hold "sorted" word
    map<string, vector<string>> anagram_bin;            // map to hold sorted anagrams

    // Sort the words in the word array
    for (const auto& word : word_list) {
        sorted_word = word;                             // copy "word" since we DON'T want to change it
        sort(sorted_word.begin(), sorted_word.end());   // sort the letters of the copy alphabetically
        anagram_bin[sorted_word].push_back(word);       // add the unsorted word to anagram_bin using the sorted word as the key
    }

    // Display the results
    for (const auto& anagram : anagram_bin) {
       cout << "Anagrams of \"" << anagram.first << "\"" << endl;
       for (const auto& word : anagram.second) {
           cout << "   - " << word << endl;
       }
       cout << endl;
    }
    
    return 0;
}