# frozen_string_literal: true

# Class HomeWork
class HomeWork
  attr_accessor :description, :input, :task

  def initialize(description, input, task)
    @tasks_arr = { 1 => method(:task1), 2 => method(:task2), 3 => method(:task3), 4 => method(:task4) }.freeze
    @description = description
    @input = input
    @check = Qualifier.new
    show_description
    @task = task
    check_task(task)
  end

  def check_task(task)
    @tasks_arr[task].call
  end

  def show_description
    puts @description
  end

  def input_str
    print @input
    gets.chomp
  end

  def task1
    colors = MyObject.new(ARR_COLORS)
    str = input_str
    if @check.input(str)
      puts "This color is: #{colors.input_number(str)}"
    else
      puts INPUT_ERROR
    end
  end

  def task2
    week = MyObject.new(ARR_DAYS)
    str = input_str
    if @check.input(str)
      puts "The day is: #{week.input_number(str)}"
    else
      puts INPUT_ERROR
    end
  end

  def task3
    input = input_str
    if empty_string?(input)
      puts "\nAll spaces entered"
    else
      check_task3(input)
    end
  end

  def task4
    check_str(input_str)
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
