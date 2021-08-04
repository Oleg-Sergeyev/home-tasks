# frozen_string_literal: true

require 'fileutils'
require_relative 'lib/randomtext'

puts `clear`
puts "\nTask 2"
text_size = 1000 # bytes
name = 'some.txt'
File.delete(name) if File.exist?(name)
file = File.new(name, 'a')
some_text = RandomText.new(text_size).text
puts "\nCreated random text, size: #{some_text.bytesize} bytes"
puts "File size set: #{text_size} bytes"
# puts 'Some text:'
# puts "\n"
# puts some_text
file << some_text
puts "File '#{name}' created. Size = #{file.size}"
puts "\nTask 3"
arr = File.readlines(file).map(&:chomp)
# puts arr
# puts "\n"
max_str = arr.max { |a, b| a.size <=> b.size }
min_str = arr.min { |a, b| a.size <=> b.size }
puts "\nMax size: '#{max_str.size}' String:'#{max_str}'"
puts "Min size: '#{min_str.size}' String:'#{min_str}'"
