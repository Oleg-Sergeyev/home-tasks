# frozen_string_literal: true

require 'set'

# class Array
class Keywords
  include Enumerable

  def initialize(array)
    @kwds = to_set(array)
  end

  def to_set(array)
    array.uniq.reduce(Set.new) do |set, word|
      set << word.to_sym if string?(word)
    end
  end

  def each(&block)
    return unless block_given?

    @kwds.each(&block)
  end

  def []
    p 'here'
  end

  def <<(obj)
    @kwds << obj.to_sym if string?(obj)
  end

  def >>(other)
    @kwds.delete_if { |word| word == other.to_sym } if string?(other)
  end

  def self.to_set(array)
    array.uniq.reduce(Set.new) do |set, word|
      set << word.to_sym if string?(word)
    end
  end

  def string?(obj)
    raise 'Only string can be added' unless obj.respond_to?(:to_str)

    true
  end
end

keywords = Keywords.new(%w[map news ball street news shop])
keywords << 'star'
keywords >> 'star'
# keywords << 156
keywords >> 'code'
keywords.each { |w| p w.upcase }
keywords[]
