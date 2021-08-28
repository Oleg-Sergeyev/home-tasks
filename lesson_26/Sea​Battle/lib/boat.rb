# frozen_string_literal: true

# class Boat
class Boat
  attr_accessor :deck, :size, :area

  def initialize(deck)
    @deck = deck
    @size = []
  end
end
