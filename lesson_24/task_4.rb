# frozen_string_literal: true

require_relative 'lib/for'

# class Array
class Array
  include For

  def for(args = nil, &block)
    return to_enum(:for, *args) unless block_given?

    # return to_enum(:for, 10) unless block_given?
    For.my_cycle(args, self, &block)
  end
end

# [1, 2, 3].cycle(2) { |x| p x * x }
# p [4, 7, 2].for(0) { |x| p x }
[1, 2, 3].for(1) { |x| p x * x }
p [4, 7, 2].for
p [1, 2, 3].cycle
p [4, 7, 2].for(3)
p [4, 7, 2].for(-3) # { |x| p x }
p [1, 2, 3].cycle(-3) # { |x| p x }
p [1, 2, 3].cycle(2)
p [0, 1].cycle.first(10)
p [4, 7, 2].for.first(2)
# [4, 7, 2].for { |x| p x }
