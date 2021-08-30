# frozen_string_literal: true

# class Boat
class Queen
  attr_accessor :coordinate, :num

  SYM = { 1 => :A,
          2 => :B,
          3 => :C,
          4 => :D,
          5 => :E,
          6 => :F,
          7 => :G,
          8 => :H }.freeze

  include Enumerable

  def initialize(num)
    @num = num
    @coordinate = []
  end

  def each
    return unless if block_given?

                    coordinate.each do |arr|
                      yield "#{arr.first}:#{SYM[arr.last]}"
                    end
                  end
  end
end
