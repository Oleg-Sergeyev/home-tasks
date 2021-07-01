# frozen_string_literal: true

# Class HomeWork
class HomeWork
  attr_accessor :description, :input, :task

  def initialize(description, input, task)
    puts description
    print input
    @str = gets.chomp
    method("task#{task}").call
  end

  def task1
    if not_empty?(@str) && !check_num_str(@str)
      puts "Sum of numbers is: #{@str.split(' ').map(&:to_f).sum.round(2)}"
    else
      puts INPUT_ERROR
    end
  end

  def task2
    if Qualifier.number?(@str) && !Qualifier.float?(@str)
      method_task2(@str.to_i)
    elsif empty?(@str)
      method_task2(@str.to_i)
    else
      puts INPUT_ERROR
    end
  end

  def task3
    if not_empty?(@str) && !Qualifier.number?(@str)
      ARR_COLORS.each { |key, value| puts "Key color is '#{key}'" if value == @str }
    else
      puts INPUT_ERROR
    end
  end

  def task4
    if (@str.split(' ').length % 3).zero? && not_empty?(@str)
      method_task4(@str)
    else
      puts INPUT_ERROR
    end
  end

  def task5
    if not_empty?(@str) && !check_num_str(@str)
      method_task5(*@str.split(' ').map(&:to_i))
    else
      puts INPUT_ERROR
    end
  end

  def task6
    if not_empty?(@str) && !check_num_str(@str)
      method_task6(*@str.split(' ').map(&:to_f))
    else
      puts INPUT_ERROR
    end
  end

  def task7
    if not_empty?(@str) && !check_num_str(@str)
      loop_task7(@str)
    else
      puts INPUT_ERROR
    end
  end

  def task8
    if not_empty?(@str) && !check_num_str(@str)
      @x = 0
      @y = 1
      @num = 1
      print "\nFibonacci row: #{@x} #{@y}"
      puts "\n\nFibonacci number: #{recursion_task8(@num) if @str != ''}"
    else
      puts INPUT_ERROR
    end
  end

  def task9
    if not_empty?(@str) && !check_num_str(@str)
      phi = (1 + Math.sqrt(5)) / 2
      puts "\n\nFibonacci number: #{(((phi**@str.to_i) - (- phi)**-@str.to_i) / Math.sqrt(5)).round(1)}"
    else
      puts INPUT_ERROR
    end
  end

  def recursion_task8(_num_)
    return @y if @num == (@str.to_i)

    @x, @y = @y, (@x + @y)
    print " #{@y}"
    @num += 1
    recursion_task8(@num)
  end
end
