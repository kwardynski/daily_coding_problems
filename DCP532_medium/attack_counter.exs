defmodule AttackCounter do

  def run(bishops, board_size) do
    count_attacks(bishops, board_size, 0)
  end


  def count_attacks([], _board_size, attacks), do: attacks
  def count_attacks([{row, column} | bishops], board_size, attacks) do

    # Generate list of spaces the current bishop can attack
    valid_spaces = []
    |> generate_valid_spaces(row, column, board_size, -1, -1) # north west
    |> generate_valid_spaces(row, column, board_size, -1, 1)  # north east
    |> generate_valid_spaces(row, column, board_size, 1, 1)   # south east
    |> generate_valid_spaces(row, column, board_size, 1, -1)  # south west

    # See if any of the remaining bishops are in this list of spaces
    {attacks, _} = Enum.reduce(bishops, {attacks, valid_spaces}, fn(x, acc) -> in_danger(x, acc) end)

    # Move on to the next bishop
    count_attacks(bishops, board_size, attacks)
  end


  defp generate_valid_spaces(valid_spaces, row, column, board_size, vert_step, horz_step) do

    # "Move" the piece to the next position
    next_row = row + vert_step
    next_column = column + horz_step

    # Check if the next position is outside the bounds of the board - if it is then return the current
    # list of valid attack spaces, if not then add the next position to the list of valid spaces and continue
    case Enum.any?([next_row, next_column], fn(x) -> x >= board_size || x < 0 end) do
      true -> valid_spaces
      false -> generate_valid_spaces([{next_row, next_column} | valid_spaces], next_row, next_column, board_size, vert_step, horz_step)
    end
  end


  # Checks whether a coordinate on the board can be attacked
  defp in_danger(bishop_coords, {attacks, valid_spaces}) do
    case Enum.member?(valid_spaces, bishop_coords) do
      true ->  {attacks + 1, valid_spaces}
      false -> {attacks, valid_spaces}
    end
  end

end
