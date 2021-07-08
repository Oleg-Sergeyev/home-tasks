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
    full_arrays
    print_calendar
  end

  def dates_in_month(year, month)
    first_day = Date.new(year, month, 1)
    last_day = Date.new(year, month, get_last_day(year, month))
    @arr_dates = (first_day..last_day).to_a
  end

  def full_arrays
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
    case true
    when date.monday? then @mondays.push(date)
    when date.tuesday? then @tuesdays.push(date)
    when date.wednesday? then @wednesdays.push(date)
    when date.thursday? then @thursdays.push(date)
    when date.friday? then @fridays.push(date)
    when date.saturday? then @saturdays.push(date)
    else @sundays.push(date)
    end
  end

  def get_last_day(year, month)
    [31, 30, 29, 28].each do |day|
      return day if Date.valid_date?(year, month, day)
    end
  end

  def format1(day, index)
    if (1..7).include?(day.strftime('%d').to_i - index) && day.strftime('%d').to_i <= 7
      2
    else
      0
    end
  end

  def format2(day, index)
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
      dates.each_with_index do |day, _ind|
        print format("%#{format1(day, index) + format2(day, index)}d ", day.strftime('%d').to_i)
      end
    end
  end
end
