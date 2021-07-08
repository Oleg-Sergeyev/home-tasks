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
    [31,30,29,28].each do |day|
      return day if Date.valid_date?(year, month, day)
    end
  end
end
