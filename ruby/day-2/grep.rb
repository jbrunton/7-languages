#!/usr/bin/env ruby

pattern = ARGV[0]
filename = ARGV[1]

if filename.nil? || pattern.nil?
  puts "Usage: grep <pattern> <filename>"
  exit
end

file_data = File.read(filename)

index = 0
file_data.lines do |line|
  if line =~ /#{pattern}/
    puts "line #{index}: #{line}"
  end
  index += 1
end
