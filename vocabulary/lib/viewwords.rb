# frozen_string_literal: true

# class ViewWords
class ViewWords
  attr_accessor :res_str

  def initialize(str)
    @res_str = []
    str.match?(/^[a-zA-Z\s]+$/) ? translation(str, :eng) : translation(str, :ru)
  end

  def translation(str, trans)
    @res_str = if str.end_with?(' ')
                 search_accurate(str.rstrip, trans).to_h
               else
                 searh_start_with(str, trans).merge(searh_include(str, trans)).uniq.to_h
               end
  end

  def search_accurate(str, trans)
    case trans
    when :eng then LoadWords::SOME_WORDS.select { |key, value| [key, value] if key == str }
    when :ru then LoadWords::SOME_WORDS.select { |key, value| [key, value] if value == str }
    end
  end

  def searh_start_with(str, trans)
    case trans
    when :eng then LoadWords::SOME_WORDS.select { |key, value| [key, value] if key.downcase.start_with?(str) }
    when :ru then LoadWords::SOME_WORDS.select { |key, value| [key, value] if value.downcase.start_with?(str) }
    end
  end

  def searh_include(str, trans)
    case trans
    when :eng then LoadWords::SOME_WORDS.select { |key, value| [key, value] if key.downcase.include?(str) }
    when :ru then LoadWords::SOME_WORDS.select { |key, value| [key, value] if value.downcase.include?(str) }
    end
  end
end
