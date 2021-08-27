# frozen_string_literal: true

# class BattleField
class BattleField
  attr_accessor :field

  def initialize
    @field = set_cell
  end

  def set_cell
    (1..10).to_a.reduce([]) do |row, num|
      row << (:a..:j).to_a.reduce([]) do |arr, sym|
        arr << BattleField::Cell.new(num, sym)
      end
    end
  end

  # class Cell
  class Cell
    attr_accessor :y, :x

    def initialize(y, x, z = nil)
      @x = x
      @y = y
      @z = z
    end
  end
end
