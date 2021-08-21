# frozen_string_literal: true

file = File.open('strings.txt', 'r')
arr = file.map do |string|
  string.split(' ').shuffle!.join(' ')
end
p arr
