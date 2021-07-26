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
                 searh_start_with(str, trans).merge(searh_include(str, trans)).uniq.sort.to_h
               end
  end

  def search_accurate(str, trans)
    case trans
    when :eng then LoadWords::ENGRU.select { |k, v| [k, v] if check_word(k, str) == true }
    when :ru then LoadWords::ENGRU.select { |k, v| [k, v] if check_word(v, str) == true }
    end
  end

  def searh_start_with(str, trans)
    case trans
    when :eng then LoadWords::ENGRU.select { |k, v| [k, v] if k.downcase.start_with?(str) }
    when :ru then LoadWords::ENGRU.select { |k, v| [k, v] if v.downcase.start_with?(str) }
    end
  end

  def searh_include(str, trans)
    case trans
    when :eng then LoadWords::ENGRU.select { |k, v| [k, v] if k.downcase.include?(str) }
    when :ru then LoadWords::ENGRU.select { |k, v| [k, v] if v.downcase.include?(str) }
    end
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
