# frozen_string_literal: true

require_relative 'lib/functions'
require_relative 'lib/homework'
require_relative 'lib/menuitem'

clear
task_arr = TASK7 # Initial data, all arrays and constants are declared in functions.rb
until task_arr.last.nil?
  clear
  task = MenuItem.new(task_arr).next_task
  TASKS.each do |array|
    if array.include?(task)
      task_arr = array
    elsif task.zero? || task > TASK9[2]
      task_arr = TASK7 # Array TASK1, start over
    end
  end
end
