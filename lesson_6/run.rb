# frozen_string_literal: true

require_relative 'lib/gym'
require_relative 'lib/user'
require_relative 'lib/settings'
require_relative 'lib/functions'
require_relative 'lib/messages'
require_relative 'lib/hello'
require 'date'
require 'io/console'

clear
puts 'Задания к уроку №6'
print "\nЗадание по порядку press any key, сразу последнее press '2' "
input = $stdin.getch
if input == '2'
  last
  abort BYE
end

clear
puts 'Задание 1 (Дни недели)'
MONDAY = 'monday'
TUESDAY = 'tuesday'
WEDNESDAY = 'wednesday'
THURSDAY = 'thursday'
FRIDAY = 'friday'
SATURDAY = 'saturday'
SUNDAY = 'sunday'
WEEK = [MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY].freeze
WEEK.each do |day|
  puts day
end

presskey

puts 'Задание 2 (Четное/Нечетное)'
print 'Input nuber: '
input = gets.chomp
if (input.to_f % 2).zero?
  puts 'Четное'
else
  puts 'Нечетное'
end
presskey

clear
puts 'Задание 3 (Приветсвие)'
greeting_time = Hello.new
puts greeting_time.greeting
presskey

clear
puts 'Задание 4 (Сумма чисел)'
print 'Input nubers: '
arr = gets.chomp
summ = 0
arr.split(' ').each do |element|
  summ += element.to_f
end
puts "Сумма: #{summ}"
presskey

clear
puts 'Задание 5 (Факториал числа)'
print 'Input nuber: '
number = gets.chomp
f = 1
i = 1
while i <= number.to_i
  f *= i
  i += 1
end
puts "f(#{number}) = #{f}"
presskey

clear
puts 'Задание 6 (Возраст)'
print "\nInput birthday like '03/02/1977': "
birthday = gets.chomp
puts "Полных лет: #{((DateTime.now - DateTime.parse(birthday)).to_i / 360) - 1}"
presskey

clear
puts 'Задание 7 (Реализовано во всех предыдущих заданиях)'
presskey

last
