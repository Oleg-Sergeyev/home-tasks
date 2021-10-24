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
#summ = 0
summ = arr.split(' ').map(&:to_f).sum
#arr.split(' ').each do |element|
#  summ += element.to_f
#end
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
puts "\nСегодня: #{DateTime.now.strftime('%d-%m-%Y')}"
print "\nInput birthday like 'dd/mm/yyyy': "
birthday = gets.chomp
rescue
  if DateTime.parse(birthday)
end
year_born = DateTime.parse(birthday).year
month_born = DateTime.parse(birthday).month
day_born = DateTime.parse(birthday).day

curr_year = DateTime.now.year
curr_month = DateTime.now.month
curr_day = DateTime.now.day

years = (curr_year - year_born)
months = (curr_month - month_born)
days = (curr_day - day_born)

if days.negative?
  months -= 1
  days += 30
end
if months.negative?
  years -= 1
  months += 12
end

puts 'Вы еще не рождены ' if years.negative?
puts 'Позравляем с Днем Рождения!!!' if years.zero? && months.zero? && days.zero?
puts 'Позравляем с Днем Рождения!!!' if !years.zero? && months.zero? && days.zero?
print "\nВам" if years.positive? || months.positive? || days.positive?
print " #{years} #{chk_years(years)}" if years.positive?
print " #{months} #{chk_months(months)}" if months.positive?
print " #{days} #{chk_days(days)}" if days.positive?

presskey

clear
puts 'Задание 7 (Реализовано во всех предыдущих заданиях)'
presskey

last
