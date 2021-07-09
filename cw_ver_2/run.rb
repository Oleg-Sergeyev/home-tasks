# frozen_string_literal: true

require_relative 'lib/calendar'
require_relative 'lib/qualifier'
require 'date'

def input_data
  puts `clear`
  print "\nPlease, input year and month like '2001 5', or press enter to current month: "
  gets.chomp
end

def chk_input
  arr = input_data
  if arr == ''
    view_cal(Date.today.year, Date.today.month)
    return true
  end
  input_ if arr.size < 2
  arr.split(' ').each do |str|
    break unless !Qualifier.number?(str) || Qualifier.float?(str)

    chk_input
  end
  view_cal(arr.split(' ').first.to_i, arr.split(' ').last.to_i)
end

def view_cal(year, month)
  puts `clear`
  Calendar.new(year, month)
  puts "\n"
end

chk_input
