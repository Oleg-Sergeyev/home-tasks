# frozen_string_literal: true

require 'date'

# Task 1
# def week_dates(week_num, &block)
#   return unless if block_given?

#                   arr = (Date.commercial(Time.now.year, week_num, 1)..Date.commercial(Time.now.year, week_num, 7)).to_a
#                   arr.each(&block)
#                 end
# end

# week_dates(10) { |date| puts date }

# Task 2

# def weekends(year)
#   return unless if block_given?

#                   (Date.new(year, 1, 1)..Date.new(year, 12, 31)).to_a.each do |date|
#                     yield date if [6, 7].include?(date.cwday)
#                   end
#                 end
# end

# weekends(2021) { |date| puts date }

# Task 3

# def walk(array, &block)
#   return unless if block_given?
#                   array.each do |arr|
#                     walk(arr) if arr.instance_of?(Array)
#                     arr.each(&block)
#                   end
#                 end
# end

# arr = [[[1, 2], 3], [4, 5, 6], [7, [8, 9], [10, [11, 12]]]]
# walk(arr) { |i| puts i }

# Task 4

# def add_function(num)
#   return @y if num == @num_to_f

#   @x, @y = @y, (@x + @y)
#   @arr.push(@y)
#   num += 1
#   add_function(num)
# end

# def fibonacci(num_to_f, &block)
#   @x = 0
#   @y = 1
#   @num_to_f = num_to_f
#   @arr = []
#   add_function(1)
#   return if block_given? && !@arr.each(&block)
# end

# fibonacci(10) { |f| print "#{f} " }

# (*) Создайте полный аналог стандартного итератора map. Назовите его my_map.
# (*) Создайте полный аналог стандартного итератора метода select. Назовите его my_select.
# (*) Создайте полный аналог стандартного итератора метода reduce. Назовите его my_reduce.

# Task 5
# class Array
#   def my_map(&block)
#     new_array = []
#     each do |element|
#       new_array.push(block.call(element))
#     end
#     new_array
#   end
# end

# new_arr = [1, 2, 3, 4, 5].my_map do |x|
#   x * x
# end
# p new_arr

# new_arr2 = [1, 2, 3].my_map(&:to_f)
# p new_arr2

# Task 6
# class Array
#   def my_select(&block)
#     new_array = []
#     each do |element|
#       res = block.call(element)
#       new_array.push(element) if res == true
#     end
#     new_array
#   end
# end

# new_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9].my_select(&:even?)
# p new_arr

# Task 6
class Array
  def my_reduce(fst_param, &block)
    sum = fst_param
    each do |element|
      sum += block.call(sum, element)
    end
    sum
  end
end

new_arr = [1, 3, 5].my_reduce(0) { |sum, n| sum + (3 * n) }
p new_arr
