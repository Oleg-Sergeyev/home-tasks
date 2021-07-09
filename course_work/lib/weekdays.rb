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
