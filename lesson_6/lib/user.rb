# frozen_string_literal: true
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
    if @role == 'player'
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
    @menu_items_arr.each do |element|
      element.each do |key, value|
        puts value.key
      end
    end
  end

end
