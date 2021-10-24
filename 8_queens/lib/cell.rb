# frozen_string_literal: true

# class Cell
class Cell
  attr_accessor :y, :x, :z

  SYM = { 1 => :A,
          2 => :B,
          3 => :C,
          4 => :D,
          5 => :E,
          6 => :F,
          7 => :G,
          8 => :H }.freeze

  def initialize(arr, z = '*')
    @y, @x = *arr
    @z = z
  end
end
