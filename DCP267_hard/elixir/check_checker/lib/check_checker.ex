# Check Checker
# Elixir solution to Daily Coding Problem 267
#
# Process
#   1. Randomize locations for 6 chess pieces (default to 8x8 board)
#   2. Query whether pieces can attack king
#        - Ensure they do not leave board during checking stage
#        - Ensure they are properly blocked by friendly pieces
#   3. Display results
#        - Piece coordinates (1 based (x,y) coordinate tuples)
#        - Can/Cannot attack king
#        - King is safe / King is in check


defmodule CheckChecker do
  alias CheckChecker.{BoardHandlers, ResultsHandlers}

  def check_check() do
    pieces = ["K", "B", "P", "R", "N", "Q"]
    [max_x, max_y] = [8,8]

    piece_locations = BoardHandlers.generate_locations(length(pieces), max_x*max_y)
    chess_board = BoardHandlers.generate_chess_board(pieces, piece_locations, max_x, max_y)
    ResultsHandlers.display_results(pieces, chess_board)
  end

end
