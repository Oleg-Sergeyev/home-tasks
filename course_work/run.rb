# frozen_string_literal: true

require 'date'

#p Date.today.strftime("%^B")
#p Date.today.mday

def days_in_month(year, month)
  Date.new(year, month, -1).day
end

#last_day = days_in_month(Date.today.year, Date.today.month)

first_day = Date.new(2021, 7, 1)
last_day = Date.new(2021, 7, 31)
arr_days = (first_day..last_day).to_a
# print "\nПонедельник "
# arr_days.select(&:monday?).each { |date| print " #{date.strftime('%d')}" }
# print "\nВторник "
# arr_days.select(&:tuesday?).each { |date| print " #{date.strftime('%d')}" }
# print "\nСреда "
# arr_days.select(&:wednesday?).each { |date| print " #{date.strftime('%d')}" }
# print "\nЧетверг "
# arr_days.select(&:thursday?).each { |date| print " #{date.strftime('%d')}" }
# print "\nПятница "
# arr_days.select(&:friday?).each { |date| print " #{date.strftime('%d')}" }
# print "\nСуббота "
# arr_days.select(&:saturday?).each { |date| print " #{date.strftime('%d')}" }
# print "\nВоскресенье "
# arr_days.select(&:sunday?).each { |date| print " #{date.strftime('%d')}" }
mondays = []
tuesdays = []
wednesdays = []
thursdays = []
fridays = []
saturdays = []
sundays = []
month = []
arr_days.each do |date|
  mondays.push(date) if date.monday?
  tuesdays.push(date) if date.tuesday?
  wednesdays.push(date) if date.wednesday?
  thursdays.push(date) if date.thursday?
  fridays.push(date) if date.friday?
  saturdays.push(date) if date.saturday?
  sundays.push(date) if date.sunday?
end
month = [mondays, tuesdays, wednesdays, thursdays, fridays, saturdays, sundays]

month.each { |arr| arr }.each { |day| print " #{day.strftime('%d')}"}

