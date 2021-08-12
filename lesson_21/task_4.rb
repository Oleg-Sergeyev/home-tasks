# frozen_string_literal: true

# Создайте модуль RomanNumbers с методом roman, который переводит арабские цифры в римские.
# Расширьте класс Integer созданным модулем.

# module RomanNumbers
module RomanNumbers
  NUMBERS = { 1 => 'I',
              2 => 'II',
              3 => 'III',
              4 => 'IV',
              5 => 'V',
              6 => 'VI',
              7 => 'VII',
              8 => 'VIII',
              9 => 'IX',
              10 => 'X' }.freeze

  def roman
    NUMBERS[self]
  end
end

class Integer
  include RomanNumbers
end

puts 1.roman
puts 9.roman
