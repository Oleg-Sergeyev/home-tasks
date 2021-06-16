# frozen_string_literal: true

# Class Auto
class Auto
  def initialize(arr)
    @arr = arr
  end
  attr_accessor :arr

  def list
    return false if arr.size != 3
  end
end
