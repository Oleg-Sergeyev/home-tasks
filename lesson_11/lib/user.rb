# frozen_string_literal: true

# Class User
class User
  attr_accessor :name, :score

  def initialize(name, score)
    @name = name
    @score = score
  end
end
