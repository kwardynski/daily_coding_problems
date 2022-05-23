# Daily Coding Problem 493 - MEDIUM
## Probability "Return"

You are given `n` numbers as well as `n` probabilities that sum up to 1. Write a function to generate one of the numbers with its corresponding probability.  
For example, given the numbers `[1, 2, 3, 4]` and probabilities `[0.1, 0.5, 0.2, 0.2]`, your function should return `1` 10% of the time, `2` 50% of the time, and `3` and `4` 20% of time time.

You can generate randon numbers between 0 and 1 uniformly.

## Solution
In order to solve this problem, we'll define one extra vairable, `prob_floor`, which will be used to track the sum of the probabilities as we iterate through the probabilities matrix. It will be used in the following way:
1. Generate a random number in the range `[0,1)`, and set `prob_floor` to zero.
2. Loop through the probability array and check if that random number is _less than_ `prob_floor`.
3. If yes, we've _passed_ the probability and therefore we should return `i-1`. If not, add the current probability value (`probabilities[i]`) to `prob_floor`, increment `i`, and check again.

For example:
We generate a random number: `0.63`, set `prob_floor` to 0 and begin:
1. First we check if our ranodm number is less than `prob_floor`, which it is not, therefore we add `probabilities[0]` to `prob_floor`, which yields `0.1`, we increment `i` and try again.
2. We check if our random number is less than `prob_floor`, which is currently `0.1`. Since it is not, we add `probabilities[1]` to `prob_floor`, which yields `0.6`, we increment `i`, and try again.
3. Next we check if our random number is less than `prob_floor`, which it sill is not. Add `probabilities[2]` to `prob_floor`, which yields `0.8`, increment `i` and move on.
4. Now we check if our random number is less than `prob_floor`, which it is - this means we've _passed_ the range of the probability of encountering our number, therefore we must return `i-1`.

The code found in [probability_return](probability_return.cpp) yields the following result when compiled and run 5 times:
```
0.028788 | 1
0.334849 | 2
0.560652 | 2
0.788384 | 3
0.367604 | 2
```

The code runs in `O(n)` time (worst case is one pass through the probabilities list) and requires `O(1)` space as we utilize a constant number of variables to help us solve it, regardless of the length of the numbers/probabilities arrays. 


