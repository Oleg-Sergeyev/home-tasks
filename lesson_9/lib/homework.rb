# frozen_string_literal: true

# Class HomeWork
class HomeWork
  attr_accessor :description, :input, :task

  def initialize(description, input, task)
    tasks_arr = { 7 => method(:task7), 8 => method(:task8), 9 => method(:task9) }.freeze
    puts description
    print input
    @str = gets.chomp
    tasks_arr[task].call
  end

  # Service function

  def empty_string?(str)
    return true if str.count(' ') == str.length
  end

  # Service function

  def first_space?(str)
    return true if str[0] == ' '
  end

  # Home tasks methods 1,2,3,4
  def task7
    loop_task7
  end

  def task8
    @x = 0
    @y = 1
    @num = 1
    print "\nFibonacci row: #{@x} #{@y}"
    recursion_task8(@num)
  end

  def task9
    phi = (1 + Math.sqrt(5)) / 2
    puts "\n\nFibonacci number: #{(((phi**@str.to_i) - (- phi)**-@str.to_i) / Math.sqrt(5)).round(0)}"
  end

  def loop_task7
    x = 0
    y = 1
    n = 1
    print "\nFibonacci row: #{x} #{y}"
    while n <= (@str.to_i - 1)
      x, y = y, (x + y)
      print " #{y}"
      n += 1
    end
    puts "\n\nFibonacci number: #{y}"
  end

  def recursion_task8(_num_)
    @x, @y = @y, (@x + @y)
    @num += 1
    print " #{@y}"
    return @y if @num == (@str.to_i)

    recursion_task8(@num)
  end
end
