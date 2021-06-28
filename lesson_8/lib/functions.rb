# frozen_string_literal: true

require 'io/console'

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
OPERATING_SYMBOLS = { 'n' => :next, 's' => :start_over, 'q' => :quit }.freeze
TASKS = { 1 => :task1, 2 => :task1, 3 => :task3, 4 => :task4 }.freeze
def clear
  puts `clear`
end

# def presskey
#   print MESSAGE_PRESS_KEY
#   input = $stdin.getch
#   OPERATING_SYMBOLS.select { |key| key == input }.values.last
# end

def empty_string?(str)
  return true if str.count(' ') == str.length
end

def first_space?(str)
  return true if str[0] == ' '
end
