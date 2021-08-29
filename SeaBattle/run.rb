# frozen_string_literal: true

require_relative 'lib/battlefield'
require_relative 'lib/navy'

(1..nil).each do |num|
  field = BattleField.new
  puts `clear`
  puts '***** Sea Battle *****'
  puts '======================'
  ships = Navy.new(:standart)
  ships.each do |boat|
    Navy.set_boats_on_map(boat, field)
  end
  field.view
  puts '======================'
  puts "Boats #{ships.count}       map №#{num}"
  puts '======================'
  ships.each do |boat|
    puts "<#{boat.deck}> #{boat.map { |el| el }.join(',')}"
  end
  puts '======================'
  puts 'Next map in 5 seconds'
  sleep 5
end
