# frozen_string_literal: true

def solve_n_queens(n)
  @queens_in_board = []
  row = 0
  column = 0
  until @queens_in_board.size == n
    if queen_in_row(row) || queen_in_diagonal(row, column, n)
      row += 1
      puts "row1 = #{row}"
      while row >= n
        # puts "row2 = #{row}"
        row    = @queens_in_board[-1][0] + 1
        column = @queens_in_board[-1][1]
        puts "Backtracking, deleted: #{@queens_in_board.pop}"
      end
    else
      place_queen(row, column)
      p "placing at #{row} #{column}"
      row = 0
      column += 1
    end
  end
  @queens_in_board
end

def queen_in_row(row)
  @queens_in_board.find { |r, _c| r == row }
end

def queen_in_diagonal(row, column, n)
  diagonals =
    right_upper_diagonal_for(row, column, n) +
    left_upper_diagonal_for(row, column, n) +
    left_lower_diagonal_for(row, column, n) +
    right_lower_diagonal_for(row, column, n)
  diagonals.any? { |r, c| r == row && c == column } ||
    diagonals.any? { |r, c| @queens_in_board.any? { |qr, qc| r == qr && c == qc } }
end

def top_row?(row, n)
  row == n
end

def place_queen(row, column)
  @queens_in_board << [row, column]
end

def right_upper_diagonal_for(row, column, n)
  diagonals = []
  diagonals << [row += 1, column += 1] until row == n || column == n
  diagonals
end

def left_upper_diagonal_for(row, column, n)
  diagonals = []
  diagonals << [row += 1, column -= 1] until row == n || column.zero?
  diagonals
end

def right_lower_diagonal_for(row, column, n)
  diagonals = []
  diagonals << [row -= 1, column += 1] until row.zero? || column == n
  diagonals
end

def left_lower_diagonal_for(row, column, _n)
  diagonals = []
  diagonals << [row -= 1, column -= 1] until row.zero? || column.zero?
  diagonals
end

def print_board(n)
  board = Array.new(n) { Array.new(n) { '.' } }
  @queens_in_board.each { |queen| board[queen[0]][queen[1]] = 'Q' }
  board.map { |n| n.join('|') }.reverse
end
# p solve_n_queens(4)
p solve_n_queens(4)
puts print_board(4)
