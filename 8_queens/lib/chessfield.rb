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
    # (:A..:H).each { |s| print "#{s} " }
    (1..8).each { |s| print "#{s} " }
    @chart.each_with_index do |arr, index|
      print "\n#{(index + 1).to_s.ljust(3)}"
      arr.each do |obj|
        print "#{obj.z} "
      end
    end
    puts
  end

  # def set_auto(queen)
  #   y, x = *rand_yx
  #   y, x = *rand_yx while Search.recursive_search(chart, y, x) == true
  #   chart.each do |row|
  #     row.each do |cell|
  #       #set_auto(queen) if cell.y == y && cell.x == x && (1..8).include?(cell.z)
  #       cell.z = queen.num if cell.y == y && cell.x == x #&& !(1..8).include?(cell.z)
  #     end
  #   end
  # end
  def set_q(_queen)
    n = 8
    @queens_in_board = []
    row = 0
    column = 0
    until @queens_in_board.size == n
      if Search.recursive_search(chart, row, column) == true
        row += 1
        while row >= n
          row    = @queens_in_board[-1][0] + 1
          column = @queens_in_board[-1][1]
          puts "Backtracking, deleted: #{@queens_in_board.pop}"
        end
      else
        place_queen(row, column)
        p "placing at #{row} #{column}"
        row = 0
        column += 1

        # chart.each do |row|
        #   row.each do |cell|
        #     # set_auto(queen) if cell.y == y && cell.x == x && (1..8).include?(cell.z)
        #     cell.z = queen.num if cell.y == y && cell.x == x # && !(1..8).include?(cell.z)
        #   end
        # end
        # row = 0
        # column += 1
      end
    end
    @queens_in_board
  end

  def set_auto(queen)
    y, x = *rand_yx
    if Search.recursive_search(chart, y, x) == true
      chart.each do |row|
        row.each do |cell|
          # set_auto(queen) if cell.y == y && cell.x == x && (1..8).include?(cell.z)
          cell.z = queen.num if cell.y == y && cell.x == x # && !(1..8).include?(cell.z)
        end
      end
    else
      set_auto(queen)
    end
  end

  def rand_yx
    y = rand(1..8)
    x = rand(1..8)
    # rand_yx if @array_xy.include?([y, x])
    # @array_xy << [y, x]
    # p @array_xy
    [y, x]
  end

  def search(field, y, x)
    # Search.recursive_search(field, y, x)
  end
end
