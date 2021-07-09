# frozen_string_literal: true

require_relative 'lib/calendar'
require_relative 'lib/qualifier'
require 'date'

def input_
  puts `clear`
  print "\nPlease, input year and month like '2001 5', or press enter to view calendar of the current year: "
  gets.chomp
end

def check_data
  arr = input_
  input_ if arr.size < 2
  arr.split(' ').each do |str|
    break unless !Qualifier.number?(str) || Qualifier.float?(str)

    check_data
  end
  view_cal(arr.split(' ').first.to_i, arr.split(' ').last.to_i)
end

def view_cal(year, month)
  puts `clear`
  Calendar.new(year, month)
  puts "\n"
end

check_data
