# GRID
The locations on the chess grid are going to have 2 representations, "ind" and "sub".\
Conversion between the two will be handled by the ```ind2sub``` and ```sub2ind```
functions, which operate basically the same as their MATLAB counterparts, 
however these ones are 0-based.\
These functions are guarded against inputs that are out of the specified grid range and
negative values

## ind - the "indices" of the square
Ranging from 0-63 starting from top left to bottom right:
```
  0     1     2     3     4     5     6     7
  8     9     10    11    .     .     .     .
  .     .     .     .     .     .     .     . 
  [...]
  [...]
  [...]
  [...]
  56    57    58    59    60    61    62    63    
```

## sub - (x,y) "subscript" of the square
Just the (x,y) coordinates of the board square.\
Starting at (0,0) and going to (7,7):
```
(0,0) (1,0) (2,0) (3,0) (4,0) (5,0) (6,0) (7,0)
(0,1) (1,1) (2,1) (3,1)   .     .     .     .
  .     .     .     .     .     .     .     . 
[...]
[...]
[...]
[...]
(0,7) (1,7) (2,7) (3,7) (4,7) (5,7) (6,7) (7,7)
```