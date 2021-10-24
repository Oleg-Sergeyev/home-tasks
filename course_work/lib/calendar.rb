# frozen_string_literal: true

require_relative 'weekdays'
require_relative 'constants'
require_relative 'localisation'
require 'colorize'
require 'date'

# Class Calendar
class Calendar
  attr_reader :weeks

  def initialize(year, month)
    @day_now = Date.today.day
    @arr_dates = dates_in_month(year, month)
    if @arr_dates
      @weeks = WeekDays.new(@arr_dates).weeks
      puts ru_lang_month(year, month).center(17, ' ').colorize(color: :white)
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
      if WEEKEND_DAY_NUMBERS.include?(index + 1)
        print "\n#{name}: ".colorize(color: :yellow)
      else
        print "\n#{name}: ".colorize(color: :white)
      end
      dates.each_with_index do |date, _ind|
        print_row(date, index)
      end
    end
  end

  def ru_lang_month(year, month)
    MONTHS.each do |key, value|
      return "#{value} #{year}" if key == Date.new(year, month, 1).strftime('%B')
    end
  end

  def print_row(date, index)
    day = date.strftime('%d').to_i
    if Date.today == date
      print format("%#{fst_indent(date, index) + digit_indent(date, index)}d ", day).colorize(
        color: :white, background: :red
      )
    else
      print format("%#{fst_indent(date, index) + digit_indent(date, index)}d ", day).colorize(
        colors(index)
      )
    end
  end

  def colors(index)
    if WEEKEND_DAY_NUMBERS.include?(index + 1)
      Hash[color: :yellow]
    else
      Hash[color: :withe]
    end
  end
end
