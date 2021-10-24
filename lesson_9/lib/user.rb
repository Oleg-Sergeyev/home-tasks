# frozen_string_literal: true

# Class User
class User
  attr_accessor :name, :surname, :patronymic

  def initialize(name, surname, patronymic)
    @name = name
    @surname = surname
    @patronymic = patronymic
  end
end
