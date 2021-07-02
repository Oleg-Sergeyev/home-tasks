# frozen_string_literal: true

# Class HomeWork
class HomeWork
  attr_accessor :description, :input_result, :task

  def initialize(input_result, description, task)
    clear
    puts description
    puts "#{INTERED_DATA} #{input_result}"
    method("task#{task}").call
  end

  def task1
    puts "\nIt's ok"
  end

  def task2
    puts "\nIt's ok. Task2 complete"
  end
end
