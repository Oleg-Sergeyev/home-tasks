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
end
