# frozen_string_literal: true

require 'io/console'

# Class MenuItem
class MenuItem
  attr_accessor :next_task

  def initialize(array)
    @description, @input, @task = *array
    HomeWork.new(@description, @input, @task)
    print MESSAGE_PRESS_KEY
    @next_task = next_task
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
      @next_task = @task
    when :next
      @next_task = @task + 1
    when :back
      @next_task = @task - 1
    when :quit
      abort THANKS
    end
  end
end
