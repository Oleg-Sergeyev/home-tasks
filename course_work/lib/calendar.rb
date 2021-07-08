# frozen_string_literal: true

require 'date'

# Class Calendar
class Calendar
  attr_reader :weeks

  def initialize(year, month)
    @arr_dates = dates_in_month(year, month)
    @mondays = []
    @tuesdays = []
    @wednesdays = []
    @thursdays = []
    @fridays = []
    @saturdays = []
    @sundays = []
    @weeks = []
    full_array
    print_calendar
  end

  def dates_in_month(year, month)
    first_day = Date.new(year, month, 1)
    last_day = Date.new(year, month, get_last_day(year, month))
    @arr_dates = (first_day..last_day).to_a
  end

  def full_array
    @arr_dates.each { |date| days(date) }
    @weeks = { 'ПН' => @mondays,
               'ВТ' => @tuesdays,
               'СР' => @wednesdays,
               'ЧТ' => @thursdays,
               'ПТ' => @fridays,
               'СБ' => @saturdays,
               'ВС' => @sundays }
  end

  def days(date)
    @mondays.push(date) if date.monday?
    @tuesdays.push(date) if date.tuesday?
    @wednesdays.push(date) if date.wednesday?
    @thursdays.push(date) if date.thursday?
    @fridays.push(date) if date.friday?
    @saturdays.push(date) if date.saturday?
    @sundays.push(date) if date.sunday?
  end

  def get_last_day(year, month)
    [31, 30, 29, 28].each do |day|
      return day if Date.valid_date?(year, month, day)
    end
  end

  def chk(day, index)
    if (1..7).include?(day.strftime('%d').to_i - index) && day.strftime('%d').to_i <= 7
      2
    else
      0
    end
  end

  def int(day, index)
    if day.strftime('%d').to_i < 10 && (day.strftime('%d').to_i - index) <= 0
      1
    elsif day.strftime('%d').to_i < 10 && (day.strftime('%d').to_i - index) >= 0
      2
    else
      0
    end
  end

  def print_calendar
    @weeks.each_with_index do |(name, dates), index|
      print "\n#{name}: "
      dates.each_with_index { |day, _ind| print format("%#{chk(day, index) + int(day, index)}d ", day.strftime('%d').to_i) }
    end
  end
end
