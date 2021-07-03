# frozen_string_literal: true

# Class HomeWork
class Task
  # attr_accessor :description, :input_result, :task

  def initialize(input_result, description, num_task)
    clear
    @input_result = input_result
    puts description
    puts "#{INTERED_DATA} #{input_result}"
    method("task#{num_task}").call
  end

  def task1
    dividend, divider = *@input_result
    if Qualifier.number?(dividend) && Qualifier.number?(divider) && !divider.to_f.zero?
      divider = divider.to_f
      puts "\nResult: #{(dividend.to_f / divider).round(2)}"
    else
      puts INPUT_ERROR
    end
  end

  def task2
    size = @input_result.first
    arr = []
    if Qualifier.number?(size) && !Qualifier.float?(size)
      size.to_i.times { arr.push(rand(0..99)) }
      puts "\nMaximum: #{arr.max} Minimum: #{arr.min}"
      print "\nArray = #{arr}"
    else
      puts INPUT_ERROR
    end
  end

  def task3
    print "\n#{@input_result.first.split(' ').sort}"
  end

  def task4
    if empty?(@input_result.first)
      puts "\n"
      puts week_days(Date.today)
    elsif date?(@input_result.first)
      puts "\n"
      puts week_days(Date.parse(@input_result.first))
    else
      puts INPUT_ERROR
    end
  end
end
