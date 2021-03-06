# frozen_string_literal: true

require_relative 'lib/user'
require_relative 'lib/point'
require_relative 'lib/auto'
require_relative 'lib/functions'

puts `clear`
puts 'Задание 1, 5'
student = User.new('Олег', 'Сергеев', 'Владимирович')
student2 = User.new('Новенький', 'Новенький', 'Новенький')
teacher = User.new('Игорь', 'Симдянов', 'Вячеславович')
student2.name = 'Василий'
puts "\nОбъект №#{student.count} #{student.name} #{student.patronimyc} #{student.surname}"
puts "Объект №#{student2.count} #{student2.name} #{student2.patronimyc} #{student2.surname}"
puts "Объект №#{teacher.count} #{teacher.name} #{teacher.patronimyc} #{teacher.surname}"

presskey

puts 'Задание 2'
bus = Auto.new(%w[автобус лиаз])
truck = Auto.new(['грузовик', 'камаз', 2021])
car = Auto.new([:car, :toyota, 2021])

car.arr[1] = :wolkswagen

autos = [bus, truck, car]

autos.each do |auto|
  if !auto.list.nil?
    puts "Auto: #{auto.arr} has error in parametres!"
  else
    puts "Auto: #{auto.arr}"
  end
end

presskey

puts 'Задание 3'
pointers = Point.new(%w[-5 8 ewr 5])
puts "\nКоординаты: #{pointers.arr}"
res = pointers.calculate
if res != true
  puts "\nРезультат вычисления: #{res} ед."
else
  puts "\nОшибка в переданном массиве"
end

presskey

puts 'Задание 4'
puts $LOAD_PATH
puts "\nВсего элементов(путей): #{$LOAD_PATH.size}"
