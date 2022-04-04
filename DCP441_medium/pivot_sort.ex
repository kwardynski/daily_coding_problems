defmodule PivotSort do

  def main(lst, x) do
    {lower_portion, upper_portion, pivot_count} = do_pivot_sort(lst, x, [], [], 0)
    lower_portion ++ List.duplicate(x, pivot_count) ++ upper_portion
  end

  def do_pivot_sort([], _, lower_portion, upper_portion, pivot_count), do: {lower_portion, upper_portion, pivot_count}
  def do_pivot_sort([elem | lst], pivot, lower_portion, upper_portion, pivot_count) do
    cond do
      elem < pivot -> do_pivot_sort(lst, pivot, [elem | lower_portion], upper_portion, pivot_count)
      elem > pivot -> do_pivot_sort(lst, pivot, lower_portion, [elem | upper_portion], pivot_count)
      true         -> do_pivot_sort(lst, pivot, lower_portion, upper_portion, pivot_count+1)
    end
  end

end
