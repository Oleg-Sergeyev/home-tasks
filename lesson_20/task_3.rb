# frozen_string_literal: true

require 'tty-table'

# class File
class Human < File
  def self.size(file)
    Methods.calc(File.size(file))
  end

  # module Methods
  module Methods
    def self.calc(size)
      return "#{size} bytes" if size <= 999

      str = ''
      divisions(size).each_with_index do |val, index|
        str = define_hsize(val, index)
      end
      str
    end

    def self.define_hsize(val, index)
      case index
      when 0 then "#{val.round(1)}k"
      when 1 then "#{val.round(1)}M"
      when 2 then "#{val.round(1)}G"
      end
    end

    def self.divisions(size)
      arr = []
      rank = size
      while rank > 999
        rank = rank.to_f / 1024
        arr.push(rank)
      end
      arr
    end
  end
end

# File.hsize(ARGV.first)
# file = 'task_2.rb'
# file = '3_2.MP4'
# puts File.hsize(file)
# puts File.singleton_methods

arr = []
Dir.children(File.dirname('task_3.rb')).sort.each do |f|
  arr.push([f, Human.size(f)])
end
puts (TTY::Table.new(%w[files size], arr)).render(:ascii)
