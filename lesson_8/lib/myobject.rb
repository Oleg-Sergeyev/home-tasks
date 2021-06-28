# frozen_string_literal: true

# Class Colors
class MyObject
  attr_accessor :arr_objects

  def initialize(arr_objects)
    @arr_objects = arr_objects
  end

  def input_number(number)
    return unless arr_objects.key?(number.to_i)

    arr_objects[number.to_i]
  end
end
