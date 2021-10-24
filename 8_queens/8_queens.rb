# frozen_string_literal: true

require_relative 'lib/chessfield'

queens = ChessField.new
queens.start
puts `clear`
puts '   Random solution, from list'
puts
queens.view(queens.solutions[rand(0..93)])
puts
puts "     Total solutions = #{queens.solutions.size}"
puts
puts ' 1   2   3   4   5   6   7   8'
queens.solutions.each { |arr| queens.view_sol(arr) }
