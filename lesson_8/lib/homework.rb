# frozen_string_literal: true

# Class HomeWork
class HomeWork
  attr_accessor :description, :input

  def initialize(description, input)
    @description = description
    @input = input
    @check = Qualifier.new
    show_description
    check_str(input_str)
    presskey
  end

  def show_description
    puts @description
  end

  def input_str
    print input
    gets.chomp
  end

  def check_str(str)
    if first_space?(str)
      puts THIS_STRING
    else
      res = @check.input(str)
      if res
        puts res
      else
        puts THIS_STRING
      end
    end
  end

  def presskey
    print MESSAGE_PRESS_KEY
    loop do
      input = $stdin.getch
      symbol = OPERATING_SYMBOLS.select { |key| key == input }.values.first
      menu(symbol) if symbol
    end
  end

  def menu(symbol)
    case symbol
    when :start_over
      clear
      initialize(description, input)
    when :next
    when :quit
      abort THANKS
    end
  end
end
