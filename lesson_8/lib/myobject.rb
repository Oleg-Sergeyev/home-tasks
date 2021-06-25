# frozen_string_literal: true

# Class Colors
class MyObject
  attr_accessor :arr_objects

  def initialize(arr_objects)
    @arr_objects = arr_objects
  end

  def input_number(number)
    arr_objects.select { |key| key == number.to_i }.values[0] if number.to_i <= 7 && number.to_i >= 1
      
    #end
   
    #  INPUT_ERROR
 
    
  end

end
