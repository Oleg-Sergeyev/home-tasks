# frozen_string_literal: true

require_relative 'boat'

# class Fleet
class Navy
  attr_accessor :fleet

  include Enumerable

  def initialize(params)
    @fleet = params.map { |deck| Boat.new(deck) }
  end

  def each(&block)
    @fleet.each(&block)
  end

  def self.set_boats_on_map(boat, field)
    rand(0..1).zero? ? auto_vertical_set(boat, field) : auto_horizontal_set(boat, field)
  end

  def self.auto_vertical_set(boat, field)
    full = (0..9).to_a.map do |index|
      (0..9).to_a.each_with_object([]) do |row, col|
        col << [field.chart[row][index].y, field.chart[row][index].x] if field.chart[row][index].z == '*'
      end
    end
    set_array(full, boat, :v, field)
  end

  def self.auto_horizontal_set(boat, field)
    full = field.map do |array|
      array.each_with_object([]) do |cell, row|
        row << [cell.y, cell.x] if cell.z == '*'
      end
    end
    set_array(full, boat, :h, field)
  end

  def self.set_array(full, boat, param, field)
    var = rebuild_array(full.compact, param).select do |arr|
      arr.each do |a|
        a if a.size >= boat.deck
      end
    end
    array = random_cell(var.reject(&:empty?), boat)
    set_on_field(boat, array, param, field)
  end

  def self.random_cell(array, boat)
    full_arr = []
    array.each do |arr|
      if arr.size > 1
        arr.each do |arr1|
          full_arr << arr1 if arr1.size >= boat.deck
        end
      elsif arr.first.size >= boat.deck
        full_arr << arr.first
      end
    end
    arr = full_arr[rand(0..full_arr.size - 1)]
    if (arr.size - boat.deck).positive?
      arr[rand(0..(arr.size - boat.deck))]
    else
      arr.first
    end
  end

  def self.rebuild_array(array, param)
    full_arr = []
    array.each do |arr|
      arr1 = arr.chunk_while do |i, j|
        uniq_num = j.first - i.first if param == :v
        uniq_num = j.last - i.last if param == :h
        j if uniq_num == 1
      end.to_a
      full_arr << arr1.uniq
    end
    full_arr
  end

  def self.set_on_field(boat, arr, direction, field)
    y, x = *arr
    case direction
    when :h then horizontal_set(boat, y, x, field)
    when :v then vertical_set(boat, y, x, field)
    end
  end

  def self.place_on(field, boat)
    field.each do |arr|
      arr.each do |cell|
        boat.size.each do |b|
          cell.z = boat.deck if b.first == cell.y && b.last == cell.x
        end
      end
    end
  end

  def self.set_area_around(field, y, x)
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

  def self.right_side_all(arr, y, x)
    right_side(arr, y, x)
    right_side_front_back(arr, y - 1, x) if y > 1
    right_side_front_back(arr, y + 1, x) if y < 10
  end

  def self.left_side_all(arr, y, x)
    left_side(arr, y, x)
    left_side_front_back(arr, y - 1, x) if y > 1
    left_side_front_back(arr, y + 1, x) if y < 10
  end

  def self.both_sides_all(arr, y, x)
    both_sides(arr, y, x)
    both_sides_front_back(arr, y - 1, x) if y > 1
    both_sides_front_back(arr, y + 1, x) if y < 10
  end

  def self.both_sides_front_back(arr, y, x)
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

  def self.both_sides(arr, y, x)
    arr.each_cons(3) do |prev, cell, nxt|
      next unless y == cell.y && x == cell.x

      prev.x = x - 1
      prev.z = '-'
      nxt.x = x + 1
      nxt.z = '-'
    end
  end

  def self.right_side(arr, y, x)
    arr.each_cons(2) do |cell, nxt|
      if y == cell.y && x == cell.x
        nxt.x = x + 1
        nxt.z = '-'
      end
    end
  end

  def self.right_side_front_back(arr, y, x)
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

  def self.left_side(arr, y, x)
    arr.each_cons(2) do |prev, cell|
      if y == cell.y && x == cell.x
        prev.x = x - 1
        prev.z = '-'
      end
    end
  end

  def self.left_side_front_back(arr, y, x)
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

  def self.vertical_set(boat, y, x, field)
    y -= 1
    board = boat.deck
    boat.deck.times do
      boat.size << [y += 1, x]
      board -= 1
      set_area_around(field, y, x)
    end
    place_on(field, boat)
  end

  def self.horizontal_set(boat, y, x, field)
    x -= 1
    board = boat.deck
    boat.deck.times do
      boat.size << [y, x += 1]
      board -= 1
      set_area_around(field, y, x)
    end
    place_on(field, boat)
  end
end
