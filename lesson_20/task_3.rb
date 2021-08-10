# frozen_string_literal: true

require 'tty-table'

# class File
class Human < File
  DIMENSIONS = %w[Kb Mb Gb Tb].freeze
  def self.size(file)
    Methods.get_human_size(File.size(file)) { |symbol| return symbol }
  end

  # module Methods
  module Methods
    def self.get_human_size(size)
      return unless block_given?

      yield "#{size} bytes" if size < 999
      DIMENSIONS.each do |arr|
        yield "#{size.round(1)}#{arr}" if (1...999).include?((size = size.to_f / 1024))
      end
    end
  end
end

# File.hsize(ARGV.first)
# file = 'task_2.rb'
# file = '3_2.MP4'
# puts File.hsize(file)
# puts File.singleton_methods

arr = []
# Dir.children(__dir__).sort.each do |f|
#   arr.push([f, Human.size(f)]) #if File.extname(f) == '.rb'
# end

Dir.each_child(__dir__) { |file| arr.push([file, Human.size(file)]) }
puts (TTY::Table.new(%w[files size], arr)).render(:ascii)
