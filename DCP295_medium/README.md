# Daily Coding Problem 295 - MEDIUM
## Pascal's Triangle

Pascal's triangle is a triangular array of integers constructed with the following formula:
 - The first row consists of number `1`.
 - For each subsequent row, each element is the sum of the numbers directly above it,
   on either side.

For example, here are the first few rows:
```
    1
  1 2 1
 1 3 3 1 
1 4 6 4 1
```

Given an input `k`, return the `k`<sup>th</sup> row of Pascal's triangle.

Bonus: Can you do this using only O(k) space?


### Solution:
To solve this, we can take each member of Pascal's Triangle and reference it by two values, it's row, `k` and position within that row, `p`. For example, 6 in the above visual for Pascal's Triangle lies on the 4th row and is the 3rd value from the left, so it can be represented by the "coordinates" `{4, 3}`.  
Other observations which can help us solve this problem are:
- Each row has `k+1` members
- The first and last members of each row are 1 (`p == 1` or `p == k+1`) 
- The second member of each row is equal to it's row number (`{k, 2} = 2`)
- To save time, we only need to compute the first half of the elements in a row, more specifically the first `floor(k/2)+1` elements, as the rest are repeats.  

My solution is found in _pt_solver.ex_, and takes O(k) space as we only save `k` values in memory (all processing happens "in place") - this recursion runs at a resonable pace on my machine until we start trying to solve for the 28th row when there's noticeable lag then gets worse after that. 

#### Steps:
1. Construct a list from 1 to `floor(k/2)+1`, so if we're trying to find the 5th row of Pascal's triangle we need to solve the first 3 values.
2. Convert each of those values to it's coordinate tuple as described above.
3. For each of the tuples, calculate it's value. The function `PTSolver.calculate_value/1` does this for us using the following rules derived from the observations above:
    - If `p == 1` or `p == k+1`, return `1`.
    - If `p == 2`, return `k`.
    - Else find recursively by `calculate_value({k-1, p}) + calculate_value({k-1, p-1})`.
4. Construct the entire row by reversing then appending duplicate values. The function `construct_row/2` does this with the following considerations:
    - If `k` is an even number, the middle number is unique therefore we can toss it out from the reversed portion - i.e. for `k = 6` we have `[1, 6, 15, 20] ++ [15, 6, 1]`. A simple pattern match allows us to toss out the head of the list in this case.
    - If `k` is odd, the middle number is repeated, therefore we can simply reverse the list and append - i.e. for `k = 5` we have `[1 5 10] ++ [10 5 1]`.

#### Usage:
```
iex pt_solver.ex

iex(1)> PTSolver.solve(1)
[1]

iex(2)> PTSolver.solve(2)
[1, 2, 1]

iex(3)> PTSolver.solve(3)
[1, 3, 3, 1]

iex(4)> PTSolver.solve(4)
[1, 4, 6, 4, 1]

iex(5)> PTSolver.solve(5)
[1, 5, 10, 10, 5, 1]

iex(6)> PTSolver.solve(6)
[1, 6, 15, 20, 15, 6, 1]

iex(7)> PTSolver.solve(7)
[1, 7, 21, 35, 35, 21, 7, 1]

iex(8)> PTSolver.solve(15)
[1, 15, 105, 455, 1365, 3003, 5005, 6435, 6435, 5005, 3003, 1365, 455, 105, 15, 1]
```



