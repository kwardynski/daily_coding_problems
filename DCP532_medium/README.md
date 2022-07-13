# Daily Coding Problem 532 - MEDIUM
## "Special" Bishops

On our special chessboard, two bishops attack each other if they share the same diagonal. This includes bishops that have another bishop located between them, i.e. bishops can attack through pieces.

You are gtiven N bishops, represented as (row, column) tuples on an M by M chessboard. Write a function to count the number of pairs of bishops that attack each other. The ordering of the pair doesn't matter: (1,2) is considered the same as (2,1).

For example, given M = 5 and the list of bishops:
- (0, 0)
- (1, 2)
- (2, 2)
- (4, 0)

The board would look like this:
```
[b 0 0 0 0]
[0 0 b 0 0]
[0 0 b 0 0]
[0 0 0 0 0]
[b 0 0 0 0]
```

You should return 2, since bishops 1 and 3 can attack each other, as well as bishops 3 and 4.

## Solution
Just when I thought I was done with tail call recursion, it pulls me back in.  
The `AttackCounter` module found in the [attack_counter.ex](attack_counter.ex) file provides the solution. The `run/2` function is the kickoff point, and it assumes that the list of bishops is properly formatted and their positions are valid (i.e. within the bounds of the board size specified by the `board_size` argument). 

### Procedure
The function `count_attacks/3` recursively iterates through the list of bishops to see how many attacks can be made.
1. The function `generate_valid_spaces/6` constructs a list of coordinates which the _current_ bishop can attack. This function is called 4 times (once for each direction a bishop can move), progressively building on the spaces.
2. `in_danger/2` is called by `Enum.reduce` to see how many of the _rest_ of the bishops can be attacked - i.e. counts how many of them lie within the list of valid spaces from step 1 above. This function increments the `attacks` variable by 1 for each bishop which _can_ be attacked by the current bishop.
3. Call `count_attacks/3` with the _remainder_ of the list and the current attack count. Doing it this way ensures that each attack pair will only be counted once.

```
iex attack_counter.ex
iex(1)> AttackCounter.run([{0, 0}, {1, 2}, {2, 2}, {4, 0}], 5)
2

iex(2)> AttackCounter.run([{0, 0}, {0, 1}, {0, 2}, {0, 3}, {9, 0}], 10)
0
```