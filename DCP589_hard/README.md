# Daily Coding Problem 589 - HARD
## Probability Club Membership

Alice wants to join her school's Probability Student Club. Membership dues are computed via one of two simple probabilistic games.  

The first game: roll a die repeatedly. Stop rolling once you get a five followed by a six. Your number or rolls is the amount you pay, in dollars.  

The second game: same, except that the stopping condition is a five followed by a five.  

Which of the two games should Alice elect to play? Does it even matter? Write a program to simulate the two games and calculate their expected value.

## Solution
Upon _quick_ inspection, it seems that the two games should be equal - if you roll a 5, you have a 1/6 change of rolling a 5 or a 6 afterwards. The difference here is what happens if you _don't_ roll a the winning number immediately after the first 5. In the second game, if you don't roll a 5, you have to start again - meaning you're one roll behind the first game, where if you don't roll a 6 immediately after a 5, you _could possibly_ roll a 5 which lands you right back at needing the winning roll post initial 5 roll.  

The code in [dues_calculator.exs](dues_calculator.exs) simulates this, the function `DuesCalculator.run/2` will calculate how many rolls are required to achieve a specified winning condition. `ResultsHandler.run/3` is the main entry point and requires 3 arguments, how many attempts to try, the initial number, and the required following number. It will call `DuesCalculator.run/2` however many times specified by the total results argument, calculate the average required roll (representing Alice's dues fees) and display the results.  

```
iex dues_calculator.exs

  Game Conditions
    Initial Number: 5
    Winning Number: 6
    Total Attempts: 100
    Average Dues:   $36.23
  
  
  Game Conditions
    Initial Number: 5
    Winning Number: 5
    Total Attempts: 100
    Average Dues:   $42.06
```