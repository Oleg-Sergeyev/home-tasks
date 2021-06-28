# frozen_string_literal: true

# Class MenuItem
class MenuItem
  def initialize(message_press_key, operating_symbols, description, input, task)
    @message_press_key = message_press_key
    @operating_symbols = operating_symbols
    @description = description
    @input = input
    @task = task
    HomeWork.new(@description, @input, @task)
    print @message_press_key
    presskey
  end

  def presskey
    input = $stdin.getch
    return unless @operating_symbols.key?(input)

    symbol = @operating_symbols[input]
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
      initialize(@message_press_key, @operating_symbols, @description, @input, @task)
    when :quit
      abort THANKS
    end
  end
end
