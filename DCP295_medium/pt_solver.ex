defmodule PTSolver do


  def solve(k) do
    Enum.to_list(1..(floor(k/2)+1))               # construct list of unique values to solve for from k
    |> Enum.map(fn(p) -> {k, p} end)              # convert to list of coordinates (tuples of {row, position})
    |> Enum.map(fn(x) -> calculate_value(x) end)  # calculate each value based on its coordinate
    |> construct_row(k)                           # complete the remainder of the row (append duplicate values)
  end


  # Calculates the value of a member of Pascal's Triangle based on the
  # member's coordinates {k, p} where k is the row and p is it's position
  # in that row
  def calculate_value({k, p}) when p == 1 or p == k+1, do: 1
  def calculate_value({k, p}) when p == 2, do: k
  def calculate_value({k, p}) do
    calculate_value({k-1, p}) + calculate_value({k-1, p-1})
  end


  # Appends the duplicate values in reverse order to complete the row
  def construct_row(_row, k) when k == 1, do: [1]
  def construct_row(row, k) do
    case rem(k,2) == 0 do
      true  ->
        [_h | t] = Enum.reverse(row)
        row ++ t
      false -> row ++ Enum.reverse(row)
    end
  end

end
