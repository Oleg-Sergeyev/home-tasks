# frozen_string_literal: true

# Class Qualifier
class Qualifier
  def number?(number)
    number.to_f.to_s == number.to_s || number.to_i.to_s == number.to_s
  end

  def float?(number)
    number.to_f.to_s == number
  end
end
