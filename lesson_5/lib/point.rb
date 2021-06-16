# Class Point
class Point
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def decide
    arr.each do |element|
      return false if element.is_number? == false || arr.size != 4
    end
    arr_float = arr.collect{ |element| element.to_f}
    Math.sqrt((arr_float[2] - arr_float[0])**2 +
      (arr_float[3] - arr_float[1])**2).round(2)
  end
end

# Class check object
class Object
  def is_number?
    to_f.to_s == to_s || to_i.to_s == to_s
  end
end
