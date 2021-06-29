# frozen_string_literal: true

ARR_COLORS = {
  1 => 'красный',
  2 => 'оранжевый',
  3 => 'желтый',
  4 => 'зеленый',
  5 => 'голубой',
  6 => 'индиго',
  7 => 'фиолетовый'
}.freeze

ARR_DAYS = {
  1 => 'Понедельник',
  2 => 'Вторник',
  3 => 'Среда',
  4 => 'Четверг',
  5 => 'Пятница',
  6 => 'Суббота',
  7 => 'Воскресенье'
}.freeze

THANKS = "\n\nThanks! Bye!"
INPUT_ERROR = 'Input error!'
NEGATIVE = 'NEGATIVE'
POSITIVE = 'POSITIVE'
ODD = 'ODD'
EVEN = 'EVEN'
THIS_STRING = "\nThis is a string"
MESSAGE_PRESS_KEY = "\nPress 'q' to exit, 'n' to next, 's' to start over"
OPERATING_SYMBOLS = { 'n' => :next, 's' => :start_over, 'b' => :back, 'q' => :quit }.freeze

descr = "\nЗадания №1. Цвет по номеру"
input = "\nInput color number (1-7): "
TASK1 = [descr, input, 1].freeze
descr = "\nЗадания №2. День недели по номеру"
input = "\nInput day number (1-7): "
TASK2 = [descr, input, 2].freeze
descr = "\nЗадания №3. Проверка на целостность чисел и максимум из них"
input = "\nEnter different numbers like '1 59 77 10 3' and you can even check strings: "
TASK3 = [descr, input, 3].freeze
descr = "\nЗадания №4,5,6. Что введнено? Если число то тип, положительное/отрицательное?"
input = "\nEnter something: "
TASK4 = [descr, input, 4].freeze
TASKS = [TASK1, TASK2, TASK3, TASK4].freeze

def clear
  puts `clear`
end
