# frozen_string_literal: true

puts `clear`
# Task 1
puts "\nTask 1"
# class Ship
class Ship
  attr_accessor :name, :type, :missile, :torpedo, :hold, :crane

  def initialize(name)
    @name = name
  end

  def each(&block)
    return unless block_given?

    instance_variables.map { |var| instance_variable_get(var) }.each(&block)
  end
end

# class UnderwaterPosition
class UnderwaterPosition < Ship
end

# class SurfacePosition
class SurfacePosition < Ship
end

puts "\n"
nuclears_ubmarine = UnderwaterPosition.new('Shark')
nuclears_ubmarine.type = 'WarShip'
nuclears_ubmarine.missile = 10
nuclears_ubmarine.torpedo = 12
nuclears_ubmarine.each { |val| puts val }

dry_cargo = SurfacePosition.new('Small Hold')
dry_cargo.type = 'Civil'
dry_cargo.hold = 100_000
dry_cargo.crane = 2
dry_cargo.each { |val| puts val }

container_ship = SurfacePosition.new('Big Container')
container_ship.type = 'Civil'
container_ship.crane = 3
container_ship.each { |val| puts val }

oil_tanker = SurfacePosition.new('Expensive Oil')
oil_tanker.type = 'Civil'
oil_tanker.hold = 500_000
oil_tanker.each { |val| puts val }

missile_cruiser = SurfacePosition.new('Lightning Strike')
missile_cruiser.type = 'WarShip'
missile_cruiser.missile = 40
missile_cruiser.each { |val| puts val }

military_transport = SurfacePosition.new('Ammunition')
military_transport.type = 'WarShip'
military_transport.hold = 100_000
military_transport.missile = 200
military_transport.each { |val| puts val }

# Task 2
puts "\nTask 2"
# class User
class User
  attr_accessor :name, :surname, :patronimyc, :email, :say

  def initialize(name)
    new_user = Object.const_set(name, Class.new)
    @say = new_user.class.to_s.downcase
  end

  def to_s
    say
  end

  def each(&block)
    return unless block_given?

    instance_variables.map { |var| instance_variable_get(var) }.each(&block)
  end
end

guest = User.new('Guest')
guest.name = 'Alex'
guest.email = 'alex@gmail.com'
p guest.to_s
p guest
guest.each { |val| puts val }

admin = User.new('Admin')
admin.name = 'Sergey'
admin.email = 'admin@anydomen.com'
p admin.to_s
p admin
admin.each { |val| puts val }

puts "\nTask 3"
# class Person
class Person
  attr_accessor :name, :surname, :patronimyc

  def initialize
    raise 'Object could not be created' if instance_of?(Person)
  end

  def each(&block)
    return unless block_given?

    instance_variables.map { |var| instance_variable_get(var) }.each(&block)
  end
end

class User < Person
end

class Admin < Person
end

class Moderator < Person
end

# person = Person.new # Error
# p person

user1 = User.new
user1.name = 'Alex'
user1.surname = 'Alexyeyev'
user1.patronimyc = 'Alexyeyevich'
user1.each { |user| puts user }

admin1 = Admin.new
admin1.name = 'Sergey'
admin1.surname = 'Sergeyev'
admin1.patronimyc = 'Vasilievich'
admin1.each { |user| puts user }

moderator1 = Moderator.new
moderator1.name = 'Ivan'
moderator1.surname = 'Petrov'
moderator1.patronimyc = 'Petrovich'
moderator1.each { |user| puts user }

# Task 4
puts "\nTask 4"
# class AnimalKingdom
class AnimalKingdom
  attr_accessor :heterotrophy, :glycogen, :limited_growth, :organ_systems

  def each(&block)
    return unless block_given?

    instance_variables.map { |var| instance_variable_get(var) }.each(&block)
  end
end

class Chordates < AnimalKingdom
  attr_accessor :spine, :scull
end

# class Mammals
class Mammals < Chordates
  attr_accessor :nervous, :muscular, :skin, :digestive, :respiratory, :circulatory, :excretory, :sense, :viviparous
end

class Primates < Mammals
  attr_accessor :big_brain, :complex_behavior, :ability_to_communicate, :tail
end

class Hominids < Primates
  attr_accessor :verticality_torso, :leg_muscles, :chest, :body_proportions
end

class People < Primates
  attr_accessor :developed_brain, :speech_center, :memory, :vestibular
end

class HomoSapiens < People
  attr_accessor :assimilation_experience
end

killer_whale = Mammals.new
killer_whale.glycogen = 'glycogen - yes'
killer_whale.spine = 'spine - yes'
killer_whale.viviparous = 'viviparous - baby killer whale'

monkey = Primates.new
monkey.ability_to_communicate = 'ability_to_communicate - yes'
monkey.tail = 'long tail'

hominids = Hominids.new
hominids.glycogen = 'glycogen - yes'
hominids.spine = 'spine - yes'
hominids.ability_to_communicate = 'ability_to_communicate - yes'

human = HomoSapiens.new
human.glycogen = 'glycogen - yes'
human.spine = 'spine - yes'
human.scull = 'scull - big scull'
human.big_brain = 'big_brain - yes'
human.nervous = 'nervous - nerves to hell'
human.complex_behavior = 'complex_behavior - inexplicable'
human.viviparous = 'viviparous - child'

puts 'Кастака:'
killer_whale.each { |m| puts m }
puts "\nОбезьянка:"
monkey.each { |m| puts m }
puts "\nГоминидис:"
hominids.each { |m| puts m }
puts "\nЧеловек:"
human.each { |m| puts m }
