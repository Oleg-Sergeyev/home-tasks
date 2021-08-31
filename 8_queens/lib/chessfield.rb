# frozen_string_literal: true

require_relative 'cell'

# class ChessField
class ChessField
  attr_accessor :solutions

  def initialize
    @solutions = []
  end

  def start
    psn = [1, 2, 3, 4, 5, 6, 7, 8]
    psn = psn.sort_by { rand } until valid_position(psn)

    arrprint(psn)
  end

  def valid_position(psn)
    (0..6).each do |row|
      ((row + 1)..7).each do |col|
        return false if (row - col).abs == (psn[row] - psn[col]).abs
      end
    end
    true
  end

  def arrprint(arr)
    @solutions << arr unless @solutions.include?(arr)
    start if @solutions.size < 92
  end

  def set_cell
    (1..8).to_a.reduce([]) do |row, num|
      row << (1..8).to_a.reduce([]) do |arr, n|
        arr << Cell.new([num, n])
      end
    end
  end

  def set_queen(y, x)
    @chart.each do |row|
      row.each do |cell|
        cell.z = 'W' if cell.y == y && cell.x == x
      end
    end
  end

  def view(arr)
    @chart = set_cell
    (1..8).each_with_index { |row, index| set_queen(arr[index], row) }
    view_sol(arr)
    puts
    print '         '
    print_chessbattle
    puts
  end

  def print_chessbattle
    (:A..:H).each { |s| print "#{s} " }
    @chart.each_with_index do |array, index|
      print "\n#{(index + 1).to_s.ljust(3).rjust(9)}"
      array.each do |obj|
        print "#{obj.z} "
      end
    end
  end

  def view_sol(arr)
    arr.each_with_index do |num, index|
      print "#{num}:#{Cell::SYM[index + 1]}"
      print ' '
    end
    puts
  end
end
