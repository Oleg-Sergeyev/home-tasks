# frozen_string_literal: true

require 'date'

# Class WeekDays
class WeekDays
  attr_reader :weeks

  def initialize(arr)
    @mondays = []
    @tuesdays = []
    @wednesdays = []
    @thursdays = []
    @fridays = []
    @saturdays = []
    @sundays = []
    create_weeks(arr)
    @weeks = hash_weeks
  end

  def create_weeks(dates)
    dates.each { |date| identify_date(date) }
  end

  def identify_date(date)
    case date.cwday
    when 1 then @mondays.push(date)
    when 2 then @tuesdays.push(date)
    when 3 then @wednesdays.push(date)
    when 4 then @thursdays.push(date)
    when 5 then @fridays.push(date)
    when 6 then @saturdays.push(date)
    else @sundays.push(date)
    end
  end

  def hash_weeks
    { MON => @mondays,
      TUE => @tuesdays,
      WED => @wednesdays,
      THU => @thursdays,
      FRI => @fridays,
      SAT => @saturdays,
      SUN => @sundays }
  end
end
