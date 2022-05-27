# Daily Coding Problem 128 - MEDIUM
## Tower of Hanoi

The Tower of Hanoi is a puzzle game with three rods and `n` disks, each of a different size.  
All the disks start off on the first rod in a stack. They are ordered by size, with the largest disk on the bottom and the smallest one at the top.  
The goal of this puzzle is to move all the disks from the first rod to the last rod while following these rules:
- You can only move one disk at a time.
- A move consists of taking the uppermost disk from one of the stacks and placing it on top of another stack.
- You cannot place a larger disk on top of a smaller disk.

Write out a function that prints out all the steps necessary to complete the Tower of Hanoi. You should assume that the rods are numbered, with the first rod being 1, the second (auxillary) rod being 2, and the last (goal) rod being 3.  

For example, with `n = 3`, we can do this in 7 moves:
```
Move 1 to 3
Move 1 to 2
Move 3 to 2
Move 1 to 3
Move 2 to 1
Move 2 to 3
Move 1 to 3
```

### Solution:
We can solve the Tower of Hanoi problem using recursion - in order to figure out _how_ to build the recursive algorithm, let's break down how to solve the Tower of Hanoi problem for `n` 1-3 and see if any patterns arise that we can use.

#### n = 1
Here we only need one move since there is only 1 disk, so we can describe it as a moving the disk from source (tower 1) to destination (tower 3) using tower 2 as the intermediate
1. Move 1 to 3 (using 2)

#### n = 2
Here we need three moves, I'll break them down as above.
1. Move 1 to 2 (using 3)
2. Move 1 to 3 (using 2)
3. Move 2 to 3 (using 1)

Moving 2 disks can be described using 3 chained steps of moving 1 disk.

#### n = 3
Here we need seven moves, again broken down as above.
1. Move 1 to 3 (using 2)
2. Move 1 to 2 (using 3)
3. Move 3 to 2 (using 1) 
4. Move 1 to 3 (using 2)
5. Move 2 to 1 (using 3)
6. Move 2 to 3 (using 1)
7. Move 1 to 3 (using 2)  


We can treat this as:
1. Move 2 disks from 1 to 2 (steps 1-3 above)
2. Move 1 disk from 1 to 3 (step 4 above)
3. Move 2 disks from 2 to 3 (steps 5 to 6 above)  

Therefore we can represent this as the following formula:
```
tower_of_hanoi(n, source, goal, aux) = 
   tower_of_hanoi(n-1, source, aux, goal)
   tower_of_hanoi(1, source, goal, aux)
   tower_of_hanoi(n-1, aux, goal, source)
```

The solution can be found in [tower_of_hanoi.cpp](tower_of_hanoi.cpp) which solves for `n` values ranging from 1 to 4. Compiling and running the code which runs in O(2ⁿ) time yields the following result:
```
Tower of Hanoi solution for 1 disk(s):
Move 1 to 3

Tower of Hanoi solution for 2 disk(s):
Move 1 to 2
Move 1 to 3
Move 2 to 3

Tower of Hanoi solution for 3 disk(s):
Move 1 to 3
Move 1 to 2
Move 3 to 2
Move 1 to 3
Move 2 to 1
Move 2 to 3
Move 1 to 3
```

