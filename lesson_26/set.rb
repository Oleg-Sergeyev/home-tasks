# frozen_string_literal: true

require 'set'

# class Array
class Keywords
  attr_reader :kwds

  include Enumerable

  def initialize(array)
    @kwds = to_set1(array)
  end

  def to_set1(array)
    array.uniq.reduce(Set.new) do |set, word|
      set << word.to_sym if string?(word)
    end
  end

  def each(&block)
    return unless block_given?

    kwds.each(&block)
  end

  def to_s
    "Keywords => { #{@kwds.to_a.join(',')} }"
  end

  def [](index)
    kwds.to_a[index].to_sym
  end

  def []=(index, value)
    return unless integer?(index) && string?(value)

    kwds.map!.each_with_index { |val, ind| ind == index ? value.to_sym : val }
  end

  def <<(obj)
    kwds << obj.to_sym if string?(obj)
  end

  def >>(other)
    kwds.delete_if { |word| word == other.to_sym } if string?(other)
  end

  def self.to_set(array)
    array.uniq.reduce(Set.new) do |set, word|
      set << word.to_sym if string?(word)
    end
  end

  def string?(obj)
    raise 'Only string can be added in Keywords' unless obj.respond_to?(:to_str)

    true
  end

  def integer?(obj)
    raise 'Only integer as index' unless obj.respond_to?(:to_int)

    true
  end
end

keywords = Keywords.new(%w[map news ball street news shop])
puts keywords
keywords[1] = 'so-so news'
keywords << 'star'
keywords >> 'star'
# keywords << 156
# keywords['1'] = 123
# keywords['1'] = '123'
keywords >> 'code'
keywords.each { |w| p w.upcase }
p keywords[3]
