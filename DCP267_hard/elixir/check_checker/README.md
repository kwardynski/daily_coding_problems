I'm going to do the documentation in a readme instead of the "traditional" Elixir ExDoc method 
so that it's easier to explain the though process behind the app and how it works.

CheckChecker.check_check() handles the processing, in it is the list of chess pieces,
as well as hard coded grid size value - in this case 8x8 to satisfy the problem requirements.\
You can change these values and the app should still run, it was designed with that dyanamic
functionality in mind, and many of the tests are run with a "non-standard" grid size.



# MODULE BREAKDOWN
* **CheckChecker** - this is the main driver for the application.
* **BoardHandlers** - this module handles all of the board-specific functions, 
from generating the piece locations, to handling how the pieces move to see if they can attack the
King or not.
* **ResultsHandlers** - this module (as the name implies) handles the results. It will loop through 
the pieces, display their grid position, and whether or not they can attack the King.
* **CoordinateConversions** - this module handles the `ind2sub` and `sub2ind` conversions. 
These operate much like their MATLAB counterparts, however are **0-based**.
* **ChessPiece** - this is the main "struct" for generating a chess piece - it contains positional
information (indices and subscript), as well as whether or not it can attack the King.



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



## PROCESS
1. `BoardHandlers.generate_locations` is called which randomizes the position of the pieces.
A list of random indices is generated (based on the maximum grid size), and stored in the `ChessPiece` struct, as well as the subscript counterpart, and piece name.
2. `BoardHandlers.generate_chess_board` is called which determines whether or not pieces can attack the King.
    * The `BoardHandlers.can_attack?` function is used to determine whether a piece holds the King in check.
    This is done by providing an "attack_struct" (a list of directions a piece can move, and how far it can 
    move in that direction), and the locations of all other pieces to the `BoardHandlers.move_and_query` private function. `BoardHandlers.can_attack?` is an overloaded (pattern matching against arguments) function which provides piece specific instructions to `BoardHandlers.move_and_query`.
      * `BoardHandlers.move_and_query` "moves" the piece based on the inputs of the attack struct, and will return `false` if the piece reaches it's maximum moves, the end of the board, or a friendly piece. It will return `true` if and only if the piece reaches the King.
      * This function will return `true` if given `true` as it's first argument, cutting down on processing time if the piece in question can attack the King based on a previous path given to it with the "attack_struct".
3. Results are displayed
    * Pieces are looped through with `ResultsHandlers.display_results`, and their position (now converted to 1 based index for clarity) is displayed along with whether or not they hold the King in check.
    * Finally the user is informed if the king is in check or not!



## TESTS
The functions in both the `BoardHandlers` and `CoordinateConversions` modules are extensively tested to ensure that coordinates are properly converted, and pieces behave as expected. The test files can be found in the `test` folder, and can be called by running `>mix text` after the project is compiled. Some of the major requirements include:
* Not returning a converted coordinate if the inputs are out of the grid limits 
* Pieces do not "move" past the edge of the board
* Pieces do not "move" past a friendly piece if one lies it its path
* `True` is actually returned if a piece can reach the King



## THOUGHTS
* The chess pieces are stored in a map, making querying them easier, however they could also be stored 
in a list, which would make looping through them to display results slightly easier to follow syntactically.
* The whole `BoardHandlers.can_attack?` pipeline seems quite verbose. There could be a way to simplify how the attack struct is generated, if I come up with something better later I might come and fix it.
* It would be nice to display what the randomly generated board looks like, but that's a lot of extra work
which isn't asked for by the problem, so I likely won't do it...
* Having the user specify the grid size would also be nice, but that's not asked for by the question so again that's something I'm likely not going to do.

