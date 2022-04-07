# Daily Coding Problem 448 - HARD
## Sorting with a Pivot part 2

Given an array of strictly the characters 'R', 'G', and 'B', segregate the values of the array so that all the Rs come first, the Gs come second, and the Bs come last. You can only swap elements of the array.

Do this in linear time and in-place

For example, given the array ['G', 'B', 'R', 'R', 'B', 'R', 'G'], it should become ['R', 'R', 'R', 'G', 'G', 'B', 'B'].

### Solution
I solved this problem in [DCP441](../DCP441_medium/) using the "Dutch national flag problem", explanation of the solution can be found [here](../DCP441_medium/README.md#the-optimal-way---c). This solution's code can be found in [pivot_sort.cpp](pivot_sort.cpp), which when compiled and run yields the following result:
```
R R R G G B B
```