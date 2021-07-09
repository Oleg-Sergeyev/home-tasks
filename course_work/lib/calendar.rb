# frozen_string_literal: true

require_relative 'weekdays'
require_relative 'constants'
require 'date'

# Class Calendar
class Calendar
  attr_reader :weeks

  def initialize(year, month)
    @arr_dates = dates_in_month(year, month)
    if @arr_dates
      @weeks = WeekDays.new(@arr_dates).weeks
      print_calendar
    else
      puts ERR_DATE
    end
  end

  def dates_in_month(year, month)
    return unless Date.valid_date?(year, month, 1) && Date.new(year, month, get_last_day(year, month))

    first_day = Date.new(year, month, 1)
    last_day = Date.new(year, month, get_last_day(year, month))
    @arr_dates = (first_day..last_day).to_a
  end

  def get_last_day(year, month)
    LAST_DAYS_IN_MONTH.each do |day|
      return day if Date.valid_date?(year, month, day)
    end
  end

  def fst_indent(date, index)
    day = date.strftime('%d').to_i
    if WEEK_DAY_NUMBERS.include?(day - index) && day <= NUMBER_OF_DAYS_IN_WEEK
      TWO_SPACE
    else
      ZERO_SPACE
    end
  end

  def digit_indent(date, index)
    day = date.strftime('%d').to_i
    if day < TWO_DIGIT_NUMBER && (day - index).negative?
      ONE_SPACE
    elsif day < TWO_DIGIT_NUMBER && (day - index).positive?
      TWO_SPACE
    else
      ZERO_SPACE
    end
  end

  def print_calendar
    @weeks.each_with_index do |(name, dates), index|
      print "\n#{name}: "
      dates.each_with_index do |date, _ind|
        print format("%#{fst_indent(date, index) + digit_indent(date, index)}d ", date.strftime('%d').to_i)
      end
    end
  end
end
