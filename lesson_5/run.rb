# frozen_string_literal: true

require_relative 'lib/user'
require_relative 'lib/point'
require_relative 'lib/auto'
require_relative 'lib/functions'

puts `clear`
puts 'Задание 1, 5'
student = User.new('Олег', 'Сергеев', 'Владимирович')
student2 = User.new('Новенький', 'Новенький', 'Новенький')
teacher = User.new('Игорь', 'Симдянов', 'Владимирович')
student2.name = 'Василий'
puts "Объект №#{student.count} #{student.name} #{student.surname} #{student.patronimyc}"
puts "Объект №#{student2.count} #{student2.name} #{student2.surname} #{student2.patronimyc}"
puts "Объект №#{teacher.count} #{teacher.name} #{teacher.surname} #{teacher.patronimyc}"

presskey

puts 'Задание 2'
bus = Auto.new(%w[автобус лиаз 1988])
truck = Auto.new(['грузовик', 'камаз', 2021])
car = Auto.new([:car, :toyota, 2021])

car.arr[1] = :wolkswagen

puts "\nBus #{bus.arr}"
puts "Bus #{truck.arr}"
puts "Bus #{car.arr}"

presskey

puts 'Задание 3'
pointers = Point.new(%w[-5 100 lklk 5])
puts "\nКоординаты: #{pointers.arr}"
res = pointers.decide
if res != false
  puts "\nРезультат вычисления: #{res} ед."
else
  puts "\nОшибка в переданном массиве"
end

presskey

puts 'Задание 4'
puts $LOAD_PATH
puts "\nВсего элементов(путей): #{$LOAD_PATH.size}"
