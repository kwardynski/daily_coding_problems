defmodule RunLength do

  def encode(input_string) do
    [h | t] = String.graphemes(input_string)
    do_encode(h, t, 1, [])
    |> Enum.join("")
  end

  defp do_encode(previous_letter, [], count, encoded_list), do: Enum.reverse(["#{count}#{previous_letter}"  | encoded_list])
  defp do_encode(previous_letter, [current_letter | remainder], count, encoded_list) do
    case current_letter == previous_letter do
      true  -> do_encode(previous_letter, remainder, count+1, encoded_list)
      false -> do_encode(current_letter, remainder, 1, ["#{count}#{previous_letter}" | encoded_list])
    end
  end


  def decode(input_string) do
    String.graphemes(input_string)
    |> do_decode("")
  end

  defp do_decode([], decoded_string), do: decoded_string
  defp do_decode([count, letter | t], decoded_string) do
    n = String.to_integer(count)
    do_decode(t, "#{decoded_string}#{String.duplicate(letter, n)}")
  end

end
