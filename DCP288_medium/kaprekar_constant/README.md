# KaprekarConstant

I'm going to do the module description and breakdown in a readme so it's a little easier to access
than the "tradidional" Elixir ExDoc method.


## FLOW:
- User supplies an input which is checked to match the problem criteria. Must be an integer value of 
  length four digits and be composed of at least two unique digits. 
  - `validate_input` calls `_check_integer_properties` if the input is an integer between 999 and 10000
  - If any of the tests fail, an error is returned.
- If a valid integer is given, `calc_steps` is called with an accumulator of 0 (number of steps)
  - Input number is sorted in ascending/descending order by `sort_digits`
  - Descending number is checked so that it is not less than 4 digits long. If it is, `validate_n_desend`
    multiplies it by 10 until the value is 4 digits long. (see reasoning in NOTES section below)
  - Ascending value is subtracted from descending, and `calc_steps` is called recursively with the result
    until Kaprekar's constant is reached, upon which `steps` is returned.


## NOTES:
- There's probably a better way to sort the values by ascending/descending values that splitting up, sorting, 
  converting digits to strings, appending, then re-converting back to an integer but this works well enough.
- Validation of the descending value is necessary - when mucking around with the solution I entered 9998 as a value 
  and encountered an infinite loop. This is because any values of XXXY where X = Y+1 will return 999 - a three digit number
  from which you can never reach a 4 digit value. 
- For those unfamiliar with Elixir Mix projects - test for all the major functions can be found in the 
  `test/kaprekar_constant_test.exs` script, this can be run by calling `mix test` after the solution is compiled.
