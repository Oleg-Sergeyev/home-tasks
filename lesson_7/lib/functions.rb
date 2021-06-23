# frozen_string_literal: true

require 'io/console'

BYE = "\nBye, bye!"
MESSAGE_PRESS_ANY_KEY = "\nPress any key to continue, or 'q' to exit"
EX1 = "\nЗадание 1. Используя оператор % выведите число пи (3.14159265358979)."\
"\nс точностью до второго знака после запятой (3.14)"
EX2 = 'Задание 2. Поменяйть значение переменных местами)'
EX3 = "\nЗадание 3. Создайте скрипт, который бы определял четность или нечетность числа"\
"\nтолько при помощи поразрядных операторов."
EX4 = "\nЗадание 3, только с логической операцией &"

def clear
  puts `clear`
end

def presskey
  print MESSAGE_PRESS_ANY_KEY
  input = $stdin.getch
  abort BYE if input == 'q'
  clear
end
