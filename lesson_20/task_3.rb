# frozen_string_literal: true

require 'tty-table'

module Dimensions
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

# class File
class Human < File
  DIMENSIONS = [Dimensions::Byte, Dimensions::Kb, Dimensions::Mb, Dimensions::Gb, Dimensions::Tb].freeze
  def self.size(file)
    Methods.get_human_size(File.size(file), &:calc)
  end

  # module Methods
  module Methods
    def self.get_human_size(size)
      return unless block_given?

      hs = ''
      DIMENSIONS.each do |object|
        res = object.calc(size)
        if res
          hs = res.to_s
          break
        end
      end
      hs
    end
  end
end

arr = []
Dir.each_child(__dir__) { |file| arr.push([file, Human.size("#{File.dirname(__FILE__)}/#{file}")]) }
puts (TTY::Table.new(%w[files size], arr)).render(:ascii)
