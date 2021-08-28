# frozen_string_literal: true

# class BattleField
class BattleField
  attr_accessor :field

  include Enumerable

  def initialize
    @field = set_cell
  end

  def each(&block)
    @field.each(&block)
  end

  def set_cell
    (1..10).to_a.reduce([]) do |row, num|
      # row << (:a..:j).to_a.reduce([]) do |arr, sym|
      row << (1..10).to_a.reduce([]) do |arr, n|
        arr << BattleField::Cell.new(num, n)
      end
    end
  end

  def view
    clear_sea
    print '   '
    (:a..:j).each { |s| print "#{s} " }
    # (1..10).each { |s| print "#{s} " }
    @field.each_with_index do |arr, index|
      print "\n#{(index + 1).to_s.ljust(3)}"
      arr.each do |obj|
        print "#{obj.z} "
      end
    end
    puts
  end

  def clear_sea
    @field.each do |arr|
      arr.each do |cell|
        cell.z = '*' if cell.z == '-'
      end
    end
  end

  # class Cell
  class Cell
    attr_accessor :y, :x, :z

    def initialize(y, x, z = '*')
      @x = x
      @y = y
      @z = z
    end
  end
end
