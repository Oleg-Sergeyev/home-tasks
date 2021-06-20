# frozen_string_literal: true
require 'date'
require 'csv'
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
    #p "#{@id} #{@login} #{@name} #{@surname} #{@role}"
  end
  attr_reader :role, :menu_items_arr

  def viewgyms
    Array[GYM_1, GYM_2, GYM_3]
  end

  def create_menu1_items
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

  def show_menu
    clear
    puts SELECT_MENU
    @menu_items_arr.each do |element|
      element.each do |key, value|
        puts value.key
      end
    end
    input_key
  end

  def input_key
    print YOUR_CHOICE
    key = $stdin.getch
    if @role == 'trainer'
    else
      if key == 1.to_s
        veiwgym(GYM_1)
        show_back
      end
      signup if key == 2.to_s
    end
   end

  def show_back
    print BACK_KEY
    key = $stdin.getch
    show_menu if key == 'b'
  end

  def signup
    clear
    print SIGNUP_TIME
    time = gets.strip
    if time == ''
      savesignup(DEFUALT_TIME) #'save signup'
    else
      if chk_time(time)
        p 'correct' #savesignup(time)
      else
        p 'not correct' #signup
      end
    end
  end

  def chk_time(time)
    begin
    DateTime.parse(time) # '%m/%d/%Y %H:%M')
    rescue
      clear
      print "#{DATE_IS_NOT_CORRECT}. #{PRESS_ANY_KEY}"
      key = $stdin.getch
      show_back if key == 'b'
      signup
    end
  end
end
