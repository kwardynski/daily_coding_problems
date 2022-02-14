defmodule ClosestPoints do

  def find_closest_points(points) do
    [p1 | p_rest] = Enum.sort_by(points, fn({x, _}) -> x end)
    do_find_closest_points(p1, p_rest, p_rest, %{dist: nil, p1: nil, p2: nil})
  end

  # When all iterations complete, return result
  def do_find_closest_points(_, _, [], result), do: result


  # If end of current "rest of list" reached, start loop from NEXT element
  def do_find_closest_points(_, [], points_sorted, result) do
      {p1, p_rest} = List.pop_at(points_sorted, 0)
      do_find_closest_points(p1, p_rest, p_rest, result)
  end


  # Compute cartesian distance between head of list and current element
  # Compare to the current result, then move to next element
  def do_find_closest_points(p1, [h | t], points_sorted, result) do

    # Extract coordinates from points
    {p1x, p1y} = p1
    {hx, hy} = h

    # Compute cartesian distance
    dist = :math.sqrt(:math.pow(p1x - hx,2) + :math.pow(p1y - hy,2))

    # Compare to current result, update if necessary
    result = cond do
      dist < result[:dist] -> %{dist: dist, p1: p1, p2: h}
      true -> result
    end

    # Run next iteration
    do_find_closest_points(p1, t, points_sorted, result)
  end

end
