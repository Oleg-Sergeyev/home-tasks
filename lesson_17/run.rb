# frozen_string_literal: true


# Task 3
# class Person
# class Person
#   attr_accessor :name, :surname, :patronimyc

#   def initialize
#     raise 'Object could not be created' if instance_of?(Person)
#   end

#   def each(&block)
#     return unless block_given?

#     instance_variables.map { |var| instance_variable_get(var) }.each(&block)
#   end
# end

# class User < Person
# end

# class Admin < Person
# end

# class Moderator < Person
# end

# # person = Person.new # Error
# # p person

# user1 = User.new
# user1.name = 'Alex'
# user1.surname = 'Alexyeyev'
# user1.patronimyc = 'Alexyeyevich'
# user1.each { |user| puts user }

# admin1 = Admin.new
# admin1.name = 'Sergey'
# admin1.surname = 'Sergeyev'
# admin1.patronimyc = 'Vasilievich'
# admin1.each { |user| puts user }

# moderator1 = Moderator.new
# moderator1.name = 'Ivan'
# moderator1.surname = 'Petrov'
# moderator1.patronimyc = 'Petrovich'
# moderator1.each { |user| puts user }

# Task 4
# class AnimalKingdom
#   attr_accessor :heterotrophy, :glycogen, :limited_growth, :organ_systems

#   def each(&block)
#     return unless block_given?

#     instance_variables.map { |var| instance_variable_get(var) }.each(&block)
#   end
# end

# class Chordates < AnimalKingdom
#   attr_accessor :spine, :scull
# end

# # class Млекопитающих
# class Mammals < Chordates
#   attr_accessor :nervous, :muscular, :skin, :digestive, :respiratory, :circulatory, :excretory, :sense, :viviparous
# end

# class Primates < Mammals
#   attr_accessor :big_brain, :complex_behavior, :ability_to_communicate, :tail
# end

# class Hominids < Primates
#   attr_accessor :verticality_torso, :leg_muscles, :chest, :body_proportions
# end

# class People < Primates
#   attr_accessor :developed_brain, :speech_center, :memory, :vestibular
# end

# class HomoSapiens < People
#   attr_accessor :assimilation_experience
# end

# killer_whale = Mammals.new
# killer_whale.glycogen = 'glycogen - yes'
# killer_whale.spine = 'spine - yes'
# killer_whale.viviparous = 'viviparous - baby killer whale'

# monkey = Primates.new
# monkey.ability_to_communicate = 'ability_to_communicate - yes'
# monkey.tail = 'long tail'

# hominids = Hominids.new
# hominids.glycogen = 'glycogen - yes'
# hominids.spine = 'spine - yes'
# hominids.ability_to_communicate = 'ability_to_communicate - yes'

# human = HomoSapiens.new
# human.glycogen = 'glycogen - yes'
# human.spine = 'spine - yes'
# human.scull = 'scull - big scull'
# human.big_brain = 'big_brain - yes'
# human.nervous = 'nervous - nerves to hell'
# human.complex_behavior = 'complex_behavior - inexplicable'
# human.viviparous = 'viviparous - child'

# puts 'Кастака:'
# killer_whale.each { |m| puts m }
# puts "\nОбезьянка:"
# monkey.each { |m| puts m }
# puts "\nГоминидис:"
# hominids.each { |m| puts m }
# puts "\nЧеловек:"
# human.each { |m| puts m }
