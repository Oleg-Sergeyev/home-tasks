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
    return unless OPERATING_SYMBOLS.key?(input)

    symbol = OPERATING_SYMBOLS[input]
    if symbol
      menu(symbol)
    else
      presskey
    end
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
