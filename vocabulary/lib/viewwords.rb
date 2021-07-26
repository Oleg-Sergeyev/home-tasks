# frozen_string_literal: true

# class ViewWords
class ViewWords
  attr_accessor :res_str

  def initialize(str)
    @res_str = []
    #str.match?(/^[a-zA-Z\s]+$/) ? translation(str, :eng) : translation(str, :ru)
    translation(str)
  end

  def translation(str)
    @res_str = if str.end_with?(' ')
                 search_accurate(str.rstrip).to_h
               else
                 searh_start_with(str).merge(searh_include(str)).uniq.sort.to_h
               end
    @res_str[RUNMF] = ENGNMF if @res_str.empty?
  end

  def search_accurate(str)
    LoadWords::ENGRU.select { |k, v| [k, v] if check_word(k, str) == true || check_word(v, str) == true }
  end

  def searh_start_with(str)
    LoadWords::ENGRU.select { |k, v| [k, v] if k.downcase.start_with?(str) || v.downcase.start_with?(str) }
  end

  def searh_include(str)
    LoadWords::ENGRU.select { |k, v| [k, v] if k.downcase.include?(str) || v.downcase.include?(str) }
  end

  def check_word(value, str)
    case value
    when /,*\s/
      value.split(/,*\s/).each do |word|
        return true if word == str
      end
    when str
      true
    end
  end
end
