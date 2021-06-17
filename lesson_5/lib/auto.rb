# frozen_string_literal: true

# Class Auto
class Auto
  PARAM = 3
  def initialize(arr)
    @arr = arr
  end
  attr_accessor :arr

  def list
    return true if arr.size != PARAM
  end
end
