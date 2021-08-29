# frozen_string_literal: true

require_relative 'filling'
require_relative 'boat'

# class Fleet
class Navy
  attr_accessor :fleet

  include Filling
  include Enumerable

  def initialize(params)
    @fleet = params.map { |deck| Boat.new(deck) }
  end

  def each(&block)
    @fleet.each(&block)
  end

  class << self
    def set_boats_on_map(boat, field)
      rand(0..1).zero? ? vertical_set(boat, field) : horizontal_set(boat, field)
    end

    def vertical_set(boat, field)
      free_cells = (0..9).to_a.map do |index|
        (0..9).to_a.each_with_object([]) do |row, col|
          y = field.chart[row][index].y
          x = field.chart[row][index].x
          z = field.chart[row][index].z
          col << [y, x] if z == '*'
        end
      end
      get_boat_coordinates(free_cells, boat, :v, field)
    end

    def horizontal_set(boat, field)
      free_cells = field.map do |array|
        array.each_with_object([]) do |cell, row|
          row << [cell.y, cell.x] if cell.z == '*'
        end
      end
      get_boat_coordinates(free_cells, boat, :h, field)
    end

    def get_boat_coordinates(full, boat, param, field)
      var = rebuild_free_cells_array(full.compact, param).select do |arr|
        arr.each do |a|
          a if a.size >= boat.deck
        end
      end
      array = random_cell(var.reject(&:empty?), boat)
      set_on_field(boat, array, param, field)
    end

    def random_cell(array, boat)
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

    def rebuild_free_cells_array(array, param)
      array.reduce([]) do |full, arr|
        full << arr.chunk_while do |i, j|
          uniq_num = j.first - i.first if param == :v
          uniq_num = j.last - i.last if param == :h
          j if uniq_num == 1
        end.to_a
      end
    end

    def set_on_field(boat, arr, direction, field)
      y, x = *arr
      case direction
      when :h then set_boat(boat, y, x, field, :h)
      when :v then set_boat(boat, y, x, field, :v)
      end
    end

    def place_on(field, boat)
      field.each do |arr|
        arr.each do |cell|
          boat.size.each do |b|
            cell.z = boat.deck if b.first == cell.y && b.last == cell.x
          end
        end
      end
    end

    def set_boat(boat, y, x, field, param)
      param == :v ? y -= 1 : x -= 1
      board = boat.deck
      boat.deck.times do
        boat.size << (param == :v ? [y += 1, x] : [y, x += 1])
        board -= 1
        Filling.set_area_around(field, y, x)
      end
      place_on(field, boat)
    end
  end
end