# frozen_string_literal: true

# module RomanNumbers
module RomanNumbers
  UNITS = {
    0 => '0',
    1 => 'I',
    2 => 'II',
    3 => 'III',
    4 => 'IV',
    5 => 'V',
    6 => 'VI',
    7 => 'VII',
    8 => 'VIII',
    9 => 'IX'
  }.freeze
  DOZENS = {
    10 => 'X',
    20 => 'XX',
    30 => 'XXX',
    40 => 'XL',
    50 => 'L',
    60 => 'LX',
    70 => 'LXX',
    80 => 'LXXX',
    90 => 'XC'
  }.freeze
  HUNDREDS = {
    100 => 'C',
    200 => 'CC',
    300 => 'CCC',
    400 => 'CD',
    500 => 'D',
    600 => 'DC',
    700 => 'DCC',
    800 => 'DCCC',
    900 => 'CM'
  }.freeze
  THOUSANDS = {
    1000 => 'M',
    2000 => 'MM',
    3000 => 'MMM'
  }.freeze

  def roman
    numbers = to_s.split('').map(&:to_i)
    return UNITS[numbers.first] if numbers.size == 1
    return create_dozens(numbers) if numbers.size == 2
    return create_hundreds(numbers) if numbers.size == 3
    return create_thousands(numbers) if numbers.size == 4
  end

  private

  # def hundreds(val)
  #   str = ''
  #   val.3 { str += 'C' } if (1..3).include?(val)
  #   str += 'CD' if val == 4
  #   str += 'D' if val == 5
  #   val.3 { str += 'D' } if (6..8).include?(val)
  # end

  def create_dozens(arr)
    "#{DOZENS["#{arr.first}0".to_i]}#{UNITS[arr.last]}"
  end

  def create_hundreds(arr)
    "#{HUNDREDS["#{arr.first}00".to_i]}#{create_dozens(arr.drop(1))}"
  end

  def create_thousands(arr)
    "#{THOUSANDS["#{arr.first}000".to_i]}#{create_hundreds(arr.drop(1))}"
  end
end

# class Integer
class Integer
  include RomanNumbers
end

p 0.roman
p 8.roman
p 37.roman
p 929.roman
p 1015.roman
p 3352.roman
p 352.roman
