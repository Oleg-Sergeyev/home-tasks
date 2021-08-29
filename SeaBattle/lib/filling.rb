# frozen_string_literal: true

# module Filling
module Filling
  module_function

  def set_area_around(field, y, x)
    field.each do |arr|
      if x == 1
        right_side_all(arr, y, x)
      elsif x <= 9
        both_sides_all(arr, y, x)
      elsif x == 10
        left_side_all(arr, y, x)
      end
    end
  end

  def right_side_all(arr, y, x)
    right_side(arr, y, x)
    right_side_front_back(arr, y - 1, x) if y > 1
    right_side_front_back(arr, y + 1, x) if y < 10
  end

  def left_side_all(arr, y, x)
    left_side(arr, y, x)
    left_side_front_back(arr, y - 1, x) if y > 1
    left_side_front_back(arr, y + 1, x) if y < 10
  end

  def both_sides_all(arr, y, x)
    both_sides(arr, y, x)
    both_sides_front_back(arr, y - 1, x) if y > 1
    both_sides_front_back(arr, y + 1, x) if y < 10
  end

  def both_sides_front_back(arr, y, x)
    arr.each_cons(3) do |prev, cell, nxt|
      next unless y == cell.y && x == cell.x

      cell.x = x
      cell.y = y
      cell.z = '-'
      prev.x = x - 1
      prev.z = '-'
      nxt.x = x + 1
      nxt.z = '-'
    end
  end

  def both_sides(arr, y, x)
    arr.each_cons(3) do |prev, cell, nxt|
      next unless y == cell.y && x == cell.x

      prev.x = x - 1
      prev.z = '-'
      nxt.x = x + 1
      nxt.z = '-'
    end
  end

  def right_side(arr, y, x)
    arr.each_cons(2) do |cell, nxt|
      if y == cell.y && x == cell.x
        nxt.x = x + 1
        nxt.z = '-'
      end
    end
  end

  def right_side_front_back(arr, y, x)
    arr.each_cons(2) do |cell, nxt|
      next unless y == cell.y && x == cell.x

      cell.y = y
      cell.x = x
      cell.z = '-'
      nxt.y = y
      nxt.x = x + 1
      nxt.z = '-'
    end
  end

  def left_side(arr, y, x)
    arr.each_cons(2) do |prev, cell|
      if y == cell.y && x == cell.x
        prev.x = x - 1
        prev.z = '-'
      end
    end
  end

  def left_side_front_back(arr, y, x)
    arr.each_cons(2) do |prev, cell|
      next unless y == cell.y && x == cell.x

      cell.y = y
      cell.x = x
      cell.z = '-'
      prev.y = y
      prev.x = x - 1
      prev.z = '-'
    end
  end
end
