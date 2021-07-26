# frozen_string_literal: true

# class ViewWords
class ViewWords
  attr_accessor :res_str

  def initialize(str)
    @res_str = []
    @res_str_ext = []
    translation(str)
  end

  def translation(str)
    if str.end_with?(' ')
      space_after_word(str)
    else
      @res_str = searh_start_with(str).merge(searh_include(str)).uniq.sort.to_h
      @res_str[RUNMF] = ENGNMF if @res_str.empty?
    end
  end

  def space_after_word(str)
    str = str.rstrip
    @res_str = search_accurate(str).to_h
    @res_str_ext = searh_start_with(str).merge(searh_include(str)).uniq.sort.to_h
    if @res_str.empty? && !@res_str_ext.empty?
      @res_str = @res_str_ext
    elsif @res_str.empty? && @res_str_ext.empty?
      @res_str[RUNMF] = ENGNMF
    end
  end

  def search_accurate(str)
    LoadWords::ENGRU.select { |k, v| check_word?(k, str) || check_word?(v, str) }
  end

  def searh_start_with(str)
    LoadWords::ENGRU.select { |k, v| k.downcase.start_with?(str) || v.downcase.start_with?(str) }
  end

  def searh_include(str)
    LoadWords::ENGRU.select { |k, v| k.downcase.include?(str) || v.downcase.include?(str) }
  end

  def check_word?(value, str)
    case value
    when /,*\s\(/
      value.split(/,*\s\(|\)/).any? { |word| word == str }
    when str
      true
    end
  end
end
