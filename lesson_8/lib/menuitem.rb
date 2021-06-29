# frozen_string_literal: true

require 'io/console'

# Class MenuItem
class MenuItem
  def initialize(description, input, task)
    @description = description
    @input = input
    @task = task
    HomeWork.new(description, input, task)
    print MESSAGE_PRESS_KEY
    presskey
  end

  def presskey
    input = $stdin.getch
    presskey unless OPERATING_SYMBOLS.key?(input)

    symbol = OPERATING_SYMBOLS[input]
    menu(symbol) if symbol
  end

  def menu(symbol)
    case symbol
    when :start_over
      clear
      initialize(@description, @input, @task)
    when :quit
      abort THANKS
    end
  end
end
