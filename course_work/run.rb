# frozen_string_literal: true

require_relative 'lib/calendar'
require 'date'

month = Calendar.new(2021, 5).weeks

def chk(size, day, index)
  #p day.strftime('%d').to_i
  if day.strftime('%d').to_i - index <= 4 && day.strftime('%d').to_i <= 7 #|| day.strftime('%d').to_i < 5 && index == 1
    #puts "debug:#{day.strftime('%d').to_i}"
    #p day.strftime('%d').to_i - index <= 4 && day.strftime('%d').to_i <= 7
    return 3
  else
    return 0
  end
end

def int(day)
  if day.strftime('%d').to_i < 10
    return 2
  else
    return 0
  end
end

month.each_with_index do |(name, dates), index|
  print "\n#{name}:"
  dates.each_with_index { |day, _ind| print format("%#{chk(dates.size, day, index + 1) + int(day)}d ", day.strftime('%d').to_i) }
end
