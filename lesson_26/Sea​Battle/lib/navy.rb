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

  def self.set_area_around(map, y, x)
    # field.each do |arr|
    #   arr.each do |cell|
    #     if cell.z != '*' && cell != '-'
    #   end
    # end
  end

  def self.horizontal_plus(boat, y, x, map)
    (x..:j).each_with_index do |sym, index|
      break unless index + 1 <= boat.deck

      boat.size << [y, sym]
    end
    place_on(map, boat)
  end

  def self.horizontal_minus(boat, y, x, map)
    (:a..x).reverse_each.each_with_index do |sym, index|
      break unless index + 1 <= boat.deck

      boat.size << [y, sym]
    end
    place_on(map, boat)
  end

  def self.vertical_plus(boat, y, x, map)
    y -= 1
    boat.deck.times { boat.size << [y += 1, x] }
    set_area_around(map, y, x)
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
