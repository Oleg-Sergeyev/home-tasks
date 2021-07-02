# frozen_string_literal: true

require 'io/console'
require 'io/wait'

# Class MenuItem
class MenuItem
  attr_accessor :next_task

  def initialize(array)
    @description, @arr, @task = *array
    @arr_results = []
    # HomeWork.new(@arr_results)
    select_menu if create_miobject
    @next_task = next_task
  end

  def select_menu
    print MESSAGE_PRESS_ACCEPT
    return unless presskey1 == @task

    HomeWork.new(@arr_results, @description, @task)
    print MESSAGE_PRESS_KEY
    presskey2
  end

  def create_miobject
    @arr.each do |input_str|
      str = MultiInput.new(@arr_results, @description, input_str).getstr
      @arr_results.push(str) if str
    end
    MultiInput.new(@arr_results, @description, '')
  end

  def presskey2
    clear_stdin
    input = $stdin.getch.chomp
    presskey2 unless SYMBOLS_MENU2.key?(input)

    symbol = SYMBOLS_MENU2[input]
    menu2(symbol) if symbol
  end

  def presskey1
    input = ''
    loop do
      clear_stdin
      input = $stdin.getch.chomp
      break if SYMBOLS_MENU1.key?(input)
    end
    symbol = SYMBOLS_MENU1[input]
    menu1(symbol) if symbol
  end

  def menu1(symbol)
    case symbol
    when :accept
      @next_task = @task
    when :input
      initialize([@description, @arr, @task])
    end
  end

  def menu2(symbol)
    case symbol
    when :restart
      @next_task = @task
    when :next
      @next_task = @task + 1
    when :back
      @next_task = @task - 1
    when :quit
      abort THANKS
    end
  end

  def clear_stdin
    $stdin.getc while $stdin.ready?
  end
end
