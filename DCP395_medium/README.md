# Daily Coding Problem 395 - MEDIUM
## Anagram Sorting

Given an array of strings, group anagrams together.  
For example, given the following array:
```
['eat', 'ate', 'apt', 'pat', 'tea', 'now']
```
Return:
```
[['eat', 'ate', 'tea'],
 ['apt', 'pat'],
 ['now']]
```

### Solution
Once again it's time to pump up the C++ numbers. I'm going to use a `map` to sort the words into their anagram categories, with the alphabetically sorted letters of the word used as the map keys (i.e. "eat" -> "aet").
1. Initialize a map to hold our sorted results, using a `string` for the keys, and a `vector<string>` as the field values.
2. Loop through each word in the input list, sort the letters in the word alphabetically to get the necessary key - all anagrams will have come out identical if we sort the letters this way.
3. Add the unsorted word to the map using the alphabetically sorted word as the key.
4. Display the results

My solution is found in [anagram_sorter.cpp](anagram_sorter.cpp), which contains the supplied example word list as a hard-coded variable called `word_list`. When compiled and run, yields the following results:
```
Anagrams of "aet"
   - eat
   - ate
   - tea

Anagrams of "apt"
   - apt
   - pat

Anagrams of "now"
   - now
```