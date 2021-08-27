# frozen_string_literal: true

# class Fleet
class Navy
  attr_accessor :fleet

  def initialize(params)
    @fleet = params.map { |deck| Navy::Boat.new(deck) }
  end

  def self.set_on_field(boat, arr, direction)
    y, x = *arr
    case direction
    when :hor_plus then horizontal_plus(boat, y, x)
    when :hor_minus then horizontal_minus(boat, y, x)
    when :ver_plus then vertical_plus(boat, y, x)
    when :ver_minus then vertical_minus(boat, y, x)
    end
  end

  def self.horizontal_plus(boat, y, x)
    #(x..:j).to_a.each { |a| print "#{a}," }
    (x..:j).each_with_index do |sym, index|
      break unless index + 1 <= boat.deck

      boat.size << [y, sym]
    end
  end

  def self.horizontal_minus(boat, y, x)
    #(:a..x).to_a.each { |a| print "#{a}," }
    p index + 1
    (:a..x).each_with_index do |sym, index|
      break unless index + 1 <= boat.deck

      boat.size << [y, sym]
    end
  end

  def self.vertical_plus(boat, y, x)
    y -= 1
    boat.deck.times { boat.size << [y+=1, sym] }
  end

  def self.vertical_minus(boat, y, x)
    y += 1
    boat.deck.times { boat.size << [y-=1, sym] }
  end

  # class Boat
  class Boat
    attr_accessor :deck, :size

    def initialize(deck)
      @deck = deck
      @size = []
      #create
    end

    # def create
    #   deck.times { size << [nil, nil] }
    # end

  end
end
