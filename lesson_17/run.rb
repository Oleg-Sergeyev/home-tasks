# frozen_string_literal: true

# Task 4
class AnimalKingdom
  attr_accessor :heterotrophy, :glycogen, :limited_growth, :organ_systems
end

class Chordates < AnimalKingdom
  attr_accessor :spine, :scull
end

class Mammals < Chordates
  attr_accessor :nervous, :muscular, :skin, :digestive, :respiratory, :circulatory, :excretory, :sense, :viviparous
end

class Primates < Mammals
  attr_accessor :big_brain, :complex_behavior, :ability_to_communicate

  private

  attr_accessor :tail
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
killer_whale.glycogen = 'yes'
killer_whale.viviparous = 'baby killer whale'

human = HomoSapiens.new
human.glycogen = 'yes'
human.scull = 'big scull'
human.big_brain = 'yes'
human.nervous = 'nerves to hell'
# human.tail = 'tail'
human.viviparous = 'child'

p human
