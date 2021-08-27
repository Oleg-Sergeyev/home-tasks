# frozen_string_literal: true

# class Fleet
class Navy
  attr_accessor :fleet

  def initialize(params)
    @fleet = params.map { |deck| Navy::Boat.new(deck) }
  end

  def self.set_on_field(boat, arr, direction, map)
    y, x = *arr
    case direction
    when :h_plus then horizontal_plus(boat, y, x, map)
    when :h_minus then horizontal_minus(boat, y, x, map)
    when :v_plus then vertical_plus(boat, y, x, map)
    when :v_minus then vertical_minus(boat, y, x, map)
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

  def self.set_area_around(map, y, x, board)
    #if y > 1
    map.field.each do |arr|
      arr.each_cons(3) do |prev, cell, nxt|
        if y == cell.y && x == cell.x
          prev.x = x - 1
          prev.z = '-'
          nxt.x = x + 1
          nxt.z = '-'
          cell.z = '-' if board == 10
        end
      end
    end
    set_area_around(map, y += 1, x, 10) if board.zero?
  end

  def set_board(map, y, x)

  end

  # def self.horizontal_plus(boat, y, x, map)
  #   (x..:j).each_with_index do |sym, index|
  #     break unless index + 1 <= boat.deck

  #     boat.size << [y, sym]
  #   end
  #   place_on(map, boat)
  # end

  # def self.horizontal_minus(boat, y, x, map)
  #   (:a..x).reverse_each.each_with_index do |sym, index|
  #     break unless index + 1 <= boat.deck

  #     boat.size << [y, sym]
  #   end
  #   place_on(map, boat)
  # end

  def self.vertical_plus(boat, y, x, map)
    y -= 1
    board = boat.deck
    boat.deck.times do
      boat.size << [y += 1, x]
      board -= 1
      set_area_around(map, y, x, board)
    end
    place_on(map, boat)
  end

  def self.vertical_minus(boat, y, x, map)
    y += 1
    boat.deck.times { boat.size << [y -= 1, x] }
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

    # def create
    #   deck.times { size << [nil, nil] }
    # end

  end
end
