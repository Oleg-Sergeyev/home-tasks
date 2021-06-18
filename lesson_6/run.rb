require_relative 'lib/gym'
require 'date'

arr_date = (Date.today..(Date.today + 5))
arr_time = %w['9-00' '17-00' '20-00']

gym_1 = Gym.new(arr_date, arr_time, 24, 12)

gym_1.load()
#arr_date.each do |day|
#  puts day
#end
#arr_time.each do |day|
#    puts day
#end
