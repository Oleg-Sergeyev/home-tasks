# frozen_string_literal: true

require_relative 'lib/battlefield'
require_relative 'lib/navy'

map = BattleField.new
# field.field.each { |arr| arr.each { |obj| print "#{obj.x}:#{obj.y} " } }
ships = Navy.new([4, 4, 2, 1, 3])

Navy.set_on_field(ships.fleet[0], [1, :a], :hor_plus)

p ships.fleet[0]