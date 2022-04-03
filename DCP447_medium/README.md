# Daily Coding Problem 395 - MEDIUM
## Integer Exponentiation

Implement integer exponentiation. That is, implement the `pow(x,y)` function where `x` and `y` are integers and returns `x^y`.  
Do this faster than the naive method of repeated multiplication.  
For example, `pow(2, 10)` should return `1024`.

## Solution
Let's keep pumping the C++ numbers a bit more. This is a problem we can divide and conquer in order to save some some time over the naive method. We can say that `x^y` = `(x^0.5y) * (x^0.5y)` which cuts our naive processing time down by essentially half (well one operation greater than half).  
This method falls apart if `y` is an odd number, so we'll need to implement a check for that and deal with it accordingly - let's say `z = (y-1)/2` so `pow(x,y)` becomes `x * (x^z) * (x^z)`.  
We can abstract this out into the following formula:
```
pow(x, y) = (x^exp1) * (x^exp2) * (x^exp2)
```
- If `y` is even: `exp1` = 0 and `exp2` = `y/2`
- If `y` is odd: `exp1` = 1 and `exp2` = `(y-1)/2`

The solution is found in [exponentiation.cpp](exponentiation.cpp), which calls the `custom_pow` function on a few different combinations of integers. When compiled and run the code yields the following results:
```
`2^10 = 1024
3^4 = 81
5^0 = 1
12^1 = 1728
-3^3 = -27``
```