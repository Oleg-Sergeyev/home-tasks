# frozen_string_literal: true

# task 2
puts `clear`
puts 'Task 2'
matrix = [
  [1, 2, 3, 11],
  [4, 5, 6, 12],
  [7, 8, 9, 13],
  [7, 8, 9, 13]
]
s1 = matrix.each_with_index.reduce([]) do |sum, (element, index)|
  sum << element[index]
end.sum
p s1

s2 = matrix.each_with_index.reduce(0) do |sum, (element, index)|
  sum + element[index]
end
p s2
