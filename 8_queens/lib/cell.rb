# frozen_string_literal: true

# class Cell
class Cell
  attr_accessor :y, :x, :z

  def initialize(arr, z = '*')
    @y, @x = *arr
    @z = z
  end
end
