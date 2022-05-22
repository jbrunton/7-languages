xs = (1..16).to_a

puts "Printing xs with #each..."
i = 0
xs.each do |x|
  i += 1
  if i % 4 === 0
    puts x
  else
    print "#{x} "
  end
end

puts "Printing xs with #each_slice..."
xs.each_slice(4) { |slice| puts slice.join(" ") }
