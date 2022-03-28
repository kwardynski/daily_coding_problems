# Daily Coding Problem 285 - MEDIUM
## Which buildings can see the setting sum

You are given an array representing the heights of neighboring buildings on
a city street, from east to west. The city assessor would like you to write an 
algorithm that returns how many of these buildings have a view of the setting sun,
in order to properly value the street.

For example, given the array `[3, 7, 8, 3, 6, 1]`, you should return `3`, since
the top floors of the buildings with heights `8`, `6`, and `1` all have unobstructed
views to the west.

Can you do this using just one forward pass through the array?


### Solution:
I'm going to do this in C++ since the rest of the DCP's have been done with Elixir so far and MATLAB for a problem like feels like cheating.  
The question asks us if we can do it in one forward pass, but doesn't specifically prohibit us from reversing the building list which allows us to traverse it from West to East. If we do it this way, we can keep two "comparison" variables which allow us to find the total buildings on the street with a sunset view:
- `sunset_view_count`: our running total of buildings which have a view of the sunset, initially set to `0`.
- `max_height`: the tallest building encountered so far, initially set to `0`.

What we'll do is traverse through the list - if the current building we're inspecting is _taller_ than `max_height`, we can say that has a sunset view, therefore all we need to do is increment our `sunset_view_count` variable and update `max_height` to be the height of the current building.  
Once we're through the list we can display the results.

---

Full code can be found in [sunset_classifier.cpp](sunset_classifier.cpp), with three building lists hard-coded in (along with their expected results). Compiling and running the code yields the following results:

**using { 3, 7, 8, 3, 6, 1 }**\
1, 6, 8 expected to have sunset views: total of 3
```
A total of 3 building(s) have a sunset view.
```

**using { 1, 2, 3, 4, 5, 6 }**\
Only 6 expected to have sunset view: total of 1
```
A total of 1 building(s) have a sunset view.
```

**using { 6, 5, 4, 3, 2, 1 }**\
All buildings expected to have sunset views: total of 6
```
A total of 6 building(s) have a sunset view.
```

