defmodule DuesCalculator do

  def run(initial_number, winning_number) do
    count_rolls(initial_number, winning_number, -1, 0)
  end

  def count_rolls(initial_number, winning_number, previous_roll, total_rolls) do
    dice_roll = 1..6
    |> Enum.random()

    case {previous_roll, dice_roll} do
      {^initial_number, ^winning_number} ->
        total_rolls+1
      _ ->
        count_rolls(initial_number, winning_number, dice_roll, total_rolls+1)
    end
  end

end


defmodule ResultsHandler do

  def run(total_attempts, initial_number, winning_number) do

    # Calculate TOTAL number of rolls required to win over total_attempts attempts
    total_rolls = Enum.map(1..total_attempts, fn(_x) ->
      DuesCalculator.run(initial_number, winning_number)
    end)
    |> Enum.sum()

    # Calculate dues and display results
    average_dues = Float.round(total_rolls/total_attempts, 2)
    IO.puts("""
      Game Conditions
        Initial Number: #{initial_number}
        Winning Number: #{winning_number}
        Total Attempts: #{total_attempts}
        Average Dues:   $#{average_dues}

    """)
  end

end

total_attempts = 100
ResultsHandler.run(total_attempts, 5, 6)
ResultsHandler.run(total_attempts, 5, 5)
