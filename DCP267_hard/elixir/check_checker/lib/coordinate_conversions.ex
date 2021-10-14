defmodule CheckChecker.CoordinateConversions do

  # Convert index to (x,y) style subscript
  # Returns an {x,y} tuple
  def ind2sub(ind, max_x, max_y) when is_integer(ind) and is_integer(max_x) and is_integer(max_y) do
    _ind2sub(ind, max_x, max_y)
  end

  defp _ind2sub(ind, max_x, max_y) when ind >= max_x * max_y do
    IO.puts("!! #{ind} is outside of possible #{max_x}x#{max_y} grid limits !!")
    {nil, nil}
  end

  defp _ind2sub(ind, _max_x, _max_y) when ind < 0 do
    IO.puts("!! Query ind must be a non-negative integer!")
    {nil, nil}
  end

  defp _ind2sub(_, max_x, max_y) when max_x < 0 or max_y < 0 do
    IO.puts("!! Grid extents must be a non-negative integers!")
    {nil, nil}
  end

  defp _ind2sub(ind, max_x, max_y) do
    row = div(ind, max_x)
    col = rem(ind, max_y)
    {col, row}
  end


  # Convert (x,y) style subscript to index
  # Returns a 0-based index
  def sub2ind({x, y}, max_x, max_y) when is_integer(x) and is_integer(y) and is_integer(max_x) and is_integer(max_y)do
    _sub2ind(x, y, max_x, max_y)
  end

  defp _sub2ind(x, y, max_x, max_y) when x >= max_x or y >= max_y do
    IO.puts("!!#(#{x}, #{y}) outside of #{max_x}x#{max_y} grid limits !!!!")
    nil
  end

  defp _sub2ind(x, y, _max_x, _max_y) when x < 0 or y < 0 do
    IO.puts("!! Query (x,y) tuple must be composed of non-negative integers !!")
    nil
  end

  defp _sub2ind(_x, _y, max_x, max_y) when max_x < 0 or max_y < 0 do
    IO.puts("!! Grid extents must be a non-negative integers!")
    nil
  end

  defp _sub2ind(x,y,_max_x, max_y) do
    y*max_y + x
  end

end
