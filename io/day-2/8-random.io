"Guess the number (0-100):" println

in := File standardInput

val := Random value(100) floor

for (tries, 1, 10,
  guess := in readLine asNumber
  if (
    guess == val
  ) then (
    "Correct!" println
    break
  ) else (
    if (tries > 1) then(
      closer := (guess - val) abs < (prevGuess - val) abs
      if (closer,
        "Incorrect. (Warmer.)" println,
        "Incorrect. (Colder.)" println
      )
    ) else (
      "Incorrect." println
    )
    prevGuess := guess
    
    if (tries == 10,
      "The answer was: #{val}" interpolate println
    )
  )
)
