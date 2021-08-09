# frozen_string_literal: true

# class Unit
class Unit
  attr_accessor :param

  def initialize(users)
    @param = MyArray.new
    users.each do |hash|
      hash.each { |k, v| @param.set(Employee.new(k, v)) }
    end
  end

  def report(sort = :name)
    if sort == :name
      puts @param.each.map { |employee| employee.data.join(',') }.sort { |a, b| a <=> b }
    else
      puts @param.each.map { |employee| "#{employee.data[1]}, #{employee.data[0]}" }.sort { |a, b| a <=> b }
    end
  end

  def add(name, role)
    param << Employee.new(name, role)
  end

  def remove(name)
    param.each_with_index do |employee, index|
      param.delete_at(index) if employee.data.first == name
    end
  end

  def rename(old_name, new_name)
    param.each do |employee|
      employee.data[0] = new_name if employee.data.first == old_name
    end
  end

  def redefine_role(name, new_role)
    param.each do |employee|
      employee.data[1] = new_role if employee.data.first == name
    end
  end

  def report_by_role(role)
    param.each do |employee|
      p employee.data.join(',') if employee.data[1] == role
    end
  end

  def report_by_name
    param.each do |employee|
      p employee.data[0]
    end
  end

  # class Employee
  class Employee
    attr_accessor :data

    def initialize(name, role)
      @data = [name, role]
    end
  end

  # class Array
  class MyArray < Array
    attr_accessor :arr

    def initialize
      @arr = []
      super
    end

    def set(employee)
      arr.push(employee)
    end

    def each(&block)
      arr.each(&block)
    end

    def each_with_index(&block)
      arr.each_with_index(&block)
    end

    def delete_at(index)
      arr.delete_at(index)
    end

    def <<(value)
      arr.push(value)
    end
  end
end

unit = [
  { 'Андрей Сидоров' => :boss },
  { 'Сергей Иванов' => :backend },
  { 'Алексей Петров' => :backend },
  { 'Михаил Выгуляев' => :frontend },
  { 'Владимир Филимонов' => :frontend },
  { 'Юрий Безруков' => :tester },
  { 'Татьяна Васильева' => :designer },
  { 'Ольга Василькова' => :accountant }
]

users = Unit.new(unit)
puts '=========== Original, sort by name ============='
users.report   # default sort by name
users.rename('Андрей Сидоров', 'Николай Захаров')
users.remove('Татьяна Васильева')
users.add('Екатерина Тасамая', :designer)
users.redefine_role('Михаил Выгуляев', :backend)
users.redefine_role('Алексей Петров', :frontend)
puts '============ List after some action ============'
users.report
puts '============== Sort all by role ================'
users.report(:role)
puts '================= List by role ================='
users.report_by_role(:backend)
puts '================ List by name =================='
users.report_by_name
