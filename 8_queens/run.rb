# frozen_string_literal: true

require_relative 'lib/chessfield'
require_relative 'lib/queen'

field = ChessField.new
queens = 8.times.map { |num| Queen.new(num + 1) }

queens.each { |queen| field.set_q(queen) }

# field.set_auto(queens[0])
# field.set_auto(queens[1])
# field.set_auto(queens[2])
# field.set_auto(queens[3])
# field.set_auto(queens[4])
# field.set_auto(queens[5])
# field.set_auto(queens[6])
# field.set_auto(queens[7])
field.view

# field.search(field.chart, queen[0], 5, 6)
# field.search(field.chart, queen[0], 5, 6)
# field.diagonal_search_free?(field.chart, 6, 5)
# field.diagonal_search_free?(field.chart, 1, 3)
# field.diagonal_search_free?(field.chart, 1, 4)
# field.diagonal_search_free?(field.chart, 1, 5)
# field.diagonal_search_free?(field.chart, 1, 6)
# field.diagonal_search_free?(field.chart, 1, 7)
# field.diagonal_search_free?(field.chart, 1, 8)

# field.diagonal_search_free?(field.chart, 8, 1)
# field.diagonal_search_free?(field.chart, 8, 2)
# field.diagonal_search_free?(field.chart, 8, 3)
# field.diagonal_search_free?(field.chart, 8, 4)
# field.diagonal_search_free?(field.chart, 8, 5)
# field.diagonal_search_free?(field.chart, 8, 6)
# field.diagonal_search_free?(field.chart, 8, 7)
# field.diagonal_search_free?(field.chart, 8, 8)
