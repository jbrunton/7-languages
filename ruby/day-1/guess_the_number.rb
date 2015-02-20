number = rand(10)

def read_guess
  puts "Guess the number:"
  gets.to_i
end

guess = read_guess
while guess != number
  puts "Too low!" if guess < number
  puts "Too high!" if guess > number
  guess = read_guess
end

puts "You guessed it!"
