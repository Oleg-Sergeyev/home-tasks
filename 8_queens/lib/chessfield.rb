# frozen_string_literal: true

require_relative 'cell'
require_relative 'search'

# class ChessField
class ChessField
  attr_accessor :chart

  include Search
  include Enumerable

  def initialize
    @chart = set_cell
    @main_diagonals = []
  end

  def each(&block)
    @chart.each(&block)
  end

  def set_cell
    (1..8).to_a.reduce([]) do |row, num|
      row << (1..8).to_a.reduce([]) do |arr, n|
        arr << Cell.new([num, n])
      end
    end
  end

  def view
    print '   '
    #(:A..:H).each { |s| print "#{s} " }
    (1..8).each { |s| print "#{s} " }
    @chart.each_with_index do |arr, index|
      print "\n#{(index + 1).to_s.ljust(3)}"
      arr.each do |obj|
        print "#{obj.z} "
      end
    end
    puts
  end

  def set_auto(queen)
    y, x = *rand_yx
    y, x = *rand_yx while Search.hv_search_free?(chart, y, x) == true
    chart.each do |row|
      row.each do |cell|
        #set_auto(queen) if cell.y == y && cell.x == x && (1..8).include?(cell.z)
        cell.z = queen.num if cell.y == y && cell.x == x #&& !(1..8).include?(cell.z)
      end
    end
  end

  def rand_yx
    y = rand(1..8)
    x = rand(1..8)
    [y, x]
  end

  def diagonal_search_free?(field, y, x)
    #Search.diagonal_search_free?(field, y, x)
    Search.top(field, y, x)
    #p @main_diagonals
  end
end
