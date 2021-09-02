# frozen_string_literal: true

# Создайте класс Солнечной системы, который предоставляет методы,
# совпадающие с названиями планет. При вызове эти методы должны сообщать
# порядковый номер планеты, считая от Солнца. При попытке обратиться к
# несуществующей планете, класс должен выбрасывать
# исключение NotExistingPlanetException.

# class UserException
class NotExistingPlanetException < RuntimeError
  def err
    # process the exception thrown from inner
    'no such planet'
  end
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

  def method_missing(method, *args, &block)
    self.class.send(method, *args, &block)
  rescue NoMethodError
    puts "Here #{method}"
  end
end

solarsystem = SolarSystem.new
p solarsystem.uranus
p solarsystem.earth
p solarsystem.sun
