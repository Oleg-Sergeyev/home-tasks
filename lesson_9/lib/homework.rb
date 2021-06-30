# frozen_string_literal: true

# Class HomeWork
class HomeWork
  attr_accessor :description, :input, :task

  def initialize(description, input, task)
    set_tasks
    @check = Qualifier.new
    puts description
    print input
    @str = gets.chomp
    @tasks_arr[task].call
  end

  def set_tasks
    @tasks_arr = { 1 => method(:task1), 2 => method(:task2), 3 => method(:task3),
                   4 => method(:task4), 5 => method(:task5), 6 => method(:task6),
                   7 => method(:task7), 8 => method(:task8), 9 => method(:task9) }.freeze
  end

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
    if (@str.split(' ').length % 3).zero? && @str != ''
      arr = @str.split(' ').each_slice(3).to_a
      n = 0
      while n < arr.length
        user = User.new(*arr[n])
        puts "\nClass '#{user.class}' -> #{user.name} #{user.surname} #{user.patronymic}"
        n += 1
      end
    else
      puts INPUT_ERROR
    end
  end

  def task5
    method_task5(*@str.split(' ').map(&:to_i)) if @str != ''
  end

  def task6
    method_task6(*@str.split(' ').map(&:to_f))
  end

  def method_task6(*arr)
    print "#{arr.map { |element| element / 1000 }} "
  end

  def method_task5(*arr)
    cel, far = *arr
    cel2far = cel * 1.8 + 32
    far2cel = (far - 32) / 1.8
    puts "\n(#{cel})cel.->(#{cel2far.round(0)})far.  (#{far})far.->(#{far2cel.round(0)}).cel"
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
    puts "\n\nFibonacci number: #{recursion_task8(@num) if @str != ''}"
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
