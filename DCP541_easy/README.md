# Daily Coding Problem 541 - EASY
## Run-Length Encoding

Run-length encoding is a fast and simple method of encoding strings. The basic idea is to represent repeated successive characters as a single count and character. For example, the string "AAAABBBCCDAA" would be encoded as "4A3B2C1D2A".

Implement run-length encoding and decoding. You can assume the string to be encoded has no digits and consists solely of alphabetic characters. You can assume the string to be decoded is invalid.


## Solution
The `RunLength` module in [run_length.ex](run_length.ex) contains two public functions, `encode/1` and `decode/1` as the solution.

#### `encode/1`
This function (obviously) provides the encoding. It first converts the input string into an enumerable list of letters, splits off the first, and passes those variables to the private `do_encode/4` recursive function. `do_encode/4` recursively compares successive letters in the string against what the _previous_ letter was - if they match it increments the `count` variable which keeps track of how many times we've encountered that letters _so far_. If they're different, it updates the tracking letter, resets the count to 1, and adds the count of the previous letter to it's result in the form of "#{count}#{letter}". Once the entire enumerable is iterated through, we reverse the list and join the count/letter elements:
```
iex(1)> RunLength.encode("AAAABBBCCDAA")
"4A3B2C1D2A"

iex(2)> RunLength.encode("ABCAABBCAB")
"1A1B1C2A2B1C1A1B"
```

#### `decode/1`
This function does the opposite but in a similar manner to `encode/1`. The encoded string is again split into individual components, and passed to the private `do_decode/2` function. `do_decode/2` pulls _two_ elements from this enumerable which represent the count and letter, which are simply appended to the end accumulator string. Once the entire enumerable has been iterated through, the combined string is returned.
```
iex(3)> RunLength.decode("4A3B2C1D2A")
"AAAABBBCCDAA"

iex(4)> RunLength.decode("1A1B1C2A2B1C1A1B")
"ABCAABBCAB"
```
