# frozen_string_literal: true

require 'singleton'
require 'tty-table'

# class Dimensions
class Dimensions
  include Singleton

  def self.human_size(&block)
    return unless block_given?

    res = ''
    [Dimensions::Byte, Dimensions::Kb, Dimensions::Mb, Dimensions::Gb, Dimensions::Tb].each do |object|
      res = block.call(object)
      break if res
    end
    res
  end

  # class Byte
  class Byte
    def self.calc(value)
      "#{value} bytes" if (1...999).include?(value)
    end
  end

  # class Kb
  class Kb
    def self.calc(value)
      res = (value.to_f / 1024).round(1)
      "#{res} Kb" if (1...999).include?(res)
    end
  end

  # class Mb
  class Mb
    def self.calc(value)
      res = ((value.to_f / 1024) / 1024).round(1)
      "#{res} Mb" if (1...999).include?(res)
    end
  end

  # class Gb
  class Gb
    def self.calc(value)
      res = (((value.to_f / 1024) / 1024) / 1024).round(1)
      "#{res} Gb" if (1...999).include?(res)
    end
  end

  # class Tb
  class Tb
    def self.calc(value)
      res = ((((value.to_f / 1024) / 1024) / 1024) / 1024).round(1)
      "#{res} Gb" if (1...999).include?(res)
    end
  end
end

p Dimensions.singleton_methods
arr = []
Dir.each_child(__dir__) do |file|
  full_path = "#{File.dirname(__FILE__)}/#{file}"
  size = File.size(full_path)
  arr << ([file, Dimensions.human_size { |val| val.calc(size) }])
end
puts (TTY::Table.new(%w[files size], arr)).render(:ascii)
