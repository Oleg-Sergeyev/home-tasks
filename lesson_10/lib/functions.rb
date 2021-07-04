# frozen_string_literal: true

def clear
  puts `clear`
end

def empty_string?(str)
  return true if str.count(' ') == str.length
end

def first_space?(str)
  return true if str.first == ' '
end

def empty?(str)
  return true if str == ''
end

def not_empty?(str)
  return true if str != ''
end

def date?(str)
  return unless str.split('-').size == 3

  day, month, year = *str.split('-')
  Date.valid_date?(year.to_i, month.to_i, day.to_i)
end

def week_days(input_date)
  arr_days = []
  week_begin = Date.commercial(input_date.year, input_date.cweek, 1)
  week_end = Date.commercial(input_date.year, input_date.cweek, 7)
  (week_begin..week_end).each do |day|
    arr_days.push(day.strftime('%d-%m-%Y %A'))
  end
  arr_days
end
