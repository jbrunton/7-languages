"Guess the number (0-100):" println

in := File standardInput

val := Random value(100) floor

for (count, 1, 10,
  guess := in readLine asNumber
  if (
    guess == val
  ) then (
    "Correct!" println
    break
  ) else (
    if (count > 1) then(
      if (
        (guess - val) abs < (prevGuess - val) abs
      ) then (
        "Incorrect. (Warmer.)" println
      ) else (
        "Incorrect. (Colder.)" println
      )
    ) else (
      "Incorrect." println
    )
    prevGuess := guess
  )
)
