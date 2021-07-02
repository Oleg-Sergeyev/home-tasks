# frozen_string_literal: true

require 'io/console'

# Class MenuItem
class MenuItem
  attr_accessor :next_task

  def initialize(array)
    @description, @arr, @task = *array
    @arr_results = []
    # HomeWork.new(@arr_results)
    HomeWork.new(@arr_results, @description, @task) if create_miobject
    print MESSAGE_PRESS_KEY
    @next_task = next_task
    presskey
  end

  def create_miobject
    @arr.each do |input_str|
      str = MultiInput.new(@arr_results, @description, input_str).getstr
      @arr_results.push(str) if str
    end
    MultiInput.new(@arr_results, @description, '')
  end

  def presskey
    input = $stdin.getch
    presskey unless OPERATING_SYMBOLS.key?(input)

    symbol = OPERATING_SYMBOLS[input]
    menu(symbol) if symbol
  end

  def menu(symbol)
    case symbol
    when :input_again
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
