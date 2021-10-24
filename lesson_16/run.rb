# frozen_string_literal: true

puts `clear`

# Task 1
puts 'Task 1'

# class Integer
class Integer
  BITS = 1024
  def kilobytes
    BITS * self
  end

  def megabytes
    kilobytes * self * BITS
  end

  def gigabytes
    megabytes * self * BITS
  end

  def terabytes
    gigabytes * self * BITS
  end

  def self.format_number(number)
    num_groups = number.to_s.chars.to_a.reverse.each_slice(3)
    num_groups.map(&:join).join('_').reverse
  end
end

puts "\n"
puts Integer.format_number(1.kilobytes)
puts Integer.format_number(1.megabytes)
puts Integer.format_number(1.gigabytes)
puts Integer.format_number(1.terabytes)

# Task 2
puts "\nTask 2"
# class User
class User
  attr_accessor :name, :surname, :patrinimyc, :email

  def initialize
    yield self
  end

  def each(&block)
    return unless block_given?

    [name, surname, patrinimyc, email].each(&block)
  end
end

user1 = User.new do |user|
  user.name = 'Петров'
  user.surname = 'Иван'
  user.patrinimyc = 'Иванович'
  user.email = 'petrov@gmail.com'
end

puts "\n"
user1.each { |data| puts data }
