# frozen_string_literal: true

require_relative 'lib/randomtext'

text_size = 1_000 # bytes
name = 'some.txt'
file = File.new(name, 'a')
some_text = RandomText.new(text_size).text
puts "Text size: #{some_text.bytesize} bytes"
puts "Your condition max: #{text_size} bytes"
puts 'Some text:'
puts "\n"
puts some_text
file << some_text
