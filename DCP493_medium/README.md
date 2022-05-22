# Daily Coding Problem 493 - MEDIUM
## Probability "Return"

You are given `n` numbers as well as `n` probabilities that sum up to 1. Write a function to generate one of the numbers with its corresponding probability.  
For example, given the numbers `[1, 2, 3, 4]` and probabilities `[0.1, 0.5, 0.2, 0.2]`, your function should return `1` 10% of the time, `2` 50% of the time, and `3` and `4` 20% of time time.

You can generate randon numbers between 0 and 1 uniformly.

## Solution
In order to solve this problem, we'll define two extra variable, `prob_floor` and `prob_ciel`, which we will use to track the lower and upper bounds bound of a numbers probability on the range `[0,1)`. It will be utilized in the following way:
1. Generate a random number in the range `[0,1)`, and set `prob_floor` to zero.
2. Loop through the probability array and check if the randomly generated number is in the range `[prob_floor, prob_floor + probabilities[i])`. 
3. If yes, return the number at index `i`, if not, add `probabilities[i]` to `prob_floor` and continue.

For example:  
We generate a random number `0.63`. `prob_floor` is initially set to `0` and we begin.
1. Our first range is `[0, 0.1)` (`[prob_floor, probabilities[0])`), our random number _is not_ within this range so we add `probabilities[0]` to `prob_floor`, increment `i` and move on.
2. Our second range is now `[0.1, 0.6)` (`[prob_floor, prob_floor + probabilities[1])`), our random number again _is not_ within this range so we add `probabilities[1]` to `prob_floor`, increment `i` and move on.
3. Our third range is now `[0.6, 0.8)` (`[prob_floor, prob_floor + probabilities[2])`), our random number _is_ within this range, so we return `i`, use it to index the given numbers list and return that value as our result.

The code found in [probability_return](probability_return.cpp) yields the following result when compiled and run 5 times:
```
0.028788 | 1
0.334849 | 2
0.560652 | 2
0.788384 | 3
0.367604 | 2
```


