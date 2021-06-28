# frozen_string_literal: true

require_relative 'lib/myobject'
require_relative 'lib/qualifier'
require_relative 'lib/functions'
require_relative 'lib/homework'
require_relative 'lib/menuitem'

# clear
# loop do
#   puts "\nЗадания №3. Проверка на целостность чисел и максимум из них"
#   print "\nEnter different numbers like '1 59 77 10 3' and you can even check strings: "
#   input = gets.chomp
#   if empty_string?(input)
#     puts "\nAll spaces entered"
#   else
#     error = false
#     input.split(' ').each do |element|
#       next unless !check.number(element) || check.float?(element)

#       error = true
#       puts 'Error in input'
#       break
#     end
#     puts "Max of numbers is: #{input.split(' ').map(&:to_i).max}" if error == false
#   end
#   case presskey
#   when :start_over
#     clear
#     redo
#   when :next
#     break
#   when :quit
#     abort THANKS
#   end
# end
clear
descr = "\nЗадания №1. Цвет по номеру"
input = "\nInput color number (1-7): "
MenuItem.new(MESSAGE_PRESS_KEY, OPERATING_SYMBOLS, descr, input, 1)

clear
descr = "\nЗадания №2. День недели по номеру"
input = "\nInput day number (1-7): "
MenuItem.new(MESSAGE_PRESS_KEY, OPERATING_SYMBOLS, descr, input, 2)

clear
descr = "\nЗадания №3. Проверка на целостность чисел и максимум из них"
input = "\nEnter different numbers like '1 59 77 10 3' and you can even check strings: "
MenuItem.new(MESSAGE_PRESS_KEY, OPERATING_SYMBOLS, descr, input, 3)

clear
descr = "\nЗадания №4,5,6. Что введнено? Если число то тип, положительное/отрицательное?"
input = "\nEnter something: "
MenuItem.new(MESSAGE_PRESS_KEY, OPERATING_SYMBOLS, descr, input, 4)
