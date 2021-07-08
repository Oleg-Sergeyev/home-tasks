# frozen_string_literal: true

require_relative 'lib/calendar'
require 'date'

month = Calendar.new(2021, 12).weeks

def chk(day, index)
  if (1..5).include?(day.strftime('%d').to_i - index) && day.strftime('%d').to_i <= 7 #|| day.strftime('%d').to_i < 5 && index == 1
    3
  else
    0
  end
end

def int(day)
  if day.strftime('%d').to_i < 10
    2
  else
    0
  end
end

month.each_with_index do |(name, dates), index|
  print "\n#{name}:"
  dates.each_with_index { |day, _ind| print format("%#{chk(day, index + 1) + int(day)}d ", day.strftime('%d').to_i) }
end
