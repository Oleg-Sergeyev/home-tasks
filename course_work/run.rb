# frozen_string_literal: true

require_relative 'lib/calendar'
require 'date'

month = Calendar.new(2021, 7).weeks

def chk(day, index)
  return 4 if day.strftime('%d').to_i - index == 4 && day.strftime('%d').to_i <= 7
end

month.each_with_index do |(name, dates), index|
  print "\n#{name}: "
  dates.each_with_index { |day, _ind| print format("%#{chk(day, index + 1)}d ", day.strftime('%d').to_i) }
end
