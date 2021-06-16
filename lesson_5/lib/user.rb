# Class User
class User
  @@objcouner = 0

  attr_accessor :name, :surname, :patronimyc

  def initialize(name, surname, patronimyc)
    @name = name
    @surname = surname
    @patronimyc = patronimyc
  end

  def count
    @@objcouner = @@objcouner + 1
  end
end
