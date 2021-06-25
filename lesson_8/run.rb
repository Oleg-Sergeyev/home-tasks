# frozen_string_literal: true

require_relative 'lib/myobject'
require_relative 'lib/qualifier'
require_relative 'lib/functions'

check = Qualifier.new
# colors = MyObject.new(ARR_COLORS)
# print 'Input color number (1-7): '
# number = gets.chomp
# if chk_number(number)
#   puts "This color is: #{colors.input_number(number)}"
# else
#   puts INPUT_ERROR
# end

# week = MyObject.new(ARR_DAYS)
# print 'Input day number (1-7): '
# number = gets.chomp
# if chk_number(number)
#   puts "The day is: #{week.input_number(number)}"
# else
#   puts INPUT_ERROR
# end

# print 'Input some numbers like (1 59 77 10 3): '
# input = gets.chomp
# input.split(' ').each { |element|
#   abort 'Error in input' if !number?(element) || float?(element)
# }
# puts "Max of numbers is: #{input.split(' ').map(&:to_i).max}"

#p check.float?('4.2')

print 'Input: '
input = gets.chomp
p input.try_convert
if input.to_f.zero? && input.length == 1
  puts 'Введен ноль'
elsif !input.to_f.zero? && input.to_f.real?
  p input.to_f
  puts 'Вещественное число'
else
  puts 'Введена строка'
end


# if check.float?(input)
#   puts 'This is float'
# elsif !check.number?(input)
#   puts 'This is string'
# else
#   puts 'This is real'
# end
