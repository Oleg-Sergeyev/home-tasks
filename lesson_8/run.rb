# frozen_string_literal: true

require_relative 'lib/myobject'
require_relative 'lib/qualifier'
require_relative 'lib/functions'

check = Qualifier.new
clear
loop do
  puts "\nЗадания №1. Цвет по номеру"
  colors = MyObject.new(ARR_COLORS)
  print "\nInput color number (1-7): "
  str = gets.chomp
  if check.input(str)
    puts "This color is: #{colors.input_number(str)}"
  else
    puts INPUT_ERROR
  end
  case presskey
  when :start_over
    clear
    redo
  when :next
    break
  when :quit
    abort
  end
end

clear
loop do
  puts "\nЗадания №2. День недели по номеру"
  week = MyObject.new(ARR_DAYS)
  print "\nInput day number (1-7): "
  str = gets.chomp
  if check.input(str)
    puts "The day is: #{week.input_number(str)}"
  else
    puts INPUT_ERROR
  end
  case presskey
  when :start_over
    clear
    redo
  when :next
    break
  when :quit
    abort
  end
end

clear
loop do
  puts "\nЗадания №3. Проверка на целостность чисел и максимум из них"
  print "\nInput some numbers like (1 59 77 10 3): "
  input = gets.chomp
  error = false
  input.split(' ').each { |element|
    if !check.number(element) || check.float?(element)
      error = true
      puts 'Error in input'
      break
    end
  }
  puts "Max of numbers is: #{input.split(' ').map(&:to_i).max}" if error == false
  case presskey
  when :start_over
    clear
    redo
  when :next
    break
  when :quit
    abort
  end
end

loop do
  clear
  puts "\nЗадания №4,5,6. Что введнено? Если число то тип, положительное/отрицательное?"
  print "\nEnter something: "
  str = gets.chomp
  res = check.input(str)
  if res
    puts res
  else
    puts 'This is a string'
  end
  case presskey
  when :start_over
    clear
    redo
  when :next
    break
  when :quit
    abort
  end
end
