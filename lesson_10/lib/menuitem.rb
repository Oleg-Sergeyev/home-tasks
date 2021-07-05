# frozen_string_literal: true

require 'io/console'
require 'io/wait'

# Class MenuItem
class MenuItem
  attr_accessor :next_task

  def initialize(array)
    @description, @arr, @num_task = *array
    @arr_results = []
    start
    @next_task = next_task
  end

  def start
    select_menu if create_miobject
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
      if input_str.class != Array
        str = MultiInput.new(@arr_results, @description, input_str).getstr
        @arr_results.push(str) if str != ''
      elsif @arr_results.empty?
        @arr_results.push(input_str.last) #if @arr_results.empty?
      end
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
      @arr_results = []
      start
    end
  end

  def menu2(symbol)
    case symbol
    when :restart
      @next_task = @num_task
      @arr_results = []
    when :quit
      @next_task = 0
    end
  end
end
