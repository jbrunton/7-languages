[*1..16].each do |i|
  print(i);
  print(i % 4 == 0 ? "\n" : " ")
end

[*1..16].each_slice(4) do |s|
  puts s.join(' ')
end
