# Daily Coding Problem 1 - EASY
## Complement in list

Given a list of numbers and a number `k`, return whether any two numbers from the list add up to `k`.  
For example, given `[10, 15, 3, 7]` and a `k` of `17`, return true since `10+7` is `17`.  
Bonus: Can you do this in one pass?

### Solution:
I'm going to do this one in C++ since MATLAB would be cheating (you can simply do `any(ismember(list, abs(k - list)))`) and the rest of my git is mainly Elixir. The problem asks us if we can do it in one pass - the answer is yes and the easy way is to:
- Create an empty set for tracking "k-complements" (`k - list[i]`).
- Traverse the list, calculate each element's "k-complement" 
    - If the **element** exists in the tracking set, break and return TRUE
    - If the **element** does not exist in the set, add it's **"k-complement"** to the set and move to the next element

This method has O(n) complexity for both time and space - probably not optimized but satisfies the conditions of the question. Full code can be found in (complement_finder.cpp)[complement_finder.cpp], which has three lists and accompanying `k` values hard-coded in. Compiling and running the code for each of the lists yields the following results:

**using { 10, 15, 3, 7 }, k = 17**\
Expecting TRUE (1)
```
1
```

**using { 5, 4, 3, 2 }, k = 17**\
Expecting FALSE (0)
```
0
```

**using { 5, 4, 3, 2 }, k = 7**\
Expecting TRUE (1)
```
1
```

There's no contingency in place for an empty list since the question states we're "given a list of numbers" - so I'm making the assumption that the list will not be empty.