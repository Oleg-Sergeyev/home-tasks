# frozen_string_literal: true

# class Subject
class TrafficLight
  def drive_up(_observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def drive_off(_observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def light(_state)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# class TraffLight
class TwoWayTrafficLight < TrafficLight
  attr_accessor :state

  def initialize(arr)
    @street1, @street2 = *arr
    @observers = []
    # super
  end

  def drive_up(observer)
    puts "TrafficLight: '#{observer.class.name}' I drove up to a crossroads down the street '#{observer.street}'"
    @observers << observer
  end

  def drive_off(observer)
    puts "#{observer.class.name}: I drove away from the crossroads"
    @observers.delete(observer)
  end

  def light(state)
    puts "TrafficLight: '#{state}'"
    puts "\n"
    @observers.each { |observer| observer.update(state) }
  end

  def start_light
    3.times do
      puts "\nTrafficLight: Attention !!!"
      arr = if rand(0..1).zero?
              { @street1 => :red, @street2 => :green }
            else
              { @street1 => :green, @street2 => :red }
            end
      light(arr)
      sleep 5
    end
  end
end

# class Auto
class Auto
  def update(_state)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# class Bus
class Bus < Auto
  attr_reader :street

  def initialize(street)
    @street = street
    # super
  end

  def update(state)
    puts "#{Bus.name} on '#{street}': I stoped" if state[@street] == :red
    puts "#{Bus.name} on '#{street}': I drove away" if state[@street] == :green
  end
end

# class Truck
class Truck < Auto
  attr_reader :street

  def initialize(street)
    @street = street
    # super
  end

  def update(state)
    puts "#{Truck.name} on '#{street}': I stoped" if state[@street] == :red
    puts "#{Truck.name} on '#{street}': I drove away" if state[@street] == :green
  end
end
