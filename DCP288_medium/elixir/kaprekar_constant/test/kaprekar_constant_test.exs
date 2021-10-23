defmodule KaprekarConstantTest do
  use ExUnit.Case
  doctest KaprekarConstant

  describe "ensuring validate_input treats guards properly" do

    test "validate_input - string returns error" do
      assert {:error, _} = KaprekarConstant.validate_input("TEST")
    end

    test "validate input - float returns error" do
      assert {:error, _} = KaprekarConstant.validate_input(12.123)
    end

    test "validate input - integer out of range" do
      assert {:error, _} = KaprekarConstant.validate_input(12.123)
    end

    test "validate input - integer in range" do
      assert {:ok, 1234} = KaprekarConstant.validate_input(1234)
    end

  end


  describe "validate sort_digits" do

    test "sort_digits ASCENDING" do
      assert 1234 === KaprekarConstant.sort_digits(3214, &(&1 <= &2))
    end

    test "sort_digits DESCENDING" do
      assert 4321 === KaprekarConstant.sort_digits(3214, &(&1 >= &2))
    end

  end

  test "any 3 (or fewer) digit integers get padded with trailing zeros to acheive 4 digits" do
    assert 3000 === KaprekarConstant.validate_n_descend(3)
  end

  test "validate the example function" do
    assert 3 === KaprekarConstant.return_steps(1234)
  end





end
