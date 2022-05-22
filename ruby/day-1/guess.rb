number = rand(10) + 1

puts "Enter a number between 1 and 10"
guess = gets.to_i

while guess != number
  if guess < number
    puts "Too low!"
  else
    puts "Too high!"
  end
  guess = gets.to_i
end

puts "Correct!"
