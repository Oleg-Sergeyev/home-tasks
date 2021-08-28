# frozen_string_literal: true

require_relative 'lib/battlefield'
require_relative 'lib/navy'

map = BattleField.new
puts `clear`

ships = Navy.new([4, 3, 3, 2, 2, 2, 1, 1, 1, 1]) # fleet
ships.fleet.each do |boat|
  Navy.set_boats_on_map(boat, map)
end
map.view
