# frozen_string_literal: true

require_relative 'lib/randomstring'

file_size = 15_000
name = 'some.txt'
file = File.new(name, 'a')
some_text = RandomString.text
p some_text.bytesize
file << some_text if some_text.bytesize <= file_size
