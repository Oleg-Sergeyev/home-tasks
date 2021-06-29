# frozen_string_literal: true

# Class HomeWork
class HomeWork
  attr_accessor :description, :input, :task

  def initialize(description, input, task)
    tasks_arr = { task1: method(:task1), task2: method(:task2),
                  task3: method(:task3), task4: method(:task4) }.freeze
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

  def task1
    colors = MyObject.new(ARR_COLORS)
    res = colors.input_number(@str)
    if res
      puts "This color is: #{res}"
    else
      puts INPUT_ERROR
    end
  end

  def task2
    week = MyObject.new(ARR_DAYS)
    res = week.input_number(@str)
    if res
      puts "The day is: #{res}"
    else
      puts INPUT_ERROR
    end
  end

  def task3
    if empty_string?(@str)
      puts "\nAll spaces entered"
    else
      check_task3(@str)
    end
  end

  def task4
    check_str(@str)
  end

  def check_str(str)
    if first_space?(str)
      puts THIS_STRING
    else
      res = @check.input(str)
      if res
        puts res
      else
        puts THIS_STRING
      end
    end
  end

  def check_task3(input)
    error = false
    input.split(' ').each do |element|
      next unless !@check.number(element) || @check.float?(element)

      error = true
      puts 'Error in input'
      break
    end
    puts "Max of numbers is: #{input.split(' ').map(&:to_i).max}" if error == false
  end
end
