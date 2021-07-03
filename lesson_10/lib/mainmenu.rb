# frozen_string_literal: true

# Class MainMenu
class MainMenu
  def initialize(name)
    @name = name
    print_menu
  end

  def print_menu
    clear
    puts @name
    puts "\n\n"
    TASKS.each do |array|
      puts array.first
    end
    print MESSAGE_MAINMENU_PRESS_KEY
    presskey
  end

  def presskey
    input = $stdin.getch.chomp
    if input == 'q'
      abort THANKS
    elsif NUMBERS_MENU2.include?(input.to_i)
      initialize(@name) if TaskManager.new(input.to_i).competed_task
    end
  end
end
