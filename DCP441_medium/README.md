# Daily Coding Problem 441 - MEDIUM
## Sorting with a Pivot

Given a pivot `x`, and a list `lst`, partition the list into three parts.
- The first part contains all elements in `lst` that are less than `x`.
- The second part contains all elements in `lst` that are equal to `x`.
- The third part contains all elements in `lst` that are larger than `x`.

Ordering within a part can be arbitrary.  
For example, given `x = 10` and `lst = [9, 12, 3, 5, 14, 10, 10]`, one partition may be `[9, 3, 5, 10, 10, 12, 14]`

## Solutions

### The Naive Way - Elixir
Based on DCP448 - there exists a way to do this in linear time and in-place, but I'm going to do this not in place to begin then try and solve it a little more elegantly.  
For the 'naive' solution (with a twist), I'm going to use Elixir since we have the ability to traverse the list and easily remove elements from it to place in another list (or two), so at least we can do this in constant space. I'm going to use two lists during the traversal which will be combined at the end, `bottom_portion` and `upper_portion`, and an integer called `pivot_count`. As we traverse the list:
- If current element is less than `x`, insert into `bottom_portion`
- If current element is equal to `x`, increment `pivot_count`
- If current element is greater than `x`, insert into `upper_portion`

At the end we'll just combine by doing `bottom_portion ++ List.duplicate(x, pivot_count) ++ upper_portion`. This method actually uses _less_ memory as we progress through the list, but doesn't happen in place. [pivot_sort.ex](pivot_sort.ex) contains this solution:
```
iex pivot_sort.ex

iex(1)> PivotSort.main([9, 12, 3, 5, 14, 10, 10], 10)
[5, 3, 9, 10, 10, 14, 12]
```

This method is relatively fast (tail call recursion!), running it on a random list of 1,000,000 numbers takes 0.049s, which is significantly quicker than actually creating that list of random numbers:
```
iex pivot_sort.ex

iex(1)> lst = Enum.map(Enum.to_list(1..1000000), fn(x) -> :rand.uniform(100) end)
iex(2)> :timer.tc(PivotSort, :main, [test, 10])
{49085, [...]}
```

### The Optimal(?) Way - C++
Ok - time to keep pumping those C++ numbers (later)...