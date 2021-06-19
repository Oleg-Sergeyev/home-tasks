# frozen_string_literal: true
require 'csv'
require_relative 'settings'
require_relative 'gym'

# Class Player
class Player
  def initialize(arr)
    p arr
    @name = arr[2]
    @surname = arr[1]
    @login = arr[0]
    puts "Привет #{@surname} #{@name} ! Ваш логин: #{@login}"
  end
   



end
