defmodule CheckChecker.BoardHandlers do

  # Generate a list of random inds at which to place the chess pieces
  def generate_locations(total_pieces, grid_size) do
    grid_inds = 0..(grid_size-1)
    grid_inds
    |> Enum.to_list()
    |> Enum.take_random(total_pieces)
  end


  # "Generate" the chess board - a map of ChessPiece structs
  def generate_chess_board(shuffled_pieces, grid_locations, max_x, max_y) do
    [king_ind | friendly_inds] = grid_locations
    _gcb(shuffled_pieces, grid_locations, king_ind, friendly_inds, max_x, max_y, %{})
  end


  # Loop through pieces, place them and see if it can attack the king
  defp _gcb([], [], _, _, _, _, chess_board), do: chess_board
  defp _gcb([name | pieces], [ind | inds], king_ind, friendly_inds, max_x, max_y, chess_board) do
    {col, row} = CheckChecker.CoordinateConversions.ind2sub(ind, max_x, max_y)
    can_attack_king = can_attack?(name, col, row, max_x, max_y, king_ind, friendly_inds)
    piece = %CheckChecker.ChessPiece{name: name, ind: ind, row: row, col: col, can_attack: can_attack_king}
    _gcb(pieces, inds, king_ind, friendly_inds, max_x, max_y, Map.put(chess_board, String.to_atom(name), piece))
  end


  # PIECE SPECIFIC MOVE_AND_QUERY CALLS
  def can_attack?("K", _, _, _, _, _, _), do: false

  def can_attack?("P", col, row, max_x, max_y, king_ind, friendly_inds) do
    false
    |> move_and_query(0, 1, col, row, -1, -1, max_x, max_y, king_ind, friendly_inds)
    |> move_and_query(0, 1, col, row, 1, -1, max_x, max_y, king_ind, friendly_inds)
  end

  def can_attack?("Q", col, row, max_x, max_y, king_ind, friendly_inds) do
    max_d = get_limiting_dim(max_x, max_y)
    attack_struct = [{-1, 0, max_x}, {-1, -1, max_d}, {0, -1, max_y}, {1, -1, max_d}, {1, 0, max_x}, {1, 1, max_d}, {0, 1, max_y}, {-1, 1, max_d}]
    Enum.reduce(attack_struct, false, fn {x_dir,y_dir,allowed_moves}, acc -> move_and_query(acc, 0, allowed_moves, col, row, x_dir, y_dir, max_x, max_y, king_ind, friendly_inds) end)
  end

  def can_attack?("R", col, row, max_x, max_y, king_ind, friendly_inds) do
    attack_struct = [{-1, 0, max_x}, {0, -1, max_y}, {1, 0, max_x}, {0, 1, max_y}]
    Enum.reduce(attack_struct, false, fn {x_dir,y_dir,allowed_moves}, acc -> move_and_query(acc, 0, allowed_moves, col, row, x_dir, y_dir, max_x, max_y, king_ind, friendly_inds) end)
  end

  def can_attack?("B", col, row, max_x, max_y, king_ind, friendly_inds) do
    max_d = get_limiting_dim(max_x, max_y)
    attack_struct = [{-1, -1, max_d}, {1, -1, max_d}, {1, 1, max_d}, {-1, 1, max_d}]
    Enum.reduce(attack_struct, false, fn {x_dir,y_dir,allowed_moves}, acc -> move_and_query(acc, 0, allowed_moves, col, row, x_dir, y_dir, max_x, max_y, king_ind, friendly_inds) end)
  end

  def can_attack?("N", col, row, max_x, max_y, king_ind, friendly_inds) do
    attack_struct = [{1, -2, 1}, {2, -1, 1}, {2, 1, 1}, {1, 2, 1}, {-1, 2, 1}, {-2, 1, 1}, {-2, -1, 1}, {-1, -2, 1}]
    Enum.reduce(attack_struct, false, fn {x_dir,y_dir,allowed_moves}, acc -> move_and_query(acc, 0, allowed_moves, col, row, x_dir, y_dir, max_x, max_y, king_ind, friendly_inds) end)
  end


  # MOVE AND QUERY
  defp move_and_query(can_attack, completed_moves, allowed_moves, col, row, col_move, row_move, max_x, max_y, king_ind, friendly_inds) do
    next_col = col + col_move
    next_row = row + row_move
    current_move = completed_moves + 1

    cond do
      can_attack -> true
      next_col >= max_x or next_col < 0 -> false
      next_row >= max_y or next_row < 0 -> false
      current_move > allowed_moves -> false
      CheckChecker.CoordinateConversions.sub2ind({next_col, next_row}, max_x, max_y) in friendly_inds -> false
      CheckChecker.CoordinateConversions.sub2ind({next_col, next_row}, max_x, max_y) == king_ind -> true
      true -> move_and_query(false, current_move, allowed_moves, next_col, next_row, col_move, row_move, max_x, max_y, king_ind, friendly_inds)
    end
  end


  # Limiting dimension
  defp get_limiting_dim(max_x, max_y) do
    cond do
      max_x >= max_y -> max_y
      true           -> max_x
    end
  end

end
