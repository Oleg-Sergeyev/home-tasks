# frozen_string_literal: true

# Class Point
class Point
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def decide
    arr.each do |element|
      return false if element.number? == false || arr.size != 4
    end
    arr_float = arr.collect(&:to_f)
    Math.sqrt((arr_float[2] - arr_float[0])**2 +
      (arr_float[3] - arr_float[1])**2).round(2)
  end
end

# Class check object
class Object
  def number?
    to_f.to_s == to_s || to_i.to_s == to_s
  end
end