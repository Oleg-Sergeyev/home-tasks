# frozen_string_literal: true

# class Fleet
class Navy
  attr_accessor :fleet

  def initialize(params)
    @fleet = params.map { |deck| Navy::Boat.new(deck) }
  end

  def self.auto_vertical_set(boat, map)
    full = []
    map.field.each do |array|
      row = []
      array.each do |cell|
        row << [cell.y, cell.x] if cell.z == '*'
      end
      full << row
    end
    var = check_array(full).select { |arr| arr.size >= boat.deck }
    array = random_cell(var, boat)
    set_on_field(boat, array, :horizontal, map)
  end

  def self.random_cell(array, boat)
    arr = array[rand(0..array.size - 1)]
    random_cell(array, boat) if arr.nil?
    if arr.size == boat.deck
      arr.first 
    elsif (arr.size - boat.deck).positive?
      arr[rand(0..(arr.size - boat.deck))]
    end
  end

  def self.check_array(array)
    full_arr = []
    array.each do |arr|
      arr1 = []
      arr.each_cons(2) do |curr, nxt|
        next if nxt.last - curr.last != 1

        arr1 << [curr.first, curr.last]
        arr1 << [nxt.first, nxt.last] if nxt
      end
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
