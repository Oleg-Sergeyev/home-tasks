# frozen_string_literal: true

require 'time'

class Hello
  MORNING = (Time.parse('06:00:00')..Time.parse('11:59:59')).freeze
  DAY = (Time.parse('12:00:00')..Time.parse('17:59:59')).freeze
  EVENING = (Time.parse('18:00:00')..Time.parse('23:59:59')).freeze
  NIGHT = (Time.parse('00:00:00')..Time.parse('05:59:59')).freeze

  def greeting
    return "\nДоброе утро!" if MORNING.cover?(Time.now)
    return "\nДобрый день!" if DAY.cover?(Time.now)
    return "\nДобрый вечер!" if EVENING.cover?(Time.now)
    return "\nДобрый ночи!" if NIGHT.cover?(Time.now)
  end
end
