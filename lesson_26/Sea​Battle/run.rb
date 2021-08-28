# frozen_string_literal: true

require_relative 'lib/battlefield'
require_relative 'lib/navy'

map = BattleField.new
# puts 'New filed'
# map.view
# puts

ships = Navy.new([4, 4, 2, 1, 4]) # fleet
Navy.set_on_field(ships.fleet[0], [3, 1], :vertical, map)
# Navy.set_on_field(ships.fleet[1], [2, 3], :vertical, map)
# Navy.set_on_field(ships.fleet[2], [7, 7], :vertical, map)
Navy.set_on_field(ships.fleet[1], [1, 10], :vertical, map)
Navy.set_on_field(ships.fleet[4], [10, 5], :horizontal, map)

Navy.auto_vertical_set(ships.fleet[4], map)
Navy.auto_vertical_set(ships.fleet[3], map)
map.view
