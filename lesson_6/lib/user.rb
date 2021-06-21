# frozen_string_literal: true
require 'date'
require_relative 'settings'
require_relative 'gym'
require_relative 'menuitem'

# Class Player
class User
  def initialize(arr)
    @id = arr[0]
    @login = arr[1]
    @name = arr[3]
    @surname = arr[2]
    @role = arr[4]
    @menu_items_arr = []
    create_menu1_items
  end
  attr_reader :role, :menu_items_arr

  def create_menu1_items # Function to create main menu for trainer or player
    if @role == 'trainer'
      MENU1_TRAINER.each do |key, value|
        @menu_items_arr.push({ @role => MenuItem.new(key, value) })
      end
    else
      MENU1_PLAYER.each do |key, value|
        @menu_items_arr.push({ @role => MenuItem.new(key, value) })
      end
    end
  end

  def show_menu # Function show main menu
    clear
    puts "Hello, #{@name} #{@surname}! \n#{SELECT_MENU}#{@role}."
    @menu_items_arr.each do |element|
      element.each do |key, value|
        puts value.key
      end
    end
    input_key
  end

  def input_key # Function main menu, check input key
    print YOUR_CHOICE
    key = $stdin.getch
    if @role == 'trainer'
      if key == 1.to_s
        viewunverifiedplayers
        pressanykey
      end
      if key == 2.to_s
        autocheck
      end
      if key == 4.to_s
        viewvfplayers
      end
    else # Player
      if key == 1.to_s
        veiwgym(GYM_1)
        show_back
      end
      signup if key == 2.to_s
      abort BYE if key == ''
    end
  end

  def show_back
    print BACK_KEY
    key = $stdin.getch
    show_menu if key == 'b'
  end

  def signup # Function for player, input or set default datetime
    clear
    print SIGNUP_TIME
    time = gets.strip
    if time == ''
      savesignupusers(DEFUALT_TIME)
    else
      savesignupusers(time) if chk_time(time)
    end
  end

  def chk_time(time) # Function for player, chek input datetime
    begin
    DateTime.parse(time) # '%m/%d/%Y %H:%M')
    rescue
      clear
      print "#{DATE_IS_NOT_CORRECT}. #{PRESS_ANY_KEY}"
      key = $stdin.getch
      show_menu if key == 'b'
      signup
    end
  end

  def savesignupusers(time) # Function for player to save datetime in file
    savesignup(time)
    clear
    puts "#{YOU_APPLIED} at this time: #{time}"
    pressanykey
  end

  def pressanykey
    print "\n#{PRESS_ANY_KEY_TO_EXIT}"
    key = $stdin.getch
    show_menu if key == 'b'
    clear
    abort BYE
  end

  def autocheck # Function for trainer
    write_verifiedplayers(checkunverifiedplayers)
    clear
    puts VFPLAYERS_CREATED
    pressanykey
  end

  def viewvfplayers # Function for trainer
    viewverifiedplayers
    pressanykey
  end
end
