# frozen_string_literal: true

require 'io/console'
require 'io/wait'

# Class MenuItem
class MenuItem
  attr_accessor :next_task

  def initialize(array)
    @description, @arr, @num_task = *array
    @arr_results = []
    select_menu if create_miobject
    @next_task = next_task
  end

  def select_menu
    print MESSAGE_PRESS_ACCEPT
    return unless presskey1 == @num_task

    Task.new(@arr_results, @description, @num_task)
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
    input = $stdin.getch.chomp
    if SYMBOLS_MENU2.key?(input)
      symbol = SYMBOLS_MENU2[input]
      menu2(symbol) if symbol
    elsif NUMBERS_MENU2.include?(input.to_i)
      @next_task = input.to_i
    else
      presskey2
    end
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
      @next_task = @num_task
    when :input
      initialize([@description, @arr, @num_task])
    end
  end

  def menu2(symbol)
    case symbol
    when :restart
      @next_task = @num_task
    when :next
      @next_task = @num_task + 1
    when :back
      @next_task = @num_task - 1
    when :quit
      abort THANKS
    end
  end

  def clear_stdin
    $stdin.getc while $stdin.ready?
  end
end
