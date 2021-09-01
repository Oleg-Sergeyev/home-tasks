# frozen_string_literal: true

require 'ostruct'

# class Fleet
class Navy
  attr_accessor :composition

  def initialize
    @composition = []
  end

  def each(&block)
    return unless block_given?

    composition.each(&block)
  end

  def getcoords
    point = [rand(1..10), rand(1..10)]
    composition.each do |struct|
      getcoords if struct.coords.equal?(point)
    end
    point
  end
end

fleet = Navy.new
2.times do
  fleet.composition << OpenStruct.new(name: :submarine, missle: rand(1..16), torpedo: rand(1..20),
                                      coords: fleet.getcoords)
end
4.times { fleet.composition << OpenStruct.new(name: :warship, missle: rand(1..16), coords: fleet.getcoords) }
3.times do
  fleet.composition << OpenStruct.new(name: :cargo_warship, hold: rand(500..100), crane: rand(1..2),
                                      coords: fleet.getcoords)
end
fleet.each { |struct| p "#{struct.name} => #{struct.coords}" }
