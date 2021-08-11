# frozen_string_literal: true

require 'tty-table'

class Byte
  def self.calc(value)
    value
  end
end

class Kb
  def self.calc(value)
    (value.to_f / 1024).round(1)
  end
end

class Mb
  def self.calc(value)
    ((value.to_f / 1024) / 1024).round(1)
  end
end

class Gb
  def self.calc(value)
    (((value.to_f / 1024) / 1024) / 1024).round(1)
  end
end

# class File
class Human < File
  DIMENSIONS = [Byte, Kb, Mb, Gb].freeze
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
        if (1...999).include?(res)
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
