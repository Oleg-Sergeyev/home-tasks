# frozen_string_literal: true

# Class MenuManage
class TaskManager
  attr_accessor :number, :competed_task

  def initialize(num_task)
    @num_task = num_task
    @competed_task = false
    start
  end

  def start
    work_task(change_tasks(TASKS, @num_task))
  end

  def work_task(task_arr)
    until task_arr.last.nil?
      num_task = MenuItem.new(task_arr).next_task # Return number completed task
      if !num_task.zero?
        task_arr = change_tasks(TASKS, num_task)
      else
        @competed_task = true
        break
      end
    end
  end

  def change_tasks(full_array, num_task)
    full_array.each do |array|
      return array if array.include?(num_task)
      return full_array.first if num_task.zero? || num_task > full_array.last.last  # Array TASK1, start over
    end
  end
end
