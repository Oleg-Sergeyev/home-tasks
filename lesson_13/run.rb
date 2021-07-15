# frozen_string_literal: true

require 'time'

puts `clear`
# Task 1
# class Building
class Building
  attr_accessor :floor, :entrance, :flat, :elevator, :max_price, :min_price

  ELEVATORS_ENTRANCE = 2
  FLATS_FLOOR = 5

  def initialize
    @entrance = 2
    @max_price = max_price
    @min_price = min_price
  end

  def build_floor(floor)
    elevator = entrance * ELEVATORS_ENTRANCE
    flat = floor * entrance * FLATS_FLOOR
  end

  def everage_cost
    (max_price + min_price) / 2
  end
end

print "\nВведите количество этажей предполагаемого дома: "
floors = gets.chomp.to_i
building1 = Building.new
building1.build_floor(floors)
building1.max_price = 6_000_000
building1.min_price = 16_000_000
puts "\nПо нормативам построили дом: #{building1.flat} квартир и #{building1.elevator} лифта."
puts "\nСредняя стоимость кватиры: #{building1.everage_cost}"

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
# class Week
class Week
  attr_reader :nmdays

  DAYS = %w[Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье].freeze
  def initialize
    @nmdays = DAYS
  end

  def days(&block)
    return unless block_given?

    nmdays.each(&block)
  end

  def days_map(&block)
    new_array = []
    nmdays.each do |element|
      new_array.push(block.call(element))
    end
    new_array
  end

  def days_select(&block)
    new_array = []
    nmdays.each do |element|
      res = block.call(element)
      new_array.push(element) if res
    end
    new_array
  end
end

week = Week.new
week.days { |x| p x }

new_arr = week.days_map { |x| "[#{x}]" }
p new_arr

p week.days_select { |v| v.downcase.include?('ник') }

# Task 4
# class Factory
class Factory
  attr_accessor :arr

  def initialize
    @arr = []
  end

  def build(toy)
    case toy
    when :teddy_bear then arr.push(teddy_bear: TeddyBear.new)
    when :ball then arr.push(ball: Ball.new)
    when :cube then arr.push(cube: Cube.new)
    end
  end

  def total
    arr.count
  end

  def offers
    toys = Hash.new(0)
    arr.each do |hash|
      hash.each do |name, _object|
        toys[name] += 1
      end
    end
    toys
  end

  class TeddyBear
  end

  class Ball
  end

  class Cube
  end
end

factory = Factory.new
4.times { factory.build(:teddy_bear) }
5.times { factory.build(:ball) }
3.times { factory.build(:cube) }

puts "\nВсего произведено #{factory.total} игрушек"
print "\nИз них: "
factory.offers.each { |key, value| print "\n#{key} = #{value}" }
puts "\n"

# Task 5
# class Time
class Time
  MORNING = (Time.parse('06:00:00')..Time.parse('11:59:59')).freeze
  DAY = (Time.parse('12:00:00')..Time.parse('17:59:59')).freeze
  EVENING = (Time.parse('18:00:00')..Time.parse('23:59:59')).freeze
  NIGHT = (Time.parse('00:00:00')..Time.parse('05:59:59')).freeze

  def hello
    return "\nДоброе утро!" if MORNING.cover?(Time.now)
    return "\nДобрый день!" if DAY.cover?(Time.now)
    return "\nДобрый вечер!" if EVENING.cover?(Time.now)
    return "\nДобрый ночи!" if NIGHT.cover?(Time.now)
  end
end

time = Time.new
puts time.hello

# Task 6
# class Integer
class Integer
  MSEC = 60
  HSEC = 3_600
  DSEC = 86_400
  def minutes
    self * MSEC
  end

  def hours
    self * HSEC
  end

  def days
    self * DSEC
  end
end

puts "#{5.minutes} сек."
puts "#{5.hours} сек."
puts "#{5.days} сек."

# Task 7
# class Substace
class Substance
  attr_accessor :state

  STATES = { solid: %i[deposit freeze], gaz: %i[boil sublime], liquid: %i[condense melt] }.freeze
  RU = { 'твердое' => :solid, 'газообразное' => :gaz, 'жидкое' => :liquid }.freeze
  STATES_RAND = { solid: 1, gaz: 2, liquid: 3 }.freeze
  def initialize
    @state = STATES_RAND.key(rand(1..3))
  end

  def freeze
    status(:freeze)
  end

  def boil
    status(:boil)
  end

  def condense
    status(:condense)
  end

  def sublime
    status(:sublime)
  end

  def deposit
    status(:deposit)
  end

  def melt
    status(:melt)
  end

  def status(act)
    STATES.each do |sym, arr|
      arr.each do |value|
        return check_state(sym) if value == act
      end
    end
  end

  def check_state(act_state)
    if act_state == state
      "Переход вещества в состояние '#{RU.key(act_state)}' невозможен, т.к. начальное состояние'#{RU.key(state)}'"
    else
      "Переход вещества в состояние '#{RU.key(act_state)}', начальное '#{RU.key(state)}'"
    end
  end
end

water = Substance.new
puts water.freeze
ice = Substance.new
puts ice.melt

# Task 8
# class Substance
#   state_machine :state, :initial => :sub_state do
#     before_transition :on => :some_event1, :do => :method1
#     after_transition :on => :some_event2, :do => :method2
#   end
#   event :some_event1 do
#     transition [] => :sub_state1
#   end
#   event :some_event2 do
#     transition [:yyy, :xxx] => :sub_state2
#   end

#   state :sub_state do
#     def some
#       0
#     end
#   end

#   state :xxx, :yyy do
#     def some
#       0
#     end
#   end
# end
