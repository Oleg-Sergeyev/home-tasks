# frozen_string_literal: true

# class Boat
class Boat
  attr_accessor :deck, :size, :area

  SYM = { 1 => :A,
          2 => :B,
          3 => :C,
          4 => :D,
          5 => :E,
          6 => :F,
          7 => :G,
          8 => :H,
          9 => :I,
          10 => :J }.freeze

  include Enumerable

  def initialize(deck)
    @deck = deck
    @size = []
  end

  def each
    return unless block_given?

    size.each do |arr|
      yield "#{arr.first}:#{SYM[arr.last]}"
    end
  end
end
