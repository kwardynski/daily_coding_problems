# Daily Coding Problem 483 - EASY
## Prisoner Execution

There are `N` prisoners standing in a circle, waiting to be executed. The executions are carried out starting with the `k`th person, and removing every successive `k`th person going clockwise until there is no one left.  
Given `N` and `k`, write an algorithm to determine where a prisoner should stand in order to be the last survivor.  
For example, if `N = 5` and `k = 2`, the order of executions would be `[2, 4, 1, 5, 3]`, so you should return `3`.  
Bonus: find an `O(log N)` solution if `k = 2`.


### Solution:
My initial thought would be treat the list of prisoners as a "circular list", proceed through it and dump every newly encountered prisoner into a map for `n-1` iterations, while increasing the location in the list only if a new prisoner is encountered, however this would require MANY operations (lots of checks) and I want to try to stick to more primitive data types. We could also construct a list of prisoners and pull elements out of it with for each prisoner "executed", however this requires time overhead to construct the list, and furthermore removing elements from within the list is costly, whereas simple recursion will take the same amount of space and less memory.  
Once the first person is killed, the remainder can be solved with the same algorithm using the same `k` value and `n-1` prisoners, however the trick is properly adjusting the starting position to account for this "rotation" of the list when we move to the next recursive call. What we can do adjust the return of calling the algorithm for `n-1` to account for the fact that this will assume a starting position of `k%n + 1`.  
The `main` function in [last_execution.cpp](last_execution.cpp) has 3 sets of testing values for `N` and `k`. When compiled and run yields the following results:
```
N = 5,  k = 2  | 3
N = 7,  k = 4  | 2
N = 15, k = 6  | 13
```