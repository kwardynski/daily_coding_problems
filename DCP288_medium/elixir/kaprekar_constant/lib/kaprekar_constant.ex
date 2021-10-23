defmodule KaprekarConstant do

  def return_steps(n) do
    input_check = validate_input(n)
    case input_check do
      {:error, error_msg} -> IO.puts(error_msg)
      {:ok, x}            -> calc_steps(x, 0)
    end
  end


  # Ensures input is a 4 digit integer with at least two unique values. Returns a tuple
  #   Test passed -> {:ok, n}
  #   Test failed -> {:error, "Input value must be an integer between 999 and 10000 with at least two  distinct digits"}
  def validate_input(n) do
    cond do
      is_integer(n) and n in 999..10000 -> _check_integer_properties(n)
      true                              -> _return_input_error()
    end
  end

  # Checks if input number is composed of at least two unique digits
  defp _check_integer_properties(n) do
    unique_digits = Integer.digits(n)
    |> Enum.uniq()
    cond do
      length(unique_digits) >= 2 -> {:ok, n}
      true                       -> _return_input_error()
    end

  end

  defp _return_input_error do
    {:error, "Input value must be an integer between 999 and 10000 with at least two  distinct digits"}
  end


  # Main driver for step calculation to reach Kaprekar's Constant
  #   - Sorts digits according to rules and ensures descending value is 4 digits
  #   - Calls self recursively until 6174 is reached
  defp calc_steps(6174, steps), do: steps
  defp calc_steps(n, steps) do
    n_ascend = sort_digits(n, &(&1 <= &2))

    n_descend = sort_digits(n, &(&1 >= &2))
    |> validate_n_descend()

    calc_steps(n_descend - n_ascend, steps+1)
  end


  # Sorts digits using anonymous sort_order function
  # Splits input integer into list of digits, sorts according to sort_order
  # then recombines as a string before converting to integer
  def sort_digits(n, sort_order) do
    n
    |> Integer.digits
    |> Enum.sort(sort_order)
    |> Enum.map(fn(x) -> Integer.to_string(x) end)
    |> Enum.join("")
    |> String.to_integer()
  end


  # Multiplies descending value by 10 until length of 4 digits reached
  def validate_n_descend(x) do
    cond do
      x < 1000 -> validate_n_descend(10 * x)
      true     -> x
    end
  end

end
