# frozen_string_literal: true

# class ViewWords
class ViewWords
  attr_accessor :res_str

  def initialize(str)
    @res_str = searh_word(str)
  end

  def searh_word(str)
    LoadWords::SOME_WORDS.select do |key, value|
      return value if str == key
    end
  end
end
