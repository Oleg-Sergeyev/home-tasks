# frozen_string_literal: true

require 'date'

puts `clear`
# Task 1
class Building
  attr_accessor :floor, :entrance, :flat, :elevator

  ELEVATORS_ENTRANCE = 2
  FLATS_FLOOR = 5

  def initialize
    @entrance = 2
  end

  def build_floor(floor)
    @elevator = @entrance * ELEVATORS_ENTRANCE
    @flat = floor * entrance * FLATS_FLOOR
  end
end

print "\nВведите количество этажей предполагаемого дома: "
floors = gets.chomp.to_i
building1 = Building.new
building1.build_floor(floors)
puts "\nПо нормативам построили дом: #{building1.flat} квартир и #{building1.elevator} лифта."
