# frozen_string_literal: true

# Class Qualifier
class Qualifier
  attr_accessor :str

  def input(str)
    Float(str) # Typecasting and waiting for an error
  rescue StandardError
    # 'This is a string'
  else # This is a number
    if float?(str)
      "It's #{str.to_f.class}, #{negative_sign(str)} and #{odd_number(str)}"
    else
      "It's #{str.to_i.class}, #{negative_sign(str)} and #{even_number(str)}"
    end
  end

  def number(str)
    Float(str)
  rescue StandardError # StandardError => e # puts "Rescued: #{e.inspect}"
    # 'This is a string'
  else
    true
  end

  # Number checks

  def float?(str)
    str.include?('.')
  end

  def negative_sign(str)
    str.to_f.negative? ? NEGATIVE : POSITIVE
  end

  def even_number(str)
    str.to_i.even? ? EVEN : ODD
  end

  # Additional number check after '&&...' eg for '6.0', it must be an even number.

  def odd_number(str)
    str.split('.')[1].length == 1 && str.split('.')[1] == '0' ? EVEN : ODD
  end
end
