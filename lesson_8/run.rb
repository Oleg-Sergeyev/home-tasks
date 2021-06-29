# frozen_string_literal: true

require_relative 'lib/myobject'
require_relative 'lib/qualifier'
require_relative 'lib/functions'
require_relative 'lib/homework'
require_relative 'lib/menuitem'

clear
descr = TASK1[0] # Initial data, all arrays and constants are declared in functions.rb
input = TASK1[1] #
task = TASK1[2]  #
until task.nil?
  clear
  task = MenuItem.new(descr, input, task).next_task
  TASKS.each do |array|
    if array.include?(task)
      descr = array[0]
      input = array[1]
    elsif task.zero? || task > TASK4[2]
      descr = TASK1[0] # Array TASK1, start over
      input = TASK1[1] #
      task = TASK1[2]  #
    end
  end
end
