# frozen_string_literal: true

THANKS = "\n\nThanks! Bye!"
MESSAGE_PRESS_KEY = "\n\nPress 'q'- exit, 'n' - next, 'b' - back, 's' to start over"
OPERATING_SYMBOLS = { 'n' => :next, 's' => :start_over, 'b' => :back, 'q' => :quit }.freeze
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
input = "\nEnter any numbers: "
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

def clear
  puts `clear`
end
