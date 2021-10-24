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
  return if empty_input(arr)

  view_cal(arr.split(' ').first.to_i, arr.split(' ').last.to_i) if chk(arr) == :run
end

def view_cal(year, month)
  puts `clear`
  Calendar.new(year, month)
  puts "\n"
end

def empty_input(arr)
  if arr == ''
    view_cal(Date.today.year, Date.today.month)
  else
    false
  end
end

def chk(arr)
  return :err if arr.size < 2

  arr.split(' ').each do |str|
    break unless !Qualifier.number?(str) || Qualifier.float?(str)

    chk_input
  end
  :run
end

chk_input
