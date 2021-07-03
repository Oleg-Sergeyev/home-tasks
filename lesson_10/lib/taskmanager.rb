# frozen_string_literal: true

# Class MenuManage
class TaskManager
  attr_accessor :number

  def initialize(name)
    @name = name
    start(TASKS)
  end

  def start(full_array)
    work_task(full_array.first)
  end

  def work_task(task_arr)
    until task_arr.last.nil?
      num_task = MenuItem.new(task_arr).next_task # Return number completed task
      task_arr = change_tasks(TASKS, num_task)
    end
  end

  def change_tasks(full_array, num_task)
    full_array.each do |array|
      return array if array.include?(num_task)
      return full_array.first if num_task.zero? || num_task > full_array.last.last  # Array TASK1, start over
    end
  end
end
