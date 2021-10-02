# GRID
The locations on the chess grid are going to have 2 representations, "ind" and "sub".

## ind - the "indices" of the square
Ranging from 1-64 (forgive my 1 based indexing, I'm a MATLAB guy...), 
starting from top left to bottom right:
```
  1     2     3     4     5     6     7     8
  9     10    11    12    .     .     .     .
  .     .     .     .     .     .     .     . 
  [...]
  57    56   59     60    61    61    63    64    
```

## sub - (x,y) "subscript" of the square
Again, 1 based indexing starting top left going bottom right:
```
(1,1) (2,1) (3,1) (4,1) (5,1) (6,1) (7,1) (8,1)
(1,2) (2,2) (3,2) (4,2)   .     .     .     .
[...]
(1,8) (2,8) (3,8) (4,8) (5,8) (6,8) (7,8) (8,8)
```