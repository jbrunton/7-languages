# usage:
# ruby simple_grep.rb <file> <expr> 

file_name = ARGV[0]
regex = Regexp.new(ARGV[1])

File.open(file_name, "r") do |f|
  line_num = 1
  f.each_line do |line|
    puts "#{line_num} #{line}" if regex.match(line)
    line_num += 1
  end
end

