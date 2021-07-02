# frozen_string_literal: true

INPUT_ERROR = 'Input error!'
THANKS = "\n\nThanks! Bye!"
MESSAGE_PRESS_KEY = "\n\nPress 'q'- exit, 'n' - next, 'b' - back, 'i' input again"
OPERATING_SYMBOLS = { 'n' => :next, 'i' => :input_again, 'b' => :back, 'q' => :quit }.freeze

TASK1_DESCRIPTION = "\nЗадание №1. Можно ввести три раза"
INPUTS1 = ["\nInput first param like '654': ", "\nInput second param: ", "\nInput third param: "].freeze
TASK1 = [TASK1_DESCRIPTION, INPUTS1, 1].freeze

TASK2_DESCRIPTION = "\nЗадание №2. Только один ввод"
INPUTS2 = ["\nInput only one param: "].freeze
TASK2 = [TASK2_DESCRIPTION, INPUTS2, 2].freeze

TASKS = [TASK1, TASK2].freeze

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
