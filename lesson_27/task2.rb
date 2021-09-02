# frozen_string_literal: true

# class UserException
class NotExistingPlanetException < RuntimeError
end

# class SolarSystem
class SolarSystem
  PLANTES = { mercury: 1,
              venus: 2,
              earth: 3,
              mars: 4,
              jupiter: 5,
              saturn: 5,
              uranus: 6,
              neptune: 7,
              pluto: 8 }.freeze
  def initialize
    PLANTES.each do |key, _val|
      self.class.send(:define_method, key) { PLANTES[key] }
    end
  end

  def method_missing(method, *_args)
    raise NotExistingPlanetException, "No such planet - '#{method}'"
  rescue NotExistingPlanetException => e
    puts e.message.to_s
  end

  # rubocop requires respond_to_missing? for method_missing
  def respond_to_missing?(_method_name, _include_private = false)
    true
  end
end

solarsystem = SolarSystem.new
p solarsystem.uranus
p solarsystem.earth
solarsystem.sun
solarsystem.earth_13
