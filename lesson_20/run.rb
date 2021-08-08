# frozen_string_literal: true

require 'singleton'

# class Vector
class Vector
  include Singleton

  def self.distance(point1, point2)
    Math.sqrt((point1.x - point2.x)**2 + (point1.y - point2.y)**2).round(3)
  end

  # class Point
  class Point
    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end
  end
end

a = Vector::Point.new(-1, 4)
b = Vector::Point.new(5, 9)
p Vector.distance(a, b)

a = Vector::Point.new(10, -4)
b = Vector::Point.new(0, -19)
p Vector.distance(a, b)
