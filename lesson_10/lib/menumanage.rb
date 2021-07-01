# frozen_string_literal: true

# Class MenuManage
class MenuManage
  def initialize
    @task_arr = TASKS
    start(@task_arr)
  end

  def start(full_array)
    work_task(full_array.first)
  end

  def work_task(task_arr)
    until task_arr.last.nil?
      task = MenuItem.new(task_arr).next_task # Return number completed task
      change_tasks(full_array, task)
    end
  end

  def change_tasks(full_array, task)
    full_array.each do |array|
      return array if array.include?(task)
      return full_array.last if task.zero? || task > arr_last.last  # Array TASK1, start over
    end
  end
end
