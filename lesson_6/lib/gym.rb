
# Class Gym
class Gym

  def initialize(arr_date, arr_time, maxgamers, mingamers)
    @arr_date = arr_date
    @arr_time = arr_time
    @maxgamers = maxgamers
    @mingamers = mingamers
  end

  attr_accessor :arr_date, :arr_time, :maxgamers, :mingamers

  def load(arr_gamers)
    return unless !@arr_date.include?(arr_gamers[0]) && @arr_time.include?(arr_gamers[1])

    return unless @maxgamers <= arr_gamers[2] && @mingamers >= arr_gamers[2]

    save(arr_gamers)
  end

  def save(array)

  end
end
