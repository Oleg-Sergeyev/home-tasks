# frozen_string_literal: true

# Class HomeWork
class HomeWork
  attr_accessor :description, :input, :task

  def initialize(description, input, task)
    tasks_arr = { 1 => method(:task1), 2 => method(:task2), 3 => method(:task3),
                  4 => method(:task4), 7 => method(:task7), 8 => method(:task8),
                  9 => method(:task9) }.freeze
    @check = Qualifier.new
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

  def task1
    method_task1(*@str.split(' '))
  end

  def task2
    method_task2(@str.to_i)
  end

  def task3
    ARR_COLORS.each { |key, value| puts "Key color is '#{key}'" if value == @str }
  end

  def task4
    arr = @str.split(' ').each_slice(3).to_a
    n = 0
    while n < arr.length
      user = User.new(*arr[n])
      puts "\nClass '#{user.class}' -> #{user.name} #{user.surname} #{user.patronymic}"
      n += 1
    end
  end

  def method_task2(year, curr_year = 2021)
    if year.zero? && Date.new(curr_year, 12, 31).yday == LEAP_YEAR_DAYS
      puts "\n#{curr_year} - #{LEAP_YEAR}"
    elsif !year.zero? && Date.new(year, 12, 31).yday == LEAP_YEAR_DAYS
      puts "\n#{year} - #{LEAP_YEAR}"
    else
      puts "\n#{year.zero? ? curr_year : year} #{COMMON_YAER}"
    end
  end

  def method_task1(*array)
    error = false
    array.each do |element|
      next if @check.number?(element)

      error = true
      puts 'Error in input'
      break
    end
    puts "Sum of numbers is: #{array.map(&:to_f).sum.round(2)}" if error == false
  end

  def task7
    loop_task7
  end

  def task8
    @x = 0
    @y = 1
    @num = 1
    print "\nFibonacci row: #{@x} #{@y}"
    puts "\n\nFibonacci number: #{recursion_task8(@num)}"
  end

  def task9
    phi = (1 + Math.sqrt(5)) / 2
    puts "\n\nFibonacci number: #{(((phi**@str.to_i) - (- phi)**-@str.to_i) / Math.sqrt(5)).round(1)}"
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
    return @y if @num == (@str.to_i)

    @x, @y = @y, (@x + @y)
    print " #{@y}"
    @num += 1
    recursion_task8(@num)
  end
end
