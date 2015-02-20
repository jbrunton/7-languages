# prints and reverses the lines in a file

lines = []

File.open("test_file.txt", "r") do |f|
  f.each_line do |line|
    lines << line
    puts line
  end
end

File.open("test_file.txt", "w") do |f|
  lines.reverse.each {|line| f.write(line)}
end
