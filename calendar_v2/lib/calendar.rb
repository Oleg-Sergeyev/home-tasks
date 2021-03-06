# frozen_string_literal: true

require_relative 'constants'
require_relative 'localisation'
require 'colorize'
require 'date'

# Class Calendar
class Calendar
  attr_accessor :year, :month, :full_arr, :arr_days

  def initialize(year, month)
    @year = year
    @month = month
    @arr_days = []
    @full_arr = []
    7.times { full_arr.push([]) }
    check_and_start(year, month)
  end

  def check_and_start(year, month)
    if days_in_month(year, month)
      check_fst_day(Date.new(year, month, 1))
      puts ru_lang_month(year, month).center(20, ' ').colorize(color: :white)
      print_calendar
    else
      puts ERR_DATE
    end
  end

  def check_fst_day(date)
    day_week(date.cwday - 1)
  end

  def day_week(index)
    arr_days.each do |day|
      full_arr[index].push(day)
      index += 1
      index = 0 if index > 6
    end
  end

  def days_in_month(year, month)
    return unless Date.valid_date?(year, month, 1) && Date.new(year, month, get_last_day(year, month))

    first_day = Date.new(year, month, 1).strftime('%d').to_i
    last_day = Date.new(year, month, get_last_day(year, month)).strftime('%d').to_i
    @arr_days = (first_day..last_day).to_a
  end

  def get_last_day(year, month)
    LAST_DAYS_IN_MONTH.each do |day|
      return day if Date.valid_date?(year, month, day)
    end
  end

  def fst_indent(day, index)
    if WEEK_DAY_NUMBERS.include?(day - index) && day <= NUMBER_OF_DAYS_IN_WEEK
      TWO_SPACE
    else
      ZERO_SPACE
    end
  end

  def digit_indent(day, index)
    if day < TWO_DIGIT_NUMBER && (day - index).negative?
      ONE_SPACE
    elsif day < TWO_DIGIT_NUMBER && (day - index).positive?
      TWO_SPACE
    else
      ZERO_SPACE
    end
  end

  def print_calendar
    full_arr.each_with_index do |dates, index|
      color = Hash[color: WEEKEND_DAY_NUMBERS.include?(index + 1) ? :yellow : :white]
      print "\n#{DAYS_WEEK.key(index + 1)}: ".colorize(color)
      dates.each do |day|
        print_row(day, index)
      end
    end
  end

  def ru_lang_month(year, month)
    "#{MONTHS.key(Date.new(year, month, 1).strftime('%B'))} #{year}"
  end

  def print_row(day, index)
    if Date.today == current_date(day)
      print format("%#{fst_indent(day, index) + digit_indent(day, index)}d ", day).colorize(
        color: :white, background: :red
      )
    else
      print format("%#{fst_indent(day, index) + digit_indent(day, index)}d ", day).colorize(
        colors(index)
      )
    end
  end

  def current_date(day)
    Date.new(year, month, day)
  end

  def colors(index)
    Hash[color: WEEKEND_DAY_NUMBERS.include?(index + 1) ? :yellow : :withe]
  end
end
