# frozen_string_literal: true

require_relative 'qualifier'

INPUT_ERROR = 'Input error!'
THANKS = "\n\nThanks! Bye!"
MESSAGE_PRESS_KEY = "\n\nPress 'q'- exit, 'n' - next, 'b' - back, 'i' input again"
OPERATING_SYMBOLS = { 'n' => :next, 'i' => :input_again, 'b' => :back, 'q' => :quit }.freeze
LEAP_YEAR = 'високосный год'
COMMON_YAER = 'невисокосный год'
LEAP_YEAR_DAYS = 366

ARR_COLORS = {
  1 => 'красный',
  2 => 'оранжевый',
  3 => 'желтый',
  4 => 'зеленый',
  5 => 'голубой',
  6 => 'синий',
  7 => 'фиолетовый'
}.freeze

descr = "\nЗадание №1. Метод sum, который принимает любое количество числовых аргументов и возвращает их сумму"
input = "\nInput any nubers like '654 45 54 52 5.5 54..': "
TASK1 = [descr, input, 1].freeze
descr = "\nЗадание №2. Год високосный?"
input = "\nInput year like '2014' (enter default 2021): "
TASK2 = [descr, input, 2].freeze
descr = "\nЗадание №3. Вернуть номер цвета"
input = "\nEnter colors name like 'синий': "
TASK3 = [descr, input, 3].freeze
descr = "\nЗадание №4. Класс пользователя User"
input = "\nInput some users like 'Иванов Сергей Иванович Петров Василий Потапович и т.д.': "
TASK4 = [descr, input, 4].freeze
descr = "\nЗадание №5. Перевод градусов Цельсия в градусы по Фаренгейту и обратно"
input = "\nEnter degrees Celsius and Fahrenheit like '50 100' : "
TASK5 = [descr, input, 5].freeze
descr = "\nЗадание №6. Конвертации килограмм в граммы"
input = "\nEnter any numbers like '4550 5000 3000 30..': "
TASK6 = [descr, input, 6].freeze
descr = "\nЗадание №7. Числа Фибоначчи, цикл"
input = "\nEnter munber of 'Fibonacci number': "
TASK7 = [descr, input, 7].freeze
descr = "\nЗадание №8. Числа Фибоначчи, рекурсия"
input = "\nEnter munber of 'Fibonacci number': "
TASK8 = [descr, input, 8].freeze
descr = "\nЗадание №9. Числа Фибоначчи, по формуле Бине"
input = "\nEnter munber of 'Fibonacci number': "
TASK9 = [descr, input, 9].freeze
TASKS = [TASK1, TASK2, TASK3, TASK4, TASK5, TASK6, TASK7, TASK8, TASK9].freeze

def getlessons
  arr = []
  i = 1
  TASKS.length.times do
    str = "lesson_#{i}"
    arr.push(str)
    i += 1
  end
  arr
end

def clear
  puts `clear`
end

def empty_string?(str)
  return true if str.count(' ') == str.length
end

def first_space?(str)
  return true if str[0] == ' '
end

def empty?(str)
  return true if str == ''
end

def not_empty?(str)
  return true if str != ''
end

def check_num_str(str)
  error = false
  str.split(' ').each do |element|
    next if Qualifier.number?(element)

    error = true
    break
  end
  error
end

def method_task2(year, curr_year = 2021)
  if year.zero? && Date.new(curr_year, 12, 31).yday == LEAP_YEAR_DAYS
    puts "\n#{curr_year} - #{LEAP_YEAR} - #{LEAP_YEAR_DAYS} дней"
  elsif !year.zero? && Date.new(year, 12, 31).yday == LEAP_YEAR_DAYS
    puts "\n#{year} - #{LEAP_YEAR} - #{LEAP_YEAR_DAYS} дней"
  else
    puts "\n#{year.zero? ? curr_year : year} #{COMMON_YAER}"
  end
end

def method_task4(str)
  arr = str.split(' ').each_slice(3).to_a
  n = 0
  while n < arr.length
    user = User.new(*arr[n])
    puts "\nClass '#{user.class}' -> #{user.name} #{user.surname} #{user.patronymic}"
    n += 1
  end
end

def method_task5(*arr)
  cel, far = *arr
  cel2far = cel * 1.8 + 32
  if far
    far2cel = (far - 32) / 1.8
    puts "\n(#{cel})cel.->(#{cel2far.round(0)})far.  (#{far})far.->(#{far2cel.round(0)}).cel"
  else
    puts "\n(#{cel})cel.->(#{cel2far.round(0)})far."
  end
end

def method_task6(*arr, convert: 1000)
  print "\n#{arr.map { |element| (element / convert).round(2) }} kg."
end

def loop_task7(str)
  x = 0
  y = 1
  n = 1
  print "\nFibonacci row: #{x} #{y}"
  while n <= (str.to_i - 1)
    x, y = y, (x + y)
    print " #{y}"
    n += 1
  end
  puts "\n\nFibonacci number: #{y}"
end
