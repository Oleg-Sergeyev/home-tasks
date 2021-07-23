# frozen_string_literal: true

# class ViewWords
class ViewWords
  attr_accessor :res_str

  def initialize(str)
    @res_str = []
    @res_str = if str.end_with?(' ')
                 search_accurate(str.rstrip).to_h
               else
                 searh_start_with(str).merge(searh_include(str)).uniq.to_h
               end
  end

  def search_accurate(str)
    LoadWords::SOME_WORDS.select { |key, value| [key, value] if key == str }
  end

  def searh_start_with(str)
    LoadWords::SOME_WORDS.select { |key, value| [key, value] if key.downcase.start_with?(str) }
  end

  def searh_include(str)
    LoadWords::SOME_WORDS.select { |key, value| [key, value] if key.downcase.include?(str) }
  end
end
