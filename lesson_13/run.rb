# frozen_string_literal: true

require 'date'

puts `clear`
# Task 1
# class Building
#   attr_accessor :floor, :entrance, :flat, :elevator, :max_price, :min_price

#   ELEVATORS_ENTRANCE = 2
#   FLATS_FLOOR = 5

#   def initialize
#     @entrance = 2
#     @max_price = max_price
#     @min_price = min_price
#   end

#   def build_floor(floor)
#     @elevator = @entrance * ELEVATORS_ENTRANCE
#     @flat = floor * entrance * FLATS_FLOOR
#   end

#   def everage_cost
#     (max_price + min_price) / 2
#   end
# end

# print "\nВведите количество этажей предполагаемого дома: "
# floors = gets.chomp.to_i
# building1 = Building.new
# building1.build_floor(floors)
# building1.max_price = 6_000_000
# building1.min_price = 16_000_000
# puts "\nПо нормативам построили дом: #{building1.flat} квартир и #{building1.elevator} лифта."
# puts "\nСредняя стоимость кватиры: #{building1.everage_cost}"

# Task 2
# class Chess
#   def initialize(color1, chess_board, color2 = :black)
#     @color1 = color1
#     @color2 = color2
#     @chess_board = ChessBoard.new(chess_board)
#     @pices = add_chess_board(color2) if color2
#   end

#   def add_chess_board(color)
#     chess_board.add(Pieces.new(color))
#   end

#   # Ход фигурой от положения на доске
#   def move(piece, start, finish)
#     if @pices.include?(start)
#       piece.move(start, finish)
#     else
#       'Ход невозможен!'
#     end
#   end

#   # class Pieces
#   class Pieces
#     attr_reader :pawn, :king, :queen, :bishop, :knight, :rook

#     # Инициализация набора фигур
#     def initialize(color)
#       @pawn = Pawn.new(color)
#       @king = King.new(color)
#       @queen = Queen.new(color)
#       @bishop = Bishop.new(color)
#       @knight = Knight.new(color)
#       @rook = Rook.new(color)
#       @pieces = arrange
#     end

#     # Задание начального колчества фигур и их места на доске(матрице) на начало игры
#     def arrange
#       pawns = (0..7).map { |col| set([1, col], pawn) }
#       kings = set([0, 4], king)
#       queens = set([0, 3], queen)
#       bishops = set([[0, 2], [0, 5]], bishop)
#       knights = set([[0, 1], [0, 6]], knight)
#       rooks = set([[0, 0], [0, 7]], rook)
#       @pieces = [pawns, kings, queens, bishops, knights, rooks]
#     end

#     # Установка координат конкретным фигурам и их колчество
#     def set(arr, piece)
#       if arr.first.is_a?
#         arr.each do |element|
#           pieces.push([piece.clone, { coordinate => [element.first, element.last] }])
#         end
#       else
#         pieces.push([piece.clone, { coordinate => [arr.first, arr.last] }])
#       end
#     end
#   end

#   # class Pown
#   class Pown
#     def initialize(color)
#       @color = color
#     end

#     def move_forward(number = 1)
#       [row + number, col]
#     end

#     def attack(direction, number = 1)
#       if direction == :left
#         [row + number, col - number]
#       else
#         [row + number, col + number]
#       end
#     end
#   end
# end

# game = Chess.new(:white, :classic)
# game.move(Chess::Pown, [1, 0], [1, 2])
# Task 3
class Week

  DAYS = ['Понедельник', 'Вторник']

  def days
    DAYS
  end

  def name(&block)
    new_array = []
    each do |element|
      new_array.push(block.call(element))
    end
    new_array
  end
end

#arr = ['Понедельник', 'Вторник'].name { |x| puts x }

Week.new.days.name { |x| puts x }