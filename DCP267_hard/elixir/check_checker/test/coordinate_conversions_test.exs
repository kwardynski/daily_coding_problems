defmodule CheckChecker.CoordinateConversionsTest do
  use ExUnit.Case
  alias CheckChecker.CoordinateConversions

  describe "check ind2sub" do

    test "ind2sub valid range" do
      {x,y} = CoordinateConversions.ind2sub(11, 5, 5)
      assert {x,y} === {1, 2}
    end

    test "ind2sub negative ind" do
      {x,y} = CoordinateConversions.ind2sub(-420, 5, 5)
      assert {x,y} === {nil, nil}
    end

    test "ind2sub negative grid exents" do
      {x,y} = CoordinateConversions.ind2sub(12, -5, 5)
      assert {x,y} === {nil, nil}
    end

    test "ind2sub invalid range" do
      {x,y} = CoordinateConversions.ind2sub(69, 5, 5)
      assert {x,y} === {nil, nil}
    end

  end


  describe "check sub2ind" do

    test "sub2ind valid tuple" do
      ind = CoordinateConversions.sub2ind({3,3}, 5, 5)
      assert ind === 18
    end

    test "sub2ind negative query coordinates" do
      ind = CoordinateConversions.sub2ind({-1, -1}, 2, 2)
      assert ind === nil
    end

    test "sub2ind negative grid extents" do
      ind = CoordinateConversions.sub2ind({3, 3}, 5, -2)
      assert ind === nil
    end

    test "sub2ind invalid tuple" do
      ind = CoordinateConversions.sub2ind({420, 69}, 5, 5)
      assert ind === nil
    end

  end

end
