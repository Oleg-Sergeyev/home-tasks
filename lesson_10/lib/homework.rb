# frozen_string_literal: true

# Class HomeWork
class HomeWork
  attr_accessor :description, :input, :task

  def initialize(description, input, task)
    puts description
    print input
    method("task#{task}").call
  end

  def input_str
    gets.chomp
  end

  def task1
    puts 'task1'
  end
end
