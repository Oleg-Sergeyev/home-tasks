# frozen_string_literal: true

require 'interface'

Strategy = interface do
  required_methods :use
end

class StrategyOne
  def use
    puts 'Strategy one'
  end
  implements Strategy
end

class StrategyTwo
  def use
    puts 'Strategy two'
  end
  implements Strategy
end

class StrategyThree
  def use
    puts 'Strategy three'
  end
  implements Strategy
end

class Context
  attr_accessor :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def use_strategy
    strategy.use
  end
end

context = Context.new(StrategyOne.new)

#context.strategy = StrategyOne.new
context.use_strategy

context.strategy = StrategyTwo.new
context.use_strategy

context.strategy = StrategyThree.new
context.use_strategy

MyInterface = interface { required_methods :foo, :bar, :baz }

# Raises an error until 'baz' is defined
class MyClass
  def foo
    puts "foo"
  end

  def bar
    puts "bar"
  end

  def baz
    puts "baz"
  end

  implements MyInterface
end

p m = MyClass.new
