defmodule CheckChecker.ResultsHandlers do

  def display_results(pieces, chess_board) do
    Enum.each(pieces, fn(x) -> show_piece_results(x, chess_board) end)
    Enum.reduce(pieces, false, fn x, acc -> check_king_safety(x, chess_board, acc) end)
    |> show_king_safety()
  end


  defp show_piece_results("K", chess_board) do
    piece_x = chess_board[:K].col + 1
    piece_y = chess_board[:K].row + 1
    IO.puts("\nK: (#{piece_x},#{piece_y})\n")
  end

  defp show_piece_results(piece, chess_board) do
    piece_atom = String.to_atom(piece)
    attack_string = generate_attack_string(chess_board[piece_atom].can_attack)
    piece_x = chess_board[piece_atom].col + 1
    piece_y = chess_board[piece_atom].row + 1
    IO.puts("#{piece}: (#{piece_x},#{piece_y}) | #{attack_string} attack")
  end


  defp generate_attack_string(can_attack) do
    cond do
      can_attack -> "can"
      true       -> "cannot"
    end
  end


  defp check_king_safety(_, _, true), do: true
  defp check_king_safety(piece, chess_board, _) do
    chess_board[String.to_atom(piece)].can_attack
  end


  defp show_king_safety(can_attack) do
    case can_attack do
      true -> IO.puts("\nKing is in check!\n")
      false -> IO.puts("\nKing is safe!\n")
    end
  end

end
