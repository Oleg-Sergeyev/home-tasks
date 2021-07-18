# frozen_string_literal: true

puts `clear`
# Task 1
puts 'Task 1'
# class Hello
class Hello
  attr_accessor :name

  def initialize(name = 'Ruby')
    @name = name
  end

  def say
    "Hello, #{name}!"
  end

  def self.say(name = 'Ruby')
    "Hello, #{name}!"
  end
end

p Hello.new('World').say
p Hello.say('World')
p Hello.say

# Task 2
puts "\nTask 2"
# class User
class User
  attr_accessor :full_name

  def initialize(full_name)
    @full_name = full_name
  end

  def each(&block)
    return unless block_given?

    full_name.split(' ').each(&block)
  end
end

user1 = User.new('Some Any SomeAnySome')
user1.each { |data| puts data }

# Task 3
puts "\nTask 3"
# class Group
class Group
  attr_accessor :group

  def initialize(users)
    @group = []
    users.each do |user|
      group.push(User.new(user))
    end
  end

  def each(&block)
    return unless block_given?

    group.each(&block)
  end
end
first = ['Петров Иван Иванович', 'Сидорова Татьяна Михайловна', 'Федякова Ирина Сергеевна', 'Шпак Иван Васильевич']
first_group = Group.new(first)
puts 'Group №1'
first_group.each { |user| puts "#{user.full_name} [class#{user.class}]" }

# Task 4
puts "\nTask 4"
# class
class Foo
  def initialize(hash)
    hash.each do |method, name|
      define_singleton_method method do
        name
      end
    end
  end
end

METHODS = { stop: 'стоять', run: 'бежать', jump: 'прыгать' }.freeze
method = Foo.new(METHODS)
p method.stop
p method.run
p method.jump
method2 = Foo.new(METHODS)
puts "#{method2.class} methods: "
method2.methods.each { |meth| puts meth if METHODS.keys.include?(meth) }

# Task 5
puts "\nTask 5"
# class List
class List
  attr_accessor :args

  def initialize(*args)
    @args = args
  end

  def each(&block)
    return unless block_given?

    args.each(&block)
  end
end

obj = List.new('fvfv', 123, '3434', 555, :some, [1, 2, 'qwerty', [56, 'qwerty'], 8])
obj.each { |element| puts element }
