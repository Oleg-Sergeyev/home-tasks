# frozen_string_literal: true

require_relative 'lib/myobject'
require_relative 'lib/qualifier'
require_relative 'lib/functions'
require_relative 'lib/homework'
require_relative 'lib/menuitem'

clear
descr = "\nЗадания №1. Цвет по номеру"
input = "\nInput color number (1-7): "
task = 1
while task != -1
  clear
  task = MenuItem.new(descr, input, task).next_task
  TASKS.each do |array|
    if array.include?(task)
      descr = array[0]
      input = array[1]
    elsif task.zero?
      task = 1
    end
  end
end
