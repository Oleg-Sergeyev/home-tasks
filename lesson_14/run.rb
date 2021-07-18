# frozen_string_literal: true

# Task 2
# class User
class User
  attr_accessor :name, :surname, :patronimyc

  def each(&block)
    return unless block_given?

    [name, surname, patronimyc].each(&block)
  end
end

user1 = User.new
user1.name = 'Some'
user1.surname = 'Any'
user1.patronimyc = 'SomeAnySome'
user1.each { |data| puts data }
# Task 3
# class Group
class Group
  attr_accessor 
  def initialize(num)
    #num.times do User.new()
  end

  def each(&block)
    return unless block_given?

  end
end

# # Task 4
# # class
# class Foo
#   attr_accessor :method

#   METHODS = { stop: :STOP, run: :RUN, jump: :JUMP }.freeze
#   def initialize(method = :fly)
#     @method = method
#   end

#   def method_missing(name)
#     if METHODS.key(name)
#       "Method '#{METHODS.key(name)}' exist!"
#     else
#       "Methods name '#{name}' not found"
#     end
#   end
# end

# method = Foo.new(:GROW)
# p method.GROW
# method = Foo.new(:RUN)
# p method.RUN

# # Task 5
# # class List
# class List
#   attr_accessor :args

#   def initialize(*args)
#     @args = args
#   end

#   def each(&block)
#     return unless block_given?

#     args.each(&block)
#   end
# end

# obj = List.new('fvfv', 123, '3434', 555, :some, [1, 2, 'qwerty', [56, 'qwerty'], 8])
# obj.each { |element| puts element }
