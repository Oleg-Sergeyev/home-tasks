# frozen_string_literal: true

require_relative 'lib/battlefield'
require_relative 'lib/navy'

map = BattleField.new
# puts 'New filed'
# map.view
# puts

ships = Navy.new([4, 4, 2, 1, 3]) # fleet
Navy.set_on_field(ships.fleet[0], [1, 2], :v_plus, map)
# Navy.set_on_field(ships.fleet[1], [1, :f], :v_plus, map)
# Navy.set_on_field(ships.fleet[2], [1, :j], :v_plus, map)
# Navy.set_on_field(ships.fleet[4], [8, :f], :h_minus, map)
map.view
