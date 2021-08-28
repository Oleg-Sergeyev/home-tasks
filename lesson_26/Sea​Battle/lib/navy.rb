# frozen_string_literal: true

# class Fleet
class Navy
  attr_accessor :fleet

  include Enumerable

  def initialize(params)
    @fleet = params.map { |deck| Navy::Boat.new(deck) }
  end

  def each(&block)
    @fleet.each(&block)
  end

  def self.set_boats_on_map(boat, map)
    rand(0..1).zero? ? auto_vertical_set(boat, map) : auto_horizontal_set(boat, map)
  end

  def self.auto_vertical_set(boat, map)
    full = []
    (0..9).to_a.each_with_index do |_col, index|
      row = 0
      col = []
      while row <= 9
        col << [map.field[row][index].y, map.field[row][index].x] if map.field[row][index].z == '*'
        row += 1
      end
      full << col
    end
    var = check_vertical_array(full.compact).select do |arr|
      arr.each do |a|
        a if a.size >= boat.deck
      end
    end
    new_arr = var.reject(&:empty?)
    array = random_cell(new_arr, boat)
    set_on_field(boat, array, :vertical, map)
  end

  def self.auto_horizontal_set(boat, map)
    full = []
    map.field.each do |array|
      row = []
      array.each do |cell|
        row << [cell.y, cell.x] if cell.z == '*'
      end
      full << row
    end
    var = check_array(full).select do |arr|
      arr.each do |a|
        a if a.size >= boat.deck
      end
    end
    new = var.reject(&:empty?)
    array = random_cell(new, boat)
    set_on_field(boat, array, :horizontal, map)
  end

  def self.random_cell(array, boat)
    full_arr = []
    array.select do |arr|
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

  def self.check_array(array)
    full_arr = []
    array.each do |arr|
      arr1 = arr.chunk_while do |i, j|
        j if (j.last - i.last) == 1
      end.to_a
      full_arr << arr1.uniq
    end
    full_arr
  end

  def self.check_vertical_array(array)
    full_arr = []
    array.each do |arr|
      arr1 = arr.chunk_while do |i, j|
        j if (j.first - i.first) == 1
      end.to_a
      full_arr << arr1.uniq
    end
    full_arr
  end

  def self.set_on_field(boat, arr, direction, map)
    y, x = *arr
    case direction
    when :horizontal then horizontal_set(boat, y, x, map)
    when :vertical then vertical_set(boat, y, x, map)
    end
  end

  def self.place_on(map, boat)
    map.field.each do |arr|
      arr.each do |cell|
        boat.size.each do |b|
          cell.z = boat.deck if b.first == cell.y && b.last == cell.x
        end
      end
    end
  end

  def self.set_area_around(map, y, x)
    map.field.each do |arr|
      if x == 1
        right_side(arr, y, x)
        right_side_front_back(arr, y - 1, x) if y > 1
        right_side_front_back(arr, y + 1, x) if y < 10
      elsif x <= 9
        both_sides(arr, y, x)
        both_sides_front_back(arr, y - 1, x) if y > 1
        both_sides_front_back(arr, y + 1, x) if y < 10
      elsif x == 10
        left_side(arr, y, x)
        left_side_front_back(arr, y - 1, x) if y > 1
        left_side_front_back(arr, y + 1, x) if y < 10
      end
    end
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

  def self.vertical_set(boat, y, x, map)
    y -= 1
    board = boat.deck
    boat.deck.times do
      boat.size << [y += 1, x]
      board -= 1
      set_area_around(map, y, x)
    end
    place_on(map, boat)
  end

  def self.horizontal_set(boat, y, x, map)
    x -= 1
    board = boat.deck
    boat.deck.times do
      boat.size << [y, x += 1]
      board -= 1
      set_area_around(map, y, x)
    end
    place_on(map, boat)
  end

  # class Boat
  class Boat
    attr_accessor :deck, :size, :area

    def initialize(deck)
      @deck = deck
      @size = []
      @area = []
    end
  end
end
