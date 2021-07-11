# frozen_string_literal: true

require 'date'

# Task 1
def week_dates(week_num, &block)
  return unless if block_given?

                  arr = (Date.commercial(Time.now.year, week_num, 1)..Date.commercial(Time.now.year, week_num, 7)).to_a
                  arr.each(&block)
                end
end

week_dates(10) do |date|
  print "\n#{date}"
end

# Создайте метод weekends, который извлекает выходные дни (субботы и воскресенья) для текущего года.
# В блок метода должна передаваться последовательность объектов класса Date c выходными от начала до конца года.

# Task 2
