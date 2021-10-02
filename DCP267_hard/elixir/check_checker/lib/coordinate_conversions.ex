defmodule CheckChecker.CoordinateConversions do


  # Convert index to (x,y) style subscript
  def ind2sub(ind, max_x, max_y) do
    check_limits!(ind, max_x * max_y)

  end

  defp check_limits!(ind, max_ind) do


  end

  # Convert (x,y) style subscript to index
  def sub2ind() do

  end


end
