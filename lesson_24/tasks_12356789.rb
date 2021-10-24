# frozen_string_literal: true

require 'find'

puts `clear`
# task 1
puts 'Task 1'
num = rand(1..10)
p ((1..num).to_a).concat((1..num - 1).to_a.reverse)

# task 2 Сode moved to its file!
# puts 'Task 2'
# matrix = [
#   [1, 2, 3, 11],
#   [4, 5, 6, 12],
#   [7, 8, 9, 13],
#   [7, 8, 9, 13]
# ]
# s = 0
# matrix.each_with_index do |array, index|
#   s += array[index]
# end
# puts s

# task_3
puts 'Task 3'
arr = (1...10).to_a.join.gsub(/.{3}/, '\0 ').split(' ').map { |str| [] << str.to_i }
p arr

# task 5
puts 'Task 5'
# frozen_string_literal: false

p [1, 2, 3, 4, 5].each_with_object([]) { |val, sum| sum << val unless val.even?; }

# task 6, 7
puts 'Task 6,7'
# class Integer
class Integer
  def to_a(args = nil)
    return format('%b', self).chars.map(&:to_i) if args.nil?

    case args
    when 8 then to_s(8).chars.map(&:to_i)
    when 16 then to_s(16).chars
    end
  end
end

p 16.to_a
p 10.to_a(8)  # [1, 2]
p 10.to_a(16) # ['a']
p 17.to_a(8)
p 17.to_a(16)

# task 8
puts 'Task 8'
file = File.open('strings.txt', 'r')
File.new('strings_rand.txt', 'w') << file.map do |string|
  string.split(' ').shuffle!.join(' ') << "\n"
end.join
puts 'file created'

# task 9
puts 'Task 9'
EXT = %w[.jpg .jpeg .png .tif .gif].freeze
path = './image'
p Find.find(path).map { |f| f if EXT.include?(File.extname(f)) }.sample
