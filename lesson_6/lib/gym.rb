# frozen_string_literal: true

# Class Gym
class Gym
  def initialize(name, arr_date, arr_time, maxplayers, minplayers)
    @name = name
    @arr_date = arr_date
    @arr_time = arr_time
    @maxplayers = maxplayers
    @minplayers = minplayers
  end

  attr_accessor :name, :arr_date, :arr_time, :maxplayers, :minplayers

  def load(arr_players)
    return unless !@arr_date.include?(arr_players[0]) && @arr_time.include?(arr_players[1])

    return unless @maxplayers <= arr_players[2] && @minplayers >= arr_players[2]

    save(arr_players)
  end

  def save(array)

  end
end
