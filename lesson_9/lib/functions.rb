# frozen_string_literal: true

THANKS = "\n\nThanks! Bye!"
MESSAGE_PRESS_KEY = "\n\nPress 'q'- exit, 'n' - next, 'b' - back, 's' to start over"
OPERATING_SYMBOLS = { 'n' => :next, 's' => :start_over, 'b' => :back, 'q' => :quit }.freeze

# descr = "\nЗадания №1. Цвет по номеру"
# input = "\nInput color number (1-7): "
# TASK1 = [descr, input, 1].freeze
# descr = "\nЗадания №2. День недели по номеру"
# input = "\nInput day number (1-7): "
# TASK2 = [descr, input, 2].freeze
# descr = "\nЗадания №3. Проверка на целостность чисел и максимум из них"
# input = "\nEnter different numbers like '1 59 77 10 3' and you can even check strings: "
# TASK3 = [descr, input, 3].freeze
descr = "\nЗадание №7. Числа Фибоначчи, цикл"
input = "\nEnter munber of 'Fibonacci number': "
TASK7 = [descr, input, 7].freeze
descr = "\nЗадание №8. Числа Фибоначчи, рекурсия"
input = "\nEnter munber of 'Fibonacci number': "
TASK8 = [descr, input, 8].freeze
descr = "\nЗадание №9. Числа Фибоначчи, по формуле Бине"
input = "\nEnter munber of 'Fibonacci number': "
TASK9 = [descr, input, 9].freeze
TASKS = [TASK7, TASK8, TASK9].freeze

def clear
  puts `clear`
end
