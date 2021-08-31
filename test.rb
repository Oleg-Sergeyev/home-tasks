# frozen_string_literal: true

# require 'deep_clone'

@main_diagonals = []
@first = []

@diag1 = (1..8).each_with_index.map do |x, index|
  [index + 1, x]
end

def diagonal_1
  get_diagonals(@diag1)
  # p @main_diagonals
  # p @first
end

def get_diagonals(diag)
  array1 = diagonals(diag)
  # arr = DeepClone.clone(array1)
  # p "array1 = #{array1}"
  @main_diagonals << array1
  p "@main_diagonals = #{@main_diagonals}"
  get_diagonals(array1) if array1.size > 1
end

def diagonals(array)
  array.pop
  p array.object_id
  p array
  arr1 = array.map do |arr|
    [arr[0], arr[1] += 1]
  end

  # DeepClone.clone(arr1)
end

diagonal_1
