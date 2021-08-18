# frozen_string_literal: true

# class Figure
class Figures
  attr_accessor :array, :objects

  def initialize
    @array = []
    @objects = []
  end

  def add(arr)
    return if array.include?(arr)

    array << arr
    objects << Cube.new(arr)
  end
end

# class Cube
class Cube
  # include SameCube
  attr_accessor :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end
end
