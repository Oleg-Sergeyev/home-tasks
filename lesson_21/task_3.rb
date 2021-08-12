# frozen_string_literal: true

# module Fivable
module Fivable
  @@object = 1
  def initialize
    p self
    raise "You can create only 5 objects '#{self.class}'" unless @@object <= 5

    @@object += 1
  end
end

# class SomeClass
class SomeClass
  include Fivable
end

6.times { SomeClass.new }
