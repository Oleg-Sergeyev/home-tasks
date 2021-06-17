# frozen_string_literal: true

# Class Point
class Point
  PARAM = 4
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def calc(array)
    Math.sqrt((array[2] - array[0])**2 +
    (array[3] - array[1])**2).round(3)
  end

  def calculate
    return true if arr.size != PARAM
    return true unless arr.all?(&:number?)

    arr_float = arr.collect(&:to_f)
    calc(arr_float)
  end
end

# Class check object
class Object
  def number?
    to_f.to_s == to_s || to_i.to_s == to_s
  end
end
