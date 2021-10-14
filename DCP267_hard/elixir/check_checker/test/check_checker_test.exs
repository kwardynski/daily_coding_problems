defmodule CheckCheckerTest do
  use ExUnit.Case
  alias CheckChecker.BoardHandlers

  describe "pieces CAN attack - no blockers" do

    test "pawn CAN attack" do
      piece = "P"
      [col, row] = [3,3]
      [max_x, max_y] = [8, 8]
      friendly_inds = []
      king_inds = [18, 20]
      Enum.each(king_inds,
        fn(x) -> assert BoardHandlers.can_attack?(piece, col, row, max_x, max_y, x, friendly_inds) end)
    end

    test "queen CAN attack" do
      piece = "Q"
      [col, row] = [3, 3]
      [max_x, max_y] = [8, 8]
      friendly_inds = []
      king_inds = [11, 6, 31, 36, 59, 41, 26]
      Enum.each(king_inds,
        fn(x) -> assert BoardHandlers.can_attack?(piece, col, row, max_x, max_y, x, friendly_inds) end)
    end

    test "rook CAN attack" do
      piece = "R"
      [col, row] = [7, 4]
      [max_x, max_y] = [8, 8]
      friendly_inds = []
      king_inds = [7, 38, 55]
      Enum.each(king_inds,
        fn(x) -> assert BoardHandlers.can_attack?(piece, col, row, max_x, max_y, x, friendly_inds) end)
    end

    test "bishop CAN attack" do
      piece = "B"
      [col, row] = [4, 7]
      [max_x, max_y] = [8, 8]
      friendly_inds = []
      king_inds = [33, 39]
      Enum.each(king_inds,
        fn(x) -> assert BoardHandlers.can_attack?(piece, col, row, max_x, max_y, x, friendly_inds) end)
    end

    test "knight CAN attack" do
      piece = "N"
      [col, row] = [2, 5]
      [max_x, max_y] = [8, 8]
      friendly_inds = []
      king_inds = [25, 27, 36, 52, 59, 57, 48, 32]
      Enum.each(king_inds,
        fn(x) -> assert BoardHandlers.can_attack?(piece, col, row, max_x, max_y, x, friendly_inds) end)
    end

  end


  describe "pieces CANNOT attack - no blockers" do

    test "pawn CANNOT attack" do
      piece = "P"
      [col, row] = [3,0]
      [max_x, max_y] = [8, 8]
      friendly_inds = []
      king_ind = 44
      refute BoardHandlers.can_attack?(piece, col, row, max_x, max_y, king_ind, friendly_inds)
    end

    test "queen CANNOT attack" do
      piece = "Q"
      [col, row] = [3,0]
      [max_x, max_y] = [8, 8]
      friendly_inds = []
      king_inds = [13, 26, 40]
      Enum.each(king_inds,
        fn(x) -> refute BoardHandlers.can_attack?(piece, col, row, max_x, max_y, x, friendly_inds) end)
    end

    test "rook CANNOT attack" do
      piece = "R"
      [col, row] = [4, 7]
      [max_x, max_y] = [8, 8]
      friendly_inds = []
      king_inds = [33, 39]
      Enum.each(king_inds,
        fn(x) -> refute BoardHandlers.can_attack?(piece, col, row, max_x, max_y, x, friendly_inds) end)
    end

    test "bishop CANNOT attack" do
      piece = "B"
      [col, row] = [7, 4]
      [max_x, max_y] = [8, 8]
      friendly_inds = []
      king_inds = [7, 38, 55]
      Enum.each(king_inds,
        fn(x) -> refute BoardHandlers.can_attack?(piece, col, row, max_x, max_y, x, friendly_inds) end)
    end

    test "knight CANNOT attack" do
      piece = "N"
      [col, row] = [2, 5]
      [max_x, max_y] = [8, 8]
      friendly_inds = []
      king_inds = [26, 28, 37, 53, 60, 58, 49, 31]
      Enum.each(king_inds,
        fn(x) -> refute BoardHandlers.can_attack?(piece, col, row, max_x, max_y, x, friendly_inds) end)
    end

  end


  describe "pieces CANNOT attack - blocked" do

    test "queen CANNOT attack - blocked" do
      piece = "Q"
      [col, row] = [3, 3]
      [max_x, max_y] = [8, 8]
      friendly_inds = [19, 20, 29, 36, 51, 34, 25]
      king_inds = [11, 6, 31, 45, 59, 41, 24]
      Enum.each(king_inds,
        fn(x) -> refute BoardHandlers.can_attack?(piece, col, row, max_x, max_y, x, friendly_inds) end)
    end

  end

end
