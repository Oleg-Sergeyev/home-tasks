# frozen_string_literal: true
require 'csv'
require_relative 'settings'
require_relative 'gym'

# Class Player
class Player
  def initialize(arr)
    @id = arr[0]
    @login = arr[1]
    @name = arr[3]
    @surname = arr[2]
    #p "#{@id} #{@login} #{@name} #{@surname}"
  end
   



end
