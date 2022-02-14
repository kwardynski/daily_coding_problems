# Daily Coding Problem 340 - EASY
## Finding two closest points

Given a set of points `(x,y)` on a 2D cartesian plane, find the two closes points. For example, given the points: `[(1, 1), (-1, -1), (3, 4), (6, 1), (-1, -6), (-4, -3)]`, `[(-1, -1), (1, 1)]`.

### Solution:
I'm going to use Elixir for this simply for speed. I'm going to take a "smart" brute force approach to the problem by first sorting the points in increasing x then moving through the list that way each distance is only computed once. For a list of 4 points `[p1, p2, p3, p4]` we would do the following comparisons:
```
p1 -> p2
p1 -> p3
p1 -> p4
p2 -> p3
p2 -> p4
p3 -> p4
```
I will also be assuming that the input to `ClosestPoints.find_closest_points/1` will be a list of tuples of integers: `[{x1, y1}, {x2, y2}, ... {xN, yN}]`, so not going to put in any guard clauses in the code.

### Usage:
```
iex closest_points.ex
iex(1)> points = [{1, 1}, {-1, -1}, {3, 4}, {6, 1}, {-1, 6}, {-4, -3}]
iex(2)> ClosestPoints.find_closest_points(points)
%{ dist: 2.83...., p1: {-1, -1}, p2: {1, 1} }
```

TEST